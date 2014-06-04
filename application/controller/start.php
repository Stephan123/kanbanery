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

        $a = 123;
		$test = 123;
        $test2 = 345;
        return;
    }

}