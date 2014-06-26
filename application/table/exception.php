<?php

class table_exception extends Sparrow
{
    public $table = 'tbl_exception';

    public function __construct(){
        $databaseConnect = Flight::get('databaseConnect');
        $this->setDb($databaseConnect);
    }


} // end class
 