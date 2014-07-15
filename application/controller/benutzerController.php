<?php

class benutzerController implements iToolCrud
{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        try{
            $this->pimple = $pimple;
                $this->params = Flight::get('params');

            // Zugriffskontrolle
            $zugriff  = array(
                'index' => 5,
                'create' => 6,
                'read' => 4,
                'update' => 4,
                'delete' => 3
            );

            if($_SESSION['rolleId'] < $zugriff[$this->params['action']])
                throw new toolException('Keine Zugriffsrechte für Controller: '.$this->params['controller'].' Action: '.$this->params['action'].' Benutzer: '.$_SESSION['userId'], 1);
        }
        catch(Exception $e){
            throw $e;
        }
    }

    public function index()
    {
        try{
            // checkIndex


            $tabelleHaupttabelle = new table_haupttabelle();

            $insert = array(
                'name' => 'Feuerstein',
                'vorname' => 'Fred'
            );

            $query = $tabelleHaupttabelle
                ->insert($insert)
                ->sql();

            $insertId = $tabelleHaupttabelle->execute();

            $tabelleHaupttabelle->findAll();

            // throw new toolException('Error', 10);

            return;
        }
        catch(Exception $e){
            throw $e;
        }

    }

    public function create(){}

    public function read(){}

    public function update(){}

    public function delete(){}

}