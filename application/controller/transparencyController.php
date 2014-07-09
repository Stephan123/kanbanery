<?php

class transparencyController implements iToolCrud{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
        $this->params = Flight::get('params');
    }

    public function index()
    {
        try{
            Flight::view()->display('transparancy.html');
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