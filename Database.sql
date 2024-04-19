/*
SQLyog Ultimate v8.82 
MySQL - 5.1.45-community : Database - techblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`techblog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `techblog`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`cid`,`name`,`description`) values (1,'Java Programming','Java is one of the most popular Programming language'),(2,'Python Programming','Python is one of the most popular for machine lerning '),(3,'Web Technology','Web technology mostly used for web development'),(4,'C Programming','C programming is best programming langusge'),(5,'DataBase','Data is very importat for any organization'),(6,'Compiler Design','Compiler Design is very important for staudent');

/*Table structure for table `liketab` */

DROP TABLE IF EXISTS `liketab`;

CREATE TABLE `liketab` (
  `lid` int(20) NOT NULL AUTO_INCREMENT,
  `postId` int(20) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `liketab_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`pid`),
  CONSTRAINT `liketab_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `liketab_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `liketab` */

insert  into `liketab`(`lid`,`postId`,`userId`) values (2,5,1),(3,4,1),(4,6,1),(5,3,1),(6,3,1),(7,3,1),(8,2,1),(9,1,1),(10,6,1);

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `pid` int(15) NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT 'default.jpg',
  `pDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int(12) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`pid`,`pTitle`),
  UNIQUE KEY `pid` (`pid`),
  KEY `catId` (`catId`),
  KEY `userId` (`userId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `category` (`cid`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`catId`) REFERENCES `category` (`cid`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `post` */

insert  into `post`(`pid`,`pTitle`,`pContent`,`pCode`,`pPic`,`pDate`,`catId`,`userId`) values (1,'java programming','Java is used World Wide Area Like Web technology ang Mobile App Technology','no','gift_card.png','2024-04-09 01:12:08',1,1),(2,'python is programming','Python Programming used for machine learning and data science','no','mac.png','2024-04-10 17:49:23',2,1),(3,'What is c programming','c programming is used for developed for system software this is very popular for developed system software','#include studio.in;\r\n# include conio.in;\r\nvoid main()\r\n{\r\nPrintf(\"Hello World!\");\r\n}','video.png','2024-04-10 17:52:28',4,1),(4,'Used of databases','Database is used for storing data in the form of tables and after storing to perform some operation to create some Insite of this data','Select * from emp;\r\ninsert into employee;','hero_image.png','2024-04-10 17:55:23',5,1),(5,'what is web technology','Web technology refers to the means by which computers communicate with each other using markup languages and multimedia packages. It gives us a way to interact with hosted information, like websites. Web technology involves the use of hypertext markup language (HTML) and cascading style sheets (CSS).','no','default.jpg','2024-04-11 17:19:32',3,2),(6,'What is Compiler design','Compiler Design is used for creting a compoler for find buf and error in the proframming language\r\n','no\r\n\r\n','default.jpg','2024-04-11 17:32:23',6,2);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(500) DEFAULT '''hey ! I am using techbkog''',
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile` varchar(100) DEFAULT 'default.png',
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`password`,`gender`,`about`,`rdate`,`profile`) values (1,'S Gupta','sujeetkumar89980@gmail.com','1234','Male',' Hello my name is Sujeet Kumar i am a Software Engineer','2024-04-11 23:31:00',''),(2,'Vikram Kumar','Vikram@gmail.com','4321','Male','I am vikram','2024-04-07 19:38:44','default.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
