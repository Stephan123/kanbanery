<?php

class start{

    public function verbindung(){
        $connectData = array(
            'type'     => 'mysql',
            'hostname' => 'localhost',
            'database' => 'test',
            'username' => 'test',
            'password' => 'test'
        );

        $pimple = new Pimple();
        $pimple['connectData'] = $connectData;
        $pimple['sparrow'] = function () {
            return new Sparrow();
        };

        $verbindungDatenbank = new Model_VerbindungDatenbank();
        $verbindungDatenbank
            ->setPimple($pimple)
            ->connectDatabase()
            ->getDatabase();

        $pimple['verbindungDatenbank'] = $verbindungDatenbank;
    }

    public function go(){
        echo 'go';

        $modleTest = new model_test();
        $modleTest->test();

        return;
    }

    public function index(){
        echo 'index Action';

        return;
    }

}