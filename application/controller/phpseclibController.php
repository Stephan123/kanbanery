<?php

class phpseclibController{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;

        $this->params = Flight::get('params');
    }

    public function index(){
        $psl = new phpSec\Core();
        $rand = $psl['crypt/rand'];
        $wert = $rand->str(10);

        $data = array(
            'wert' => $wert
        );

        Flight::view()->display('start.html', $data);

        Flight::view()->display('phpseclib.html', $data);
    }

}