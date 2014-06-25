<?php
/**
 * Bootstrapping Project 'Kanbanery'
 *
 * @author Stephan Krauss
 * @date 03.06.2014
 * @file index.php
 * @project kanbanery
 * @package System
 */

include_once('../vendor/autoload.php');

Flight::route('/', function(){
    _config();
    $pimple = _start();
    include_once('../application/controller/start.php');

    $applicationStart = new start($pimple);
    $applicationStart->index();
});

Flight::route('/@klasse/@aktion', function($klasse, $aktion){
    _config();
    $pimple = _start();
    include_once("../application/controller/".$klasse.'.php');

    $myClass = new $klasse($pimple);
    $myClass->$aktion();
});

Flight::path('../config/');
Flight::path('../application/');
Flight::path('../tool/');

Flight::start();

/********* Bootstrap eigene Methoden **********/

function _config(){
    // $config = Config::singleton('../config');
    $config = new config();
    $config->iniParser('../config/config.ini');
    Flight::set('config',$config);
}

function _start(){
    $pimple = new Pimple();

    $pimple['test'] = 'abcdef';

    return $pimple;
}

function _connectDatabase(){

}