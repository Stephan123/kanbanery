<?php
/**
* Test der handlebars.js
*
* @author Stephan Krauß , 24.58.2014
* @copyright Herden Studienreisen
*
* @package backend
* @subpackage controller
*/

class handlebarsController implements iToolCrud{
    protected $pimple = null;
    protected $params = null;
    protected $twig = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
        $this->params = Flight::get('params');
    }

    public function index()
    {
        try{
            $values = array(
                'id' => '25',
                'sprachen_id' => 22,
                'Anrede' => 'Herr'
            );

            Flight::view()->display('bausteine/handlebars.html',$values);
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

    public function dataFormTeil2()
    {
        $data = array(
            'region' => 'Sachsen',
            'AO_City_ID' => '11',
            'AO_City' => 'Bla',
            'aktiv' => '2',
            'bettensteuer' => 'Blub'
        );

        $response = json_encode($data);

        echo $response;
    }

    public function dataGrid()
    {
        $grid = array();

        $grid[] = array(
            'name' => 'Krauß',
            'vorname' => 'Stephan'
        );

        $grid[] = array(
            'name' => 'Krauß',
            'vorname' => 'Antje'
        );

        $grid[] = array(
            'name' => 'Krauß',
            'vorname' => 'Thomas'
        );

        $grid[] = array(
            'name' => 'Krauß',
            'vorname' => 'Matthias'
        );

        $jsonGrid = json_encode($grid);

        echo $jsonGrid;
    }

}