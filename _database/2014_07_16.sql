/*
SQLyog Ultimate v11.51 (64 bit)
MySQL - 5.5.27-log : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(10) NOT NULL,
  `comments` text NOT NULL COMMENT 'beschreibende Kommentare',
  PRIMARY KEY (`id`),
  KEY `tbl_tasks` (`tasks_id`),
  CONSTRAINT `tbl_tasks` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

insert  into `comments`(`id`,`tasks_id`,`comments`) values (2,2,'Erstellen Formular Login');

/*Table structure for table `commits` */

DROP TABLE IF EXISTS `commits`;

CREATE TABLE `commits` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(10) NOT NULL COMMENT 'FK tasks',
  `commits` text NOT NULL COMMENT 'Commits Task',
  PRIMARY KEY (`id`),
  KEY `tasks_id` (`tasks_id`),
  CONSTRAINT `tasks_id` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `commits` */

insert  into `commits`(`id`,`tasks_id`,`commits`) values (2,2,'Erster Entwurf des Formular');

/*Table structure for table `discount` */

DROP TABLE IF EXISTS `discount`;

CREATE TABLE `discount` (
  `product_id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discount` */

insert  into `discount`(`product_id`,`value`) values (2,20),(5,10);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`price`) values (1,'Designer t-shirt','99.99'),(2,'Designer shirt','199.99'),(3,'Designer polo','299.99'),(4,'Designer coat','399.99'),(5,'Posh designer shoes','499.99');

/*Table structure for table `tasks` */

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `taskId` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tasks` */

insert  into `tasks`(`id`,`title`,`taskId`) values (2,'Login Maske angelegt','123456');

/*Table structure for table `tbl_exception` */

DROP TABLE IF EXISTS `tbl_exception`;

CREATE TABLE `tbl_exception` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `code` int(3) NOT NULL,
  `file` text NOT NULL,
  `line` int(10) NOT NULL,
  `trace` text NOT NULL,
  `method` varchar(20) DEFAULT NULL,
  `url` text,
  `params` text,
  `session` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_exception` */

