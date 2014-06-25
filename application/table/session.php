<?php
/**
 * Beschreibung der Klasse
 *
 * Ausführliche Beschreibung der Klasse
 * Ausführliche Beschreibung der Klasse
 * Ausführliche Beschreibung der Klasse
 * 
 * 
 * @author User
 * @date 25.06.14
 * @file session.php
 * @package front | admin | tabelle | data | tools | plugins
 * @subpackage model | controller | filter | validator
 */
class table_session extends Sparrow
{
    public $table = 'sessions';

    public function __construct(){
        $databaseConnect = Flight::get('databaseConnect');
        $this->setDb($databaseConnect);
    }


} // end class
 