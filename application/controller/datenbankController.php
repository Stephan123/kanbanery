<?php

class datenbankController implements iToolCrud{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->params = Flight::get('params');
    }

    public function create(){

    }

    public function read(){
        try{
            $tabelleHaupttabelle = new table_haupttabelle();
            $tabelleHaupttabelle->findUserData();

        }
        catch(Exception $e){

        }
    }

    public function update(){}

    public function delete(){}

}