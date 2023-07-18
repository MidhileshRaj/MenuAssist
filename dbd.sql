/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - ai_menu_assist
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ai_menu_assist` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ai_menu_assist`;

/*Table structure for table `ai_menu_app_customer` */

DROP TABLE IF EXISTS `ai_menu_app_customer`;

CREATE TABLE `ai_menu_app_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(25) NOT NULL,
  `custphone_no` varchar(10) NOT NULL,
  `place` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_customer_LOGIN_id_9ccdefea_fk_AI_menu_App_login_id` (`LOGIN_id`),
  CONSTRAINT `AI_menu_App_customer_LOGIN_id_9ccdefea_fk_AI_menu_App_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `ai_menu_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_customer` */

insert  into `ai_menu_app_customer`(`id`,`cust_name`,`custphone_no`,`place`,`email`,`LOGIN_id`) values 
(1,'Naseef','8062358294','Thottumukkam','naseef8@gmail.com',3),
(2,'Navya','6238456852','Kavanur','navyakv85@gmail.com',5),
(7,'Arshaq ','9745395629','Areekode','arshaqard@gmail.com',15);

/*Table structure for table `ai_menu_app_feedback` */

DROP TABLE IF EXISTS `ai_menu_app_feedback`;

CREATE TABLE `ai_menu_app_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(150) NOT NULL,
  `rating` varchar(25) NOT NULL,
  `date` varchar(15) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  `food_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_feedback_LOGIN_id_792ca283_fk_AI_menu_A` (`LOGIN_id`),
  KEY `AI_menu_App_feedback_food_id_id_4b1472fb_fk_AI_menu_App_food_id` (`food_id_id`),
  CONSTRAINT `AI_menu_App_feedback_food_id_id_4b1472fb_fk_AI_menu_App_food_id` FOREIGN KEY (`food_id_id`) REFERENCES `ai_menu_app_food` (`id`),
  CONSTRAINT `AI_menu_App_feedback_LOGIN_id_792ca283_fk_AI_menu_A` FOREIGN KEY (`LOGIN_id`) REFERENCES `ai_menu_app_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_feedback` */

insert  into `ai_menu_app_feedback`(`id`,`feedback`,`rating`,`date`,`LOGIN_id`,`food_id_id`) values 
(1,'delicious','3','04/02/2023',2,1);

/*Table structure for table `ai_menu_app_food` */

DROP TABLE IF EXISTS `ai_menu_app_food`;

CREATE TABLE `ai_menu_app_food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `food_item` varchar(30) NOT NULL,
  `stock` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `food_image` varchar(250) NOT NULL,
  `food_description` varchar(250) NOT NULL,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_food` */

insert  into `ai_menu_app_food`(`id`,`food_item`,`stock`,`price`,`food_image`,`food_description`,`category`) values 
(1,'Beef Biryani',10,130,'/media/20230123124048beefbiriyani.webp','Biryani is a mix of meat and rice ,traditionally cooked over an open fire in a leather pot.','non veg'),
(2,'Chicken Fry',12,60,'/media/20230305130223chicken%20fry.jpg',' Turkish spicy chicken fry','non veg'),
(3,'Burger',10,150,'/media/20230305130038Burger.webp',' Double layered Chicken Burger ','non veg'),
(4,'Fuljar Soda',40,30,'/media/20230305131143fuljarsoda.jpg','Kerala special Fulljar soda','cool drinks');

/*Table structure for table `ai_menu_app_help` */

DROP TABLE IF EXISTS `ai_menu_app_help`;

CREATE TABLE `ai_menu_app_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `help` varchar(50) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  `TABLE_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_help_LOGIN_id_461f9da0_fk_AI_menu_App_customer_id` (`LOGIN_id`),
  KEY `AI_menu_App_help_TABLE_id_7c53e410_fk_AI_menu_App_table_id` (`TABLE_id`),
  CONSTRAINT `AI_menu_App_help_LOGIN_id_461f9da0_fk_AI_menu_App_customer_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `ai_menu_app_customer` (`id`),
  CONSTRAINT `AI_menu_App_help_TABLE_id_7c53e410_fk_AI_menu_App_table_id` FOREIGN KEY (`TABLE_id`) REFERENCES `ai_menu_app_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_help` */

