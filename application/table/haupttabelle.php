<?php

class table_haupttabelle extends Sparrow
{
    public $table = 'tbl_haupttabelle';

    public function __construct()
    {
        $this->init();
    }

    public function findAll(){
        $sql = $this
            ->where("insertId = ".$_SESSION['userId'])
            ->select()
            ->sql();

        $rows = $this->many();

        return $rows;
    }
} // end class
 