insert  into `tbl_exception`(`id`,`message`,`code`,`file`,`line`,`trace`,`method`,`url`,`params`,`session`) values (1,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',47,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(39): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(2,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',47,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(39): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(3,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',47,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(39): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(4,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',36,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(41): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(5,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(41): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}','{\"wert1\":\"wert1\",\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(6,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(40): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(80): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(80): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(7,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(40): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(80): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(80): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(8,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(40): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(80): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(80): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(9,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(10,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(11,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(12,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(58): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(13,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(162): {closure}(Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(14,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(15,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"111wert2=abcdef\"}','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(16,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(42): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(73): Flight::start()\n#13 {main}',NULL,NULL,'[]','{\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(17,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(43): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"start\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(18,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(43): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"start\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(19,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(60): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'start\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"start\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(20,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\benutzerController.php',52,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(60): benutzerController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'benutzer\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"benutzer\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(21,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\benutzerController.php',23,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(59): benutzerController->__construct(Object(Pimple))\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'benutzer\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"benutzer\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(22,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\benutzerController.php',23,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(59): benutzerController->__construct(Object(Pimple))\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'benutzer\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"benutzer\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(23,'Keine Zugriffsrechte ',1,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\benutzerController.php',25,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(59): benutzerController->__construct(Object(Pimple))\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'benutzer\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}',NULL,NULL,'{\"controller\":\"benutzer\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(24,'Keine Zugriffsrechte fÃ¼r Controller: benutzer Action: index Benutzer: 118',1,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\benutzerController.php',23,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(59): benutzerController->__construct(Object(Pimple))\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'benutzer\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}','GET','/benutzer/index/','{\"controller\":\"benutzer\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(25,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(43): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}','GET','/','{\"controller\":\"start\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(26,'Keine Zugriffsrechte fÃ¼r Controller: benutzer Action: index Benutzer: 118',1,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\benutzerController.php',23,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(59): benutzerController->__construct(Object(Pimple))\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(164): {closure}(\'benutzer\', \'index\')\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}','GET','/benutzer/index/','{\"controller\":\"benutzer\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}'),(27,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(43): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(160): {closure}()\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(310): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(75): Flight::start()\n#13 {main}','GET','/','{\"controller\":\"start\",\"action\":\"index\"}','{\"userId\":118,\"companyId\":25,\"languageId\":2,\"rolleId\":5,\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}');

/*Table structure for table `tbl_haupttabelle` */

DROP TABLE IF EXISTS `tbl_haupttabelle`;

CREATE TABLE `tbl_haupttabelle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `vorname` varchar(250) DEFAULT NULL,
  `insertId` int(10) DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateId` int(11) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_haupttabelle` */

insert  into `tbl_haupttabelle`(`id`,`name`,`vorname`,`insertId`,`insertDate`,`updateId`,`updateDate`) values (1,'mustermann','maximilian',NULL,'2014-07-14 19:38:37',NULL,'2014-07-14 19:43:16'),(37,'Feuerstein','Fred',118,'2014-07-15 07:20:51',NULL,NULL),(38,'Feuerstein','Fred',118,'2014-07-15 07:21:32',NULL,NULL);

/*Table structure for table `tbl_log` */

DROP TABLE IF EXISTS `tbl_log`;

CREATE TABLE `tbl_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` varchar(255) NOT NULL,
  `trace` text NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_log` */

insert  into `tbl_log`(`id`,`label`,`file`,`line`,`trace`,`message`) values (1,'my Label','C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php','74','[{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\application\\\\controller\\\\startController.php\",\"line\":74,\"function\":\"logTable\",\"class\":\"toolLogger\",\"type\":\"::\",\"args\":[\"my Label\",\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\application\\\\controller\\\\startController.php\",74,\"die Information\"]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\public\\\\index.php\",\"line\":58,\"function\":\"log\",\"class\":\"startController\",\"object\":{},\"type\":\"->\",\"args\":[]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":166,\"function\":\"{closure}\",\"args\":[\"start\",\"log\",{\"pattern\":\"\\/@klasse\\/@aktion\",\"callback\":{},\"methods\":[\"*\"],\"params\":{\"klasse\":\"start\",\"aktion\":\"log\"},\"regex\":\"\\/(?P<klasse>[^\\/\\\\?]+)\\/(?P<aktion>[^\\/\\\\?]+)\\/?\",\"splat\":\"\\/start\\/log\\/\"}]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":143,\"function\":\"callFunction\",\"class\":\"flight\\\\core\\\\Dispatcher\",\"type\":\"::\",\"args\":[{},[\"start\",\"log\",{\"pattern\":\"\\/@klasse\\/@aktion\",\"callback\":{},\"methods\":[\"*\"],\"params\":{\"klasse\":\"start\",\"aktion\":\"log\"},\"regex\":\"\\/(?P<klasse>[^\\/\\\\?]+)\\/(?P<aktion>[^\\/\\\\?]+)\\/?\",\"splat\":\"\\/start\\/log\\/\"}]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\Engine.php\",\"line\":311,\"function\":\"execute\",\"class\":\"flight\\\\core\\\\Dispatcher\",\"type\":\"::\",\"args\":[{},[\"start\",\"log\",{\"pattern\":\"\\/@klasse\\/@aktion\",\"callback\":{},\"methods\":[\"*\"],\"params\":{\"klasse\":\"start\",\"aktion\":\"log\"},\"regex\":\"\\/(?P<klasse>[^\\/\\\\?]+)\\/(?P<aktion>[^\\/\\\\?]+)\\/?\",\"splat\":\"\\/start\\/log\\/\"}]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":191,\"function\":\"_start\",\"class\":\"flight\\\\Engine\",\"object\":{},\"type\":\"->\",\"args\":[]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":142,\"function\":\"invokeMethod\",\"class\":\"flight\\\\core\\\\Dispatcher\",\"type\":\"::\",\"args\":[[{},\"_start\"],[]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":48,\"function\":\"execute\",\"class\":\"flight\\\\core\\\\Dispatcher\",\"type\":\"::\",\"args\":[[{},\"_start\"],[]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\Engine.php\",\"line\":64,\"function\":\"run\",\"class\":\"flight\\\\core\\\\Dispatcher\",\"object\":{},\"type\":\"->\",\"args\":[\"start\",[]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":191,\"function\":\"__call\",\"class\":\"flight\\\\Engine\",\"object\":{},\"type\":\"->\",\"args\":[\"start\",[]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\core\\\\Dispatcher.php\",\"line\":191,\"function\":\"start\",\"class\":\"flight\\\\Engine\",\"object\":{},\"type\":\"->\",\"args\":[]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\vendor\\\\mikecao\\\\flight\\\\flight\\\\Flight.php\",\"line\":43,\"function\":\"invokeMethod\",\"class\":\"flight\\\\core\\\\Dispatcher\",\"type\":\"::\",\"args\":[[{},\"start\"],[]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\public\\\\index.php\",\"line\":73,\"function\":\"__callStatic\",\"class\":\"Flight\",\"type\":\"::\",\"args\":[\"start\",[]]},{\"file\":\"C:\\\\xampp\\\\htdocs\\\\kanbanery\\\\public\\\\index.php\",\"line\":73,\"function\":\"start\",\"class\":\"Flight\",\"type\":\"::\",\"args\":[]}]','die Information');

/*Table structure for table `tbl_session` */

DROP TABLE IF EXISTS `tbl_session`;

CREATE TABLE `tbl_session` (
  `id` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `timestamp` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_session` */

insert  into `tbl_session`(`id`,`data`,`timestamp`) values ('3qbdqgpdr0e9mdh9p30oven683','userId|i:118;companyId|i:25;languageId|i:2;rolleId|i:5;auth|a:2:{s:3:\"bla\";s:3:\"111\";s:4:\"blub\";s:3:\"abc\";}',1405405191),('upfhha5nm8i6t2gbtvm56idoi7','userId|i:118;companyId|i:25;languageId|i:2;rolleId|i:5;auth|a:2:{s:3:\"bla\";s:3:\"111\";s:4:\"blub\";s:3:\"abc\";}',1405367734);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `vorname` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`id`,`name`,`vorname`,`log`,`userId`) values (1,'Krauß','Stephan','0000-00-00 00:00:00',88),(2,'Krrauß','Antje!','2014-07-04 07:40:28',88),(3,'Mustermann','ssssseeee','2014-07-04 07:44:28',88),(4,'Mustermann','dfgdsfgsdfg','0000-00-00 00:00:00',88),(5,'Mustermann','dfgdsfgsdfg','2014-07-04 07:40:28',88),(6,'Mustermann','dfgdsfgsdfg','2014-07-04 07:44:28',88),(7,'Mustermann','','2014-07-16 08:17:07',0),(8,'Mustermann','','2014-07-16 08:18:25',0);

/* Trigger structure for table `tbl_haupttabelle` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `haupttabelle_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'test'@'localhost' */ /*!50003 TRIGGER `haupttabelle_insert` BEFORE INSERT ON `tbl_haupttabelle` FOR EACH ROW BEGIN
	set new.insertDate = now();
	set new.insertId = @userId;
    END */$$


DELIMITER ;

/* Trigger structure for table `tbl_haupttabelle` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `haupttabelle_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'test'@'localhost' */ /*!50003 TRIGGER `haupttabelle_update` BEFORE UPDATE ON `tbl_haupttabelle` FOR EACH ROW BEGIN
	set new.updateId = @userId;
	set new.updateDate = now();
    END */$$


DELIMITER ;

/* Trigger structure for table `test` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `test_bi` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'test'@'localhost' */ /*!50003 TRIGGER `test_bi` BEFORE INSERT ON `test` FOR EACH ROW BEGIN
set new.name = 'Mustermann';
END */$$


DELIMITER ;

/* Trigger structure for table `test` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `test_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'test'@'localhost' */ /*!50003 TRIGGER `test_update` BEFORE UPDATE ON `test` FOR EACH ROW BEGIN
	set new.userId = 88;
    END */$$


DELIMITER ;

/* Function  structure for function  `ifTest` */

/*!50003 DROP FUNCTION IF EXISTS `ifTest` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` FUNCTION `ifTest`() RETURNS text CHARSET utf8
BEGIN
  DECLARE wert1 INTEGER;
  declare test integer;
  set wert1 = 5;
  if wert1 > 1 then
    set test = 111;
    RETURN 'gross';
  else
    set test = 222;
    return 'klein';
  end if;
END */$$
DELIMITER ;

/* Function  structure for function  `myFunc` */

/*!50003 DROP FUNCTION IF EXISTS `myFunc` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` FUNCTION `myFunc`(wert int) RETURNS int(11)
BEGIN
	return wert;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `caseTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `caseTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `caseTest`()
BEGIN
declare v INT DEFAULT 1;

case v
  when 2 then
     select v;
  when 3 then
     select 0;
  else
  begin
        set v = 2;
  end;
end case;

END */$$
DELIMITER ;

/* Procedure structure for procedure `cursor1Test` */

/*!50003 DROP PROCEDURE IF EXISTS  `cursor1Test` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `cursor1Test`()
BEGIN

	declare v_name varchar(250) character set utf8;
    declare v_vorname varchar(250) character set utf8;

    declare v_fertig int default 0;
	declare c_test cursor  for select name, vorname from test;
    declare continue handler for not found set v_fertig = 1;

    open c_test;
    l_fetch_daten: loop

		fetch c_test into v_name, v_vorname;

        IF v_fertig = 1 THEN
        	LEAVE l_fetch_daten;
    	END IF;

    	select v_name, v_vorname;

    end loop l_fetch_daten;

    close c_test;

END */$$
DELIMITER ;

/* Procedure structure for procedure `loopTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `loopTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `loopTest`()
BEGIN
	declare v_zaehler int default 0;

    l_zahlen: loop

    	set v_zaehler = v_zaehler + 1;
    	select v_zaehler;

    	if v_zaehler = 10
    		then leave l_zahlen;
		end if;

    end loop l_zahlen;


END */$$
DELIMITER ;

/* Procedure structure for procedure `price_with_discount` */

/*!50003 DROP PROCEDURE IF EXISTS  `price_with_discount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `price_with_discount`()
BEGIN
  DECLARE p_id INTEGER;
  DECLARE p_name VARCHAR(100);
  DECLARE p_price DECIMAL (5, 2);
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE product_discount SMALLINT;
  DECLARE amount_of_discount DECIMAL (5, 2);

  DECLARE c CURSOR FOR SELECT id, name, price FROM product;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN c;
  FETCH c INTO p_id, p_name, p_price;
  # CREATE TEMPORARY TABLE tmp_price(product_name VARCHAR(100), price_with_discount DECIMAL (5, 2), discount_description TEXT);
  WHILE NOT done
  DO
    BEGIN
      DECLARE CONTINUE HANDLER FOR NOT FOUND
      BEGIN
      END;
      SELECT d.value INTO product_discount FROM discount d WHERE d.product_id = p_id;
    END;
    IF product_discount IS NULL THEN
      SET product_discount = 0;
    END IF;
    IF product_discount = 0 THEN
      INSERT INTO tmp_price VALUES (p_name, p_price, 'Discount is not available');
    ELSE
      SET amount_of_discount = (p_price * (product_discount / 100));
      INSERT INTO tmp_price VALUES (p_name, p_price - amount_of_discount, CONCAT('Discount ', product_discount, '% amount of discount $', amount_of_discount));
    END IF;
    FETCH c INTO p_id, p_name, p_price;
  END WHILE;

  CLOSE c;

  SELECT * FROM tmp_price;
  DROP TABLE tmp_price;
END */$$
DELIMITER ;

/* Procedure structure for procedure `repeatTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `repeatTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `repeatTest`(p1 INT)
BEGIN
	set @x = 5;
    repeat
    	set @x = @x + 1;
	until @x > p1 end repeat;
END */$$
DELIMITER ;

/* Procedure structure for procedure `showOne` */

/*!50003 DROP PROCEDURE IF EXISTS  `showOne` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `showOne`()
BEGIN
	select 1000;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userData` */

/*!50003 DROP PROCEDURE IF EXISTS  `userData` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `userData`()
BEGIN  
    SELECT * FROM `tbl_haupttabelle` AS haupt WHERE haupt.insertId = 118;  
  END */$$
DELIMITER ;

/* Procedure structure for procedure `whileTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `whileTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `whileTest`()
BEGIN
   declare v int default 5;

   while v < 10 do
      set v = v + 1;
   end while;
END */$$
DELIMITER ;

/* Procedure structure for procedure `work` */

/*!50003 DROP PROCEDURE IF EXISTS  `work` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`test`@`localhost` PROCEDURE `work`(IN idA INT)
BEGIN
     #declare variable
     DECLARE idB INT DEFAULT NULL;
     DECLARE done INT DEFAULT FALSE;
    #declare cursor
    declare csr cursor for
        SELECT id FROM tabelleb;
        
    #declare handle 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
    #open cursor
    open csr;
    
    #starts the loop
    read_loop: LOOP 
        fetch csr into idB;
        
    #exit loop
    IF done THEN
      LEAVE read_loop;
    END IF;
 
        
    #Insert it
    INSERT INTO tabelleab (tabelleA_id, tabelleB_id) VALUES (idA, idB);
    
	
    End Loop;
    
    # close cursor
    close csr;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
