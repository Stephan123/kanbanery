<?php

class datenbankController implements iToolCrud{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
        $this->params = Flight::get('params');
    }

    public function create(){

    }

    public function read(){
        try{
            $tabelleLog = new table_log();
            $rows = $tabelleLog->many();

            var_dump($rows);
        }
        catch(Exception $e){

        }
    }

    public function update(){}

    public function delete(){}

}