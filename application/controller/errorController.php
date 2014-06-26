<?php

class errorController{
    protected $pimple = null;
    protected $ex = null;

    public function __construct(Pimple $pimple,toolException $ex){
        $this->pimple = $pimple;
        $this->ex = $ex;
    }

    public function index()
    {
        $insert = array(
            'message' => $this->ex->getMessage(),
            'code' => $this->ex->getCode(),
            'file' => $this->ex->getFile(),
            'line' => $this->ex->getLine(),
            'trace' => $this->ex->getTraceAsString(),
            'method' => $this->ex->getMethod(),
            'url' => $this->ex->getUrl(),
            'params' => $this->ex->getParams(),
            'session' => $this->ex->getSession()
        );

        /** @var $tabelleException Sparrow */
        $tabelleException = new table_exception();
        $tabelleException->insert($insert)->execute();
        $query = $tabelleException->last_query;

        echo "<br> Fehler: ".$tabelleException->insert_id;
    }

    public function phpSec(){

    }

}