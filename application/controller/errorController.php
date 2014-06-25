<?php

class errorController{
    protected $pimple = null;
    protected $ex = null;

    public function __construct(Pimple $pimple, Exception $ex){
        $this->pimple = $pimple;
        $this->ex = $ex;
    }

    public function index()
    {
        echo 'Controller: Error , Action: index';
        $sparrow = Flight::get('sparrow');
    }

    public function phpSec(){

    }

}