<?php

class table_log extends Sparrow
{
    public $table = 'tbl_log';

    public function __construct(){
        $databaseConnect = Flight::get('databaseConnect');
        $this->setDb($databaseConnect);
    }


} // end class
 