<?php

class vortragController implements iToolCrud{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;

        $this->params = Flight::get('params');
    }

    public function index()
    {
        try{
            $test = 123;

            Flight::view()->display('bausteine/vortrag.html');
        }
        catch(Exception $e){
            throw $e;
        }

    }

    public function create(){
        $test = 123;
    }

    public function read(){
        $test = 123;
    }

    public function update(){
        $test = 123;
    }

    public function delete(){
        $test = 123;
    }

}