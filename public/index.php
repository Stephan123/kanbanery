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
    include_once('../application/start.php');
});

Flight::route('/@name', function($name){
    include_once('../application/'.$name.'.php');
});

Flight::start();