<?php

class table_haupttabelle extends Sparrow
{
    public $table = 'tbl_haupttabelle';

    public function __construct(){
        $databaseConnect = Flight::get('databaseConnect');
        $this->setDb($databaseConnect);

        $this->sql("set @userId = ".$_SESSION['userId']);
        $this->execute();

        $this->sql("set @companyId = ".$_SESSION['companyId']);
        $this->execute();

        $this->sql("set @languageId = ".$_SESSION['languageId']);
        $this->execute();

        $this->sql("set @rolleId = ".$_SESSION['rolleId']);
        $this->execute();
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
 