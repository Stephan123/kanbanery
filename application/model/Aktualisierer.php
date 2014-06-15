<?php

namespace stephan123\kanbanery\model;

class Aktualisierer{

    protected  $verbindungObj = null;
    protected $tasks = null;
    protected $pimple;
    private $sparrow;

    public function __construct(\Pimple $pimple){
        $this->pimple = $pimple;

        $this->verbindungObj = $pimple['verbindungObj'];
        $this->sparrow = $pimple['sparrowObj'];
    }



    public function aktualisiereDich()
    {


        if(!$this->verbindungObj->isConnected()){
            throw new \Exception('Verbindung nicht möglich',1);
        }

        $this->sparrow->from('tasks')->insert(array('title' => 'Login Maske angelegt'))->execute();

    }


}