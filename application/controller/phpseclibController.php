<?php

class phpseclibController{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
        $this->params = Flight::get('params');
    }

    public function verschluesseln(){
        $psl = new phpSec\Core();
        $rand = $psl['crypt/rand'];
        $zufall = $rand->str(10);

        /** @var $hash phpSec\Crypt\Hash */
        $hash = $psl['crypt/hash'];
        $key = $hash->create('stephan');
        $info = $hash->getInfo($key);

        $data = array(
            'zufall' => $zufall,
            'key' => $key,
            'check' => $hash->check('stephan',$key)
        );
//
//        Flight::view()->display('start.html', $data);

        Flight::view()->display('phpseclib.html', $data);
    }

}