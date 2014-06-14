<?php

/**
 * Beschreibung der Klasse
 *
 * Ausführliche Beschreibung der Klasse
 * Ausführliche Beschreibung der Klasse
 * Ausführliche Beschreibung der Klasse
 *
 *
 *
 *
 *
 * @author User
 * @date 14.06.14
 * @file abrufenTaskInfoTest.php
 * @package front | admin | tabelle | data | tools | plugins
 * @subpackage model | controller | filter | validator
 */

class AktualisiererModel{

    protected  $verbindungObj = null;

    public function __construct($verbindung){
        $this->verbindungObj = $verbindung;
    }

    public function aktualisiereDich()
    {

        if($this->verbindungObj == false){
            throw new Exception('Verbindung nicht möglich',1);
        }

    }
}


class aktualisiereTaskInfoTest extends PHPUnit_Framework_TestCase
{
    private $verbindung = true;

    /** @var Exception */
    private $gefangeneException;

    public function testKeineTaskVorhanden()
    {
        // $this->markTestIncomplete('kommt noch');
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
        $this->markTestIncomplete('bbb');
    }

    private function angenommenDieVerbindungIstNichtMöglich()
    {
        $this->verbindung = false;
    }

    private function wennDieTaskInformationenAktualisiertWerden()
    {
        $aktualisiererModel = new AktualisiererModel($this->verbindung);

        try {
            $aktualisiererModel->aktualisiereDich();
        } catch (\Exception $e) {
            $this->gefangeneException = $e;
        }
    }

    private function dannSollEinFehlerGemeldetWerden($string)
    {
        $this->assertNotNull($this->gefangeneException);
        $this->assertEquals($string, $this->gefangeneException->getMessage());
    }

    private function angenommenKeineTaskVorhanden()
    {

    }

    private function dannSollKeinFehlerGemeldetWerden()
    {
        $this->assertNull($this->gefangeneException);
    }

    private function dannSollKeineInformationAbgespeichertWerden()
    {
    }

}
 