insert  into `ai_menu_app_help`(`id`,`help`,`LOGIN_id`,`TABLE_id`) values 
(2,'help',2,3);

/*Table structure for table `ai_menu_app_login` */

DROP TABLE IF EXISTS `ai_menu_app_login`;

CREATE TABLE `ai_menu_app_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_login` */

insert  into `ai_menu_app_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(2,'cashier','123','cashier'),
(3,'kitchen','123','kitchen'),
(5,'service station','123','service station'),
(6,'fayis2@gmail.com','8763535544','staff'),
(7,'aju32@gmail.com','9544324118','staff'),
(8,'arshaq42@gmail.com','8086042257','staff'),
(9,'arshaq42@gmail.com','8086042257','staff'),
(10,'abcd','1234','customer'),
(11,'Navya KV','00100','customer'),
(12,'Navya KV','0010','customer'),
(13,'Navya KV','00109','customer'),
(14,'Navya KV','00108','customer'),
(15,'Arshaq ','12345','customer');

/*Table structure for table `ai_menu_app_notification` */

DROP TABLE IF EXISTS `ai_menu_app_notification`;

CREATE TABLE `ai_menu_app_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `om_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_notifica_om_id_id_2d16aa98_fk_AI_menu_A` (`om_id_id`),
  CONSTRAINT `AI_menu_App_notifica_om_id_id_2d16aa98_fk_AI_menu_A` FOREIGN KEY (`om_id_id`) REFERENCES `ai_menu_app_order_main` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_notification` */

insert  into `ai_menu_app_notification`(`id`,`status`,`om_id_id`) values 
(1,'The cuisine is ready',1),
(2,'ready',1);

/*Table structure for table `ai_menu_app_order_main` */

DROP TABLE IF EXISTS `ai_menu_app_order_main`;

CREATE TABLE `ai_menu_app_order_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_amount` bigint(20) NOT NULL,
  `date` varchar(15) NOT NULL,
  `status` varchar(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  `TABLE_id` bigint(20) NOT NULL,
  `food_id_id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_order_main_TABLE_id_7ffbfff2_fk_AI_menu_App_table_id` (`TABLE_id`),
  KEY `AI_menu_App_order_ma_LOGIN_id_6b96d646_fk_AI_menu_A` (`LOGIN_id`),
  KEY `AI_menu_App_order_ma_food_id_id_35026232_fk_AI_menu_A` (`food_id_id`),
  CONSTRAINT `AI_menu_App_order_main_TABLE_id_7ffbfff2_fk_AI_menu_App_table_id` FOREIGN KEY (`TABLE_id`) REFERENCES `ai_menu_app_table` (`id`),
  CONSTRAINT `AI_menu_App_order_ma_food_id_id_35026232_fk_AI_menu_A` FOREIGN KEY (`food_id_id`) REFERENCES `ai_menu_app_food` (`id`),
  CONSTRAINT `AI_menu_App_order_ma_LOGIN_id_6b96d646_fk_AI_menu_A` FOREIGN KEY (`LOGIN_id`) REFERENCES `ai_menu_app_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_order_main` */

insert  into `ai_menu_app_order_main`(`id`,`total_amount`,`date`,`status`,`LOGIN_id`,`TABLE_id`,`food_id_id`,`quantity`) values 
(1,560,'04/01/23','paid',2,6,1,1),
(2,310,'04/01/23','unpaid',1,6,1,1),
(17,9223372036854775807,'2023-03-05 17:4','ordered',7,3,1,1),
(18,9223372036854775807,'2023-03-05 17:4','ordered',7,3,1,1),
(19,9223372036854775807,'2023-03-05 17:4','ordered',7,3,1,1);

/*Table structure for table `ai_menu_app_payment` */

DROP TABLE IF EXISTS `ai_menu_app_payment`;

CREATE TABLE `ai_menu_app_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_amount` varchar(10) NOT NULL,
  `date` varchar(15) NOT NULL,
  `status` varchar(25) NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `ORDER_MAIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_payment_ORDER_MAIN_id_e7972e2f_fk_AI_menu_A` (`ORDER_MAIN_id`),
  CONSTRAINT `AI_menu_App_payment_ORDER_MAIN_id_e7972e2f_fk_AI_menu_A` FOREIGN KEY (`ORDER_MAIN_id`) REFERENCES `ai_menu_app_order_main` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_payment` */

