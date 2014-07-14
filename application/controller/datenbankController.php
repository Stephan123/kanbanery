<?php

class datenbankController implements iToolCrud{
    protected $pimple = null;
    protected $params = null;

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
        $this->params = Flight::get('params');
    }

    public function create(){

    }

    public function read(){
        try{

            // $tabelleLog = new table_log();
            // $rows = $tabelleLog->many();

            $data = array(
                'product_id'    => 'libgd<script>',
                'component'     => '10', // Fehler
                'versions'      => '2.0.33',
                'testscalar'    => array('2', '23', '10', '12'),
                'testarray'     => '2'
            );

            $filter = array(
                'product_id'   => array(
                    'filter' => FILTER_SANITIZE_ENCODED
                ),
                'component'    => array(
                    'filter'    => FILTER_VALIDATE_INT,
                    'options'   => array(
                        'min_range' => 1,
                        'max_range' => 10
                    )
                ),
                'versions'     => array(
                    'filter' => FILTER_SANITIZE_ENCODED
                ),
                'doesnotexist' => array(
                    'filter' => FILTER_VALIDATE_INT
                ),
                'testscalar'   => array(
                    'filter' => FILTER_VALIDATE_INT,
                ),
                'testarray'    => array(
                    'filter' => FILTER_VALIDATE_INT,
                )
            );

            $toolValidate = new toolValidate();
            $filterResult = $toolValidate
                ->setFilter($filter)
                ->setDataArray($data);
                // ->getFilterResult();
        }
        catch(Exception $e){
            throw $e;
        }
    }

    public function update(){}

    public function delete(){}

}