/*
SQLyog Ultimate v11.33 (64 bit)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_exception` */

insert  into `tbl_exception`(`id`,`message`,`code`,`file`,`line`,`trace`,`method`,`url`,`params`,`session`) values (1,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',47,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(39): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(2,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',47,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(39): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(3,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',47,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(39): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(64): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(4,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',36,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(41): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}',NULL),(5,'Error',10,'C:\\xampp\\htdocs\\kanbanery\\application\\controller\\startController.php',46,'#0 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(41): startController->index()\n#1 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(166): {closure}(\'start\', \'index\', Object(flight\\net\\Route))\n#2 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(143): flight\\core\\Dispatcher::callFunction(Object(Closure), Array)\n#3 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(311): flight\\core\\Dispatcher::execute(Object(Closure), Array)\n#4 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->_start()\n#5 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(142): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#6 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(48): flight\\core\\Dispatcher::execute(Array, Array)\n#7 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Engine.php(64): flight\\core\\Dispatcher->run(\'start\', Array)\n#8 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->__call(\'start\', Array)\n#9 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\core\\Dispatcher.php(191): flight\\Engine->start()\n#10 C:\\xampp\\htdocs\\kanbanery\\vendor\\mikecao\\flight\\flight\\Flight.php(43): flight\\core\\Dispatcher::invokeMethod(Array, Array)\n#11 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::__callStatic(\'start\', Array)\n#12 C:\\xampp\\htdocs\\kanbanery\\public\\index.php(66): Flight::start()\n#13 {main}',NULL,NULL,'{\"wert1\":\"bla\",\"wert2\":\"blub\"}','{\"wert1\":\"wert1\",\"auth\":{\"bla\":\"111\",\"blub\":\"abc\"}}');

/*Table structure for table `tbl_session` */

DROP TABLE IF EXISTS `tbl_session`;

CREATE TABLE `tbl_session` (
  `id` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `timestamp` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_session` */

insert  into `tbl_session`(`id`,`data`,`timestamp`) values ('8a0h6em02cfa4h7sf4lpuaosj4','wert1|s:5:\"wert1\";auth|a:2:{s:3:\"bla\";s:3:\"111\";s:4:\"blub\";s:3:\"abc\";}',1403814915);

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