insert  into `ai_menu_app_payment`(`id`,`total_amount`,`date`,`status`,`account_number`,`ORDER_MAIN_id`) values 
(2,'480','13/11/2022','unpaid','40157564325',2);

/*Table structure for table `ai_menu_app_staff` */

DROP TABLE IF EXISTS `ai_menu_app_staff`;

CREATE TABLE `ai_menu_app_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(30) NOT NULL,
  `staffphone_no` varchar(10) NOT NULL,
  `staff_dob` varchar(15) NOT NULL,
  `staff_email` varchar(30) NOT NULL,
  `staff_place` varchar(40) NOT NULL,
  `staff_post` varchar(30) NOT NULL,
  `staff_district` varchar(30) NOT NULL,
  `staff_pincode` varchar(10) NOT NULL,
  `staff_photo` varchar(250) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AI_menu_App_staff_LOGIN_id_b5548831_fk_AI_menu_App_login_id` (`LOGIN_id`),
  CONSTRAINT `AI_menu_App_staff_LOGIN_id_b5548831_fk_AI_menu_App_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `ai_menu_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_staff` */

insert  into `ai_menu_app_staff`(`id`,`staff_name`,`staffphone_no`,`staff_dob`,`staff_email`,`staff_place`,`staff_post`,`staff_district`,`staff_pincode`,`staff_photo`,`LOGIN_id`) values 
(2,'Fayis','8763535544','2022-11-30','fayis2@gmail.com','aathadi','areekode','malappuram','673639','/media/20230123122902WhatsApp%20Image%202023-01-23%20at%2012.26.59%20PM.jpeg',6),
(5,'Arshaq','8086042257','2001-12-07','arshaq42@gmail.com','Areekode','Areekode','malappuram','673639','/media/20230123122920WhatsApp%20Image%202023-01-23%20at%2012.27.00%20PM.jpeg',9);

/*Table structure for table `ai_menu_app_table` */

DROP TABLE IF EXISTS `ai_menu_app_table`;

CREATE TABLE `ai_menu_app_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_no` varchar(10) NOT NULL,
  `no_of_seats` varchar(50) NOT NULL,
  `table_status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `ai_menu_app_table` */

insert  into `ai_menu_app_table`(`id`,`table_no`,`no_of_seats`,`table_status`) values 
(3,'2','3','available'),
(4,'2','4','available'),
(5,'2','3','available'),
(6,'3','4','available');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add customer',7,'add_customer'),
(26,'Can change customer',7,'change_customer'),
(27,'Can delete customer',7,'delete_customer'),
(28,'Can view customer',7,'view_customer'),
(29,'Can add food',8,'add_food'),
(30,'Can change food',8,'change_food'),
(31,'Can delete food',8,'delete_food'),
(32,'Can view food',8,'view_food'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add order_main',10,'add_order_main'),
(38,'Can change order_main',10,'change_order_main'),
(39,'Can delete order_main',10,'delete_order_main'),
(40,'Can view order_main',10,'view_order_main'),
(41,'Can add table',11,'add_table'),
(42,'Can change table',11,'change_table'),
(43,'Can delete table',11,'delete_table'),
(44,'Can view table',11,'view_table'),
(45,'Can add staff',12,'add_staff'),
(46,'Can change staff',12,'change_staff'),
(47,'Can delete staff',12,'delete_staff'),
(48,'Can view staff',12,'view_staff'),
(49,'Can add payment',13,'add_payment'),
(50,'Can change payment',13,'change_payment'),
(51,'Can delete payment',13,'delete_payment'),
(52,'Can view payment',13,'view_payment'),
(53,'Can add order_sub',14,'add_order_sub'),
(54,'Can change order_sub',14,'change_order_sub'),
(55,'Can delete order_sub',14,'delete_order_sub'),
(56,'Can view order_sub',14,'view_order_sub'),
(57,'Can add feedback',15,'add_feedback'),
(58,'Can change feedback',15,'change_feedback'),
(59,'Can delete feedback',15,'delete_feedback'),
(60,'Can view feedback',15,'view_feedback'),
(61,'Can add notification',16,'add_notification'),
(62,'Can change notification',16,'change_notification'),
(63,'Can delete notification',16,'delete_notification'),
(64,'Can view notification',16,'view_notification'),
(65,'Can add help',17,'add_help'),
(66,'Can change help',17,'change_help'),
(67,'Can delete help',17,'delete_help'),
(68,'Can view help',17,'view_help');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$mDmdw4FUiVyiGmoKg33WTf$3LCpiczcdYm/ehRfoG1NMK8XaWwdhb/k3i9YXrBhyho=','2023-02-08 16:41:48.280693',1,'navya','','','',1,1,'2023-02-08 16:40:45.277824');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(7,'AI_menu_App','customer'),
(15,'AI_menu_App','feedback'),
(8,'AI_menu_App','food'),
(17,'AI_menu_App','help'),
(9,'AI_menu_App','login'),
(16,'AI_menu_App','notification'),
(10,'AI_menu_App','order_main'),
(14,'AI_menu_App','order_sub'),
(13,'AI_menu_App','payment'),
(12,'AI_menu_App','staff'),
(11,'AI_menu_App','table'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'AI_menu_App','0001_initial','2023-01-05 08:16:11.055760'),
(2,'contenttypes','0001_initial','2023-01-05 08:16:11.150779'),
(3,'auth','0001_initial','2023-01-05 08:16:11.994139'),
(4,'admin','0001_initial','2023-01-05 08:16:12.170538'),
(5,'admin','0002_logentry_remove_auto_add','2023-01-05 08:16:12.174515'),
(6,'admin','0003_logentry_add_action_flag_choices','2023-01-05 08:16:12.190146'),
(7,'contenttypes','0002_remove_content_type_name','2023-01-05 08:16:12.336163'),
(8,'auth','0002_alter_permission_name_max_length','2023-01-05 08:16:12.401120'),
(9,'auth','0003_alter_user_email_max_length','2023-01-05 08:16:12.466294'),
(10,'auth','0004_alter_user_username_opts','2023-01-05 08:16:12.475840'),
(11,'auth','0005_alter_user_last_login_null','2023-01-05 08:16:12.548506'),
(12,'auth','0006_require_contenttypes_0002','2023-01-05 08:16:12.554201'),
(13,'auth','0007_alter_validators_add_error_messages','2023-01-05 08:16:12.562201'),
(14,'auth','0008_alter_user_username_max_length','2023-01-05 08:16:12.641314'),
(15,'auth','0009_alter_user_last_name_max_length','2023-01-05 08:16:12.709087'),
(16,'auth','0010_alter_group_name_max_length','2023-01-05 08:16:12.781475'),
(17,'auth','0011_update_proxy_permissions','2023-01-05 08:16:12.803921'),
(18,'auth','0012_alter_user_first_name_max_length','2023-01-05 08:16:12.876546'),
(19,'sessions','0001_initial','2023-01-05 08:16:12.953559'),
(20,'AI_menu_App','0002_feedback_food_id','2023-01-13 09:17:50.909212'),
(21,'AI_menu_App','0003_help_notification','2023-01-28 09:11:50.850978'),
(22,'AI_menu_App','0004_auto_20230305_1608','2023-03-05 10:38:50.064771'),
(23,'AI_menu_App','0005_auto_20230305_1641','2023-03-05 11:11:19.168456'),
(24,'AI_menu_App','0006_remove_order_main_time','2023-03-05 12:10:20.521972');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('3s5pz85ip43dfhtmdva6e0vobsec3gti','.eJxtjMsKwjAQRf8lawlNM9MkLt33G8LkMbYqDTTtSvx3WymC4O5w7uMpeEziLJQ4ifoh3KjUr_S0LoNfa579Pxco3vO0B-lG07XIWKZlHoPcK_JIq-xLyo_L0f05GKgO27oFm1ULBl2gxhgVSaPpIKXoMLSgs1POJudMgMxgmBgZGw2INrDuWLzeTB8-6A:1pPnW0:PiBN3iHD4rHwgLDlJ-fSrXmgshTacLxRY1EHb2H10WE','2023-02-22 16:41:48.304112'),
('ob3nk6bd8w8btgh886fq2hssvu5qz17p','eyJmaWQiOiIyIn0:1pYipa:pECLzY_M949WLzNwNK7LZXHSG9haF-ViSJKZ8f1qhTU','2023-03-19 07:30:54.518316');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
