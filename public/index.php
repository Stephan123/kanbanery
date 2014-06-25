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
    _connectDatabase();
    $pimple = _start();
    Flight::set('pimple',$pimple);
    include_once('../application/controller/startController.php');

    $applicationStart = new startController($pimple);
    $applicationStart->index();
});

Flight::route('/@klasse/@aktion', function($klasse, $aktion){
    _config();
    _connectDatabase();
    $pimple = _start();
    Flight::set('pimple',$pimple);
    include_once("../application/controller/controller_".$klasse.'.php');

    $klasse = 'controller_'.$klasse;
    $myClass = new $klasse($pimple);
    $myClass->$aktion();
});

Flight::map('error', function(Exception $ex){
        include_once('../application/controller/errorController.php');

        $pimple = Flight::get('pimple');
        $applicationStart = new errorController($pimple, $ex);
        $applicationStart->index();
});


// Register Smarty as the view class
// Also pass a callback function to configure Smarty on load
//Flight::register('view', 'Smarty', array(), function($smarty){
//    $smarty->template_dir = './templates/';
//    $smarty->compile_dir = './templates_c/';
//    $smarty->config_dir = './config/';
//    $smarty->cache_dir = './cache/';
//});

Flight::path('../config');
Flight::path('../application');
Flight::path('../tool');

Flight::start();

/********* Bootstrap eigene Methoden **********/

function _config(){
    $toolConfig = new toolConfig('../config/config.ini', true, true);
    Flight::set('toolConfig',$toolConfig);
}

function _start(){
    $pimple = new Pimple();

    $pimple['test'] = 'abcdef';

    return $pimple;
}

function _connectDatabase(){
    $toolConfig = Flight::get('toolConfig');
    $databaseConnect = $toolConfig->getSection('datenbank');
    Flight::set('databaseConnect',$databaseConnect);

    return;
}