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
 * @date 30.06.14
 * @file toolLogger.php
 * @package front | admin | tabelle | data | tools | plugins
 * @subpackage model | controller | filter | validator
 */
class toolLogger {

    public static function logTable($label, $file, $line, $message = null){

         $insert = array(
             'label' => $label,
             'file' => $file,
             'line' => $line
         );

         $trace = debug_backtrace();
         $trace = json_encode($trace);
         $insert['trace'] = $trace;

         if(!is_null($message))
             $insert['message'] = $message;

         /** @var $tabelleLog Sparrow */
         $tabelleLog = new table_log();
         $tabelleLog->insert($insert)->execute();
    }




} // end class
 