<?php

class startController{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;

        $this->params = Flight::get('params');
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

            $sessionId = session_id();

            $test = array(
                'bla' => '111',
                'blub' => 'abc'
            );

            $_SESSION['auth'] = $test;
            $wert = $_SESSION['auth'];

            throw new toolException('Error', 10);
        }
        catch(Exception $e){
            throw $e;
        }

    }

    public function phpSec(){

    }

    public function twig(){
        try{
            $data = array(
                'name' => 'Krauß',
                'vorname' => 'Stephan'
            );

            Flight::view()->display('start.html', $data);
        }
        catch(Exception $e){

        }
    }

    public function log(){
            try{
               toolLogger::logTable('my Label', __FILE__, __LINE__, 'die Information');
            }
            catch(Exception $e){

            }
        }

}