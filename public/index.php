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

Flight::route('/', function()
{
    _config();
    _connectDatabase();
    _params();
    _session();

    $pimple = _start();
    Flight::set('pimple',$pimple);
    include_once('../application/controller/startController.php');

    $applicationStart = new startController($pimple);
    $applicationStart->index();
});

Flight::route('/@klasse/@aktion', function($klasse, $aktion){
    _config();
    _connectDatabase();
    _params();
    _session();

    $pimple = _start();
    Flight::set('pimple',$pimple);
    include_once("../application/controller/".$klasse.'Controller.php');

    $klasse = $klasse.'Controller';
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

function _params()
{
    $request = Flight::request();

    $getObj = $request->query;
    $get = $getObj->getData();

    $postObj = $request->data;
    $post = $postObj->getData();

    $params = array_merge($post, $get);

    Flight::set('params', $params);

    return;
}

function _session(){
    $databaseConnect = Flight::get('databaseConnect');
    $toolSessionHandler = new toolSessionHandler();
    $toolSessionHandler->setDbDetails($databaseConnect['hostname'], $databaseConnect['username'], $databaseConnect['password'], $databaseConnect['database']);
    $toolSessionHandler->setDbTable('tbl_session');

    session_set_save_handler(array($toolSessionHandler, 'open'),
                             array($toolSessionHandler, 'close'),
                             array($toolSessionHandler, 'read'),
                             array($toolSessionHandler, 'write'),
                             array($toolSessionHandler, 'destroy'),
                             array($toolSessionHandler, 'gc'));

    register_shutdown_function('session_write_close');

    session_start();
}