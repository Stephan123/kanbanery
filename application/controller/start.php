<?php

class start{
    protected $pimple = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
    }

    public function go(){
        echo 'go';

        $modleTest = new model_test();
        $modleTest->test();

        return;
    }

    public function index(){
        echo 'Action: index';

        /** @var $config config */
        $config = Flight::get('config');
        $databaseConnectParams = $config->getValue('datenbank');

        return;
    }

    public function phpSec(){

    }

}