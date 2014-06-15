<?php

namespace stephan123\kanbanery\model;


use Exception;
use Pimple;
use Sparrow;

class VerbindungDatenbank
{
    public static $CLASS = __CLASS__;

    protected $connect;
    protected $pimple = null;
    protected $db = null;

    /**
     * @param Pimple $pimple
     * @return $this
     * @throws Exception
     */
    public function setPimple(Pimple $pimple)
    {
        if (!$pimple->offsetExists('connectData')) {
            throw new Exception('Keine Verbindungswerte Datenbank', 1);
        }

        if (!$pimple->offsetExists('sparrow')) {
            throw new Exception('kein Datenbank Objekt', 1);
        }

        $this->pimple = $pimple;

        return $this;
    }

    public function isConnected()
    {
        throw new \Exception('Not implemented');
    }

    /**
     * @return verbindungDatenbank
     */
    public function connectDatabase()
    {
        try{
            /** @var $db Sparrow */
            $db = $this->pimple['sparrow'];
            $this->connect = $db->setDb($this->pimple[ 'connectData' ]);
            $this->db = $db;

            return $this;
        }
        catch(Exception $e){
            throw $e;
        }

    }

    /**
     * @return object
     */
    public function getDatabase()
    {
        return $this->db;
    }
}