<?php

class start{

    public function go(){
        echo 'go';

        $modleTest = new model_test();
        $modleTest->test();

        return;
    }

    public function index(){
        echo 'index';

        return;
    }

}