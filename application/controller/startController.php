<?php

class startController{
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

    public function index()
    {
        try{
            echo 'Action: index';

            /** @var $toolConfig toolConfig */
            $toolConfig = Flight::get('toolConfig');
            $name = $toolConfig->get('name', 'adresse');
            // var_dump($toolConfig);
            $vars = $toolConfig->getSection('adresse');

            $modelTest = new model_test();
            $modelTest->test();

            /** @var $tabelleSession Sparrow */
            $cols = array(
                'data' => '123',
                'expire' => 159
            );

            $tabelleSession = new table_session();
            $query = $tabelleSession->insert($cols)->sql();

            $kontrolle = $tabelleSession->execute();

            // throw new toolException('Error', 10);
            exit();
        }
        catch(Exception $e){
            throw $e;
        }

    }

    public function phpSec(){

    }

}