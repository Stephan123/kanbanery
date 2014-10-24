<?php

use rtens\mockster\MockFactory;
use stephan123\kanbanery\model\Aktualisierer;
use stephan123\kanbanery\model\VerbindungDatenbank;

class aktualisiereTaskInfoTest extends PHPUnit_Framework_TestCase
{
    protected $aktualisiererModel;
    private $pimple;
    private $tabelle;

    /** @var Exception */
    private $gefangeneException;

    protected function setUp()
    {
        $mockFactory = new MockFactory();

        $pimple = new Pimple();
        $pimple[ 'verbindungObj' ] = $mockFactory->getInstance(VerbindungDatenbank::$CLASS);
        $pimple[ 'verbindungObj' ]->__mock()->method('isConnected')->willReturn(true);

        $sparrow = $mockFactory->getInstance('Sparrow');
        $pimple[ 'sparrowObj' ] = $sparrow;

        $sparrow->__mock()->method('from')->willReturn($sparrow);
        $sparrow->__mock()->method('insert')->willCall(
            function ($data) use ($sparrow) {
                $this->tabelle[] = $data;
                return $sparrow;
            }
        );

        $this->pimple = $pimple;

        $this->aktualisiererModel = new Aktualisierer($pimple);
    }

    public function testKeineTaskVorhanden()
    {
        $this->angenommenKeineTaskVorhanden();
        $this->wennDieTaskInformationenAktualisiertWerden();
        $this->dannSollKeinFehlerGemeldetWerden();
        $this->dannSollKeineInformationAbgespeichertWerden();

    }

    public function testKeineVerbindungZuKanbanery()
    {
        $this->angenommenDieVerbindungIstNichtMöglich();
        $this->wennDieTaskInformationenAktualisiertWerden();
        $this->dannSollEinFehlerGemeldetWerden('Verbindung nicht möglich');
    }

    public function testTaskMitMinimalerInfo()
    {
        $this->angenommenEsGibtAufKanbaneryEinenTaskMitDemTitel('Login Maske angelegt');
        $this->wennDieTaskInformationenAktualisiertWerden();

        $this->dannSollEsEinenTaskInDerTabelleGeben();
        $this->dannSollEinTaskMitDemTitel_InDerTabelleStehen('Login Maske angelegt');
    }

    private function angenommenDieVerbindungIstNichtMöglich()
    {
        $this->pimple[ 'verbindungObj' ]->__mock()->method('isConnected')->willReturn(false);
    }

    private function wennDieTaskInformationenAktualisiertWerden()
    {

        try {
            $this->aktualisiererModel->aktualisiereDich();

        } catch (\Exception $e) {
            $this->gefangeneException = $e;
        }
    }

    private function dannSollEinFehlerGemeldetWerden($string)
    {
        $this->assertNotNull($this->gefangeneException);
        $this->assertEquals($string, $this->gefangeneException->getMessage());
    }

    private function dannSollKeinFehlerGemeldetWerden()
    {
        $this->assertNull($this->gefangeneException);
    }

    private function dannSollKeineInformationAbgespeichertWerden()
    {

    }

    private function angenommenKeineTaskVorhanden()
    {
    }

    private function angenommenEsGibtAufKanbaneryEinenTaskMitDemTitel($string)
    {

    }

    private function dannSollEsEinenTaskInDerTabelleGeben()
    {

        $this->assertEquals(1, count($this->tabelle));
    }

    private function dannSollEinTaskMitDemTitel_InDerTabelleStehen($string)
    {

        $titles = array_map(
            function ($task) {
                return $task[ 'title' ];
            },
            $this->tabelle
        );

        $this->assertContains($string, $titles);
    }

}
 