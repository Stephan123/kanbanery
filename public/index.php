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
    include_once('../application/controller/start.php');

    $applicationStart = new start();
    $applicationStart->index();
});

Flight::route('/@klasse/@aktion', function($klasse, $aktion){
    include_once("../application/controller/".$klasse.'.php');

    $myClass = new $klasse();
    $myClass->$aktion();
});

Flight::path('../application/');
Flight::path('../library/');

Flight::start();