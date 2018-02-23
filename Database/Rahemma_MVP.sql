# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1    Database: mvp
# ------------------------------------------------------
# Server version 5.5.5-10.1.19-MariaDB

#
# Source for table action
#

DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(50) NOT NULL,
  `action_context` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Dumping data for table action
#

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'menu_questions','Main_Menu');
INSERT INTO `action` VALUES (2,'ask_question','Questions');
INSERT INTO `action` VALUES (3,'set_question_private','Questions');
INSERT INTO `action` VALUES (4,'set_question_public','Questions');
INSERT INTO `action` VALUES (5,'listen_own_question_answer','Questions');
INSERT INTO `action` VALUES (6,'applaud_answer_private_question','Questions');
INSERT INTO `action` VALUES (7,'forward_private_question_answer','Questions');
INSERT INTO `action` VALUES (8,'listen_all_question_answer','Questions');
INSERT INTO `action` VALUES (9,'applaud_answer_public_question','Questions');
INSERT INTO `action` VALUES (10,'forward_public_question_answer','Questions');
INSERT INTO `action` VALUES (11,'questions_return','Questions');
INSERT INTO `action` VALUES (12,'menu_stories','Main_Menu');
INSERT INTO `action` VALUES (13,'listen_story','Stories');
INSERT INTO `action` VALUES (14,'report_story','Stories');
INSERT INTO `action` VALUES (15,'comment_on_story','Stories');
INSERT INTO `action` VALUES (16,'forward_story','Stories');
INSERT INTO `action` VALUES (17,'share_own_story','Stories');
INSERT INTO `action` VALUES (18,'stories_return','Stories');
INSERT INTO `action` VALUES (19,'menu_clips_quizes','Main_Menu');
INSERT INTO `action` VALUES (20,'menu_fun_factual_clips','Fun_Factual');
INSERT INTO `action` VALUES (21,'choose_fun_clips','Fun_Factual');
INSERT INTO `action` VALUES (22,'listen_fun_clips','Fun_Factual');
INSERT INTO `action` VALUES (23,'choose_fact_clips','Fun_Factual');
INSERT INTO `action` VALUES (24,'listen_factual_clips','Fun_Factual');
INSERT INTO `action` VALUES (25,'menu_personality_trivia_quizes','Quiz');
INSERT INTO `action` VALUES (26,'menu_personality_quizes','Quiz');
INSERT INTO `action` VALUES (27,'choose_personality_quiz','Quiz');
INSERT INTO `action` VALUES (28,'attempt_personality_quiz','Quiz');
INSERT INTO `action` VALUES (29,'menu_trivia_quizes','Quiz');
INSERT INTO `action` VALUES (30,'choose_trivia_quiz','Quiz');
INSERT INTO `action` VALUES (31,'attempt_trivia_quiz','Quiz');
INSERT INTO `action` VALUES (32,'main_feedback','Main_Menu');
INSERT INTO `action` VALUES (33,'return_mainmenu','Main_Menu');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table answer_transcription
#

DROP TABLE IF EXISTS `answer_transcription`;
CREATE TABLE `answer_transcription` (
  `ans_trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) NOT NULL,
  `urdu` text NOT NULL,
  `english` text NOT NULL,
  `roman_urdu` text NOT NULL,
  PRIMARY KEY (`ans_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table answer_transcription
#

LOCK TABLES `answer_transcription` WRITE;
/*!40000 ALTER TABLE `answer_transcription` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_transcription` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table comment
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(9) NOT NULL AUTO_INCREMENT,
  `story_id` int(9) NOT NULL,
  `file_id` int(9) NOT NULL,
  `user_id` int(9) NOT NULL,
  `time_approved` datetime DEFAULT '0000-00-00 00:00:00',
  `record_status` int(1) NOT NULL DEFAULT '0',
  `approve_status` int(1) NOT NULL DEFAULT '0',
  `call_id` int(11) NOT NULL,
  `time_recorded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `story_id` (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

#
# Dumping data for table comment
#

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table doc_answer_feedback
#

DROP TABLE IF EXISTS `doc_answer_feedback`;
CREATE TABLE `doc_answer_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `response_type` int(11) NOT NULL,
  `report_type` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table doc_answer_feedback
#

LOCK TABLES `doc_answer_feedback` WRITE;
/*!40000 ALTER TABLE `doc_answer_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_answer_feedback` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table doctor
#

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_fname` varchar(20) NOT NULL,
  `doc_lname` varchar(20) NOT NULL,
  `doc_workplace` varchar(60) NOT NULL,
  `doc_dob` date NOT NULL,
  `doc_phoneno` varchar(15) NOT NULL,
  `doc_regid` varchar(100) NOT NULL,
  `doc_type` varchar(20) NOT NULL,
  `doc_email` varchar(30) NOT NULL,
  `doc_password` varchar(50) NOT NULL,
  `doc_joiningdate` datetime NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table doctor
#

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table forward
#

DROP TABLE IF EXISTS `forward`;
CREATE TABLE `forward` (
  `forward_id` int(9) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(50) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` int(9) NOT NULL,
  `dest` varchar(255) NOT NULL,
  `call_id` int(9) NOT NULL,
  `time_delivered` datetime DEFAULT '0000-00-00 00:00:00',
  `time_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`forward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=latin1;

#
# Dumping data for table forward
#

LOCK TABLES `forward` WRITE;
/*!40000 ALTER TABLE `forward` DISABLE KEYS */;
/*!40000 ALTER TABLE `forward` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table funfact
#

DROP TABLE IF EXISTS `funfact`;
CREATE TABLE `funfact` (
  `fun_fact_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `preference` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_listened` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `call_id` int(11) NOT NULL,
  PRIMARY KEY (`fun_fact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table funfact
#

LOCK TABLES `funfact` WRITE;
/*!40000 ALTER TABLE `funfact` DISABLE KEYS */;
/*!40000 ALTER TABLE `funfact` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table logs
#

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `time_logged` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table logs
#

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table main_feedback
#

DROP TABLE IF EXISTS `main_feedback`;
CREATE TABLE `main_feedback` (
  `feedback_id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(9) NOT NULL,
  `file_id` int(9) NOT NULL,
  `record_status` int(1) DEFAULT '0',
  `call_id` int(11) NOT NULL,
  `time_recorded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;

#
# Dumping data for table main_feedback
#

LOCK TABLES `main_feedback` WRITE;
/*!40000 ALTER TABLE `main_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_feedback` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table notification_status
#

DROP TABLE IF EXISTS `notification_status`;
CREATE TABLE `notification_status` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table notification_status
#

LOCK TABLES `notification_status` WRITE;
/*!40000 ALTER TABLE `notification_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_status` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table question
#

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL,
  `record_status` int(1) NOT NULL DEFAULT '0',
  `question_type` varchar(20) NOT NULL,
  `question_public_user` int(1) NOT NULL DEFAULT '0',
  `approve_status` int(1) NOT NULL DEFAULT '0',
  `approved_by` varchar(20) DEFAULT NULL,
  `time_approved` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `answer_status` int(1) NOT NULL DEFAULT '0',
  `flag` int(1) NOT NULL DEFAULT '0',
  `time_recorded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_upload_status` int(1) NOT NULL DEFAULT '0',
  `time_trans_uploaded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question_public_admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table question
#

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table question_answer
#

DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `answer_text` text,
  `flag` int(11) NOT NULL,
  `time_answered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trans_upload_status` int(1) DEFAULT '0',
  `time_trans_uploaded` datetime DEFAULT '0000-00-00 00:00:00',
  `approve_status` int(1) NOT NULL DEFAULT '0',
  `approved_by` varchar(50) DEFAULT NULL,
  `time_approved` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table question_answer
#

LOCK TABLES `question_answer` WRITE;
/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table question_transcription
#

DROP TABLE IF EXISTS `question_transcription`;
CREATE TABLE `question_transcription` (
  `ques_trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `roman_urdu` text NOT NULL,
  `english` text NOT NULL,
  `urdu` text NOT NULL,
  PRIMARY KEY (`ques_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table question_transcription
#

LOCK TABLES `question_transcription` WRITE;
/*!40000 ALTER TABLE `question_transcription` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_transcription` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table quiz
#

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_type` varchar(50) NOT NULL,
  `call_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `question` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` varchar(10) NOT NULL,
  `correct` int(11) DEFAULT NULL,
  `time_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26779 DEFAULT CHARSET=latin1;

#
# Dumping data for table quiz
#

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table response
#

DROP TABLE IF EXISTS `response`;
CREATE TABLE `response` (
  `response_id` int(9) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(50) NOT NULL,
  `response_type` int(11) NOT NULL DEFAULT '0',
  `user_id` int(9) NOT NULL,
  `call_id` int(9) NOT NULL,
  `time_responded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table response
#

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table story
#

DROP TABLE IF EXISTS `story`;
CREATE TABLE `story` (
  `story_id` int(9) NOT NULL AUTO_INCREMENT,
  `file_id` int(9) NOT NULL,
  `time_uploaded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uploaded_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Dumping data for table story
#

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table token
#

DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `isLogin` int(2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Dumping data for table token
#

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,0,'dzdkpIrgjfQ:APA91bEUkiDUSlNXex6_7R98IIsLf3MbOwIN3EchhAu_hD7nCeT5Jn8yc8',0,'2017-07-24 12:57:38');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user_story
#

DROP TABLE IF EXISTS `user_story`;
CREATE TABLE `user_story` (
  `user_story_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `record_status` int(1) DEFAULT '0',
  `approve_status` int(1) NOT NULL DEFAULT '0',
  `call_id` int(11) NOT NULL,
  `time_approved` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

#
# Dumping data for table user_story
#

LOCK TABLES `user_story` WRITE;
/*!40000 ALTER TABLE `user_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_story` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
