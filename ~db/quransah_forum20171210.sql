-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quransah_forum
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gdn_activity`
--

DROP TABLE IF EXISTS `gdn_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityTypeID` int(11) NOT NULL,
  `NotifyUserID` int(11) NOT NULL DEFAULT '0',
  `ActivityUserID` int(11) DEFAULT NULL,
  `RegardingUserID` int(11) DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HeadlineFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Story` text COLLATE utf8_unicode_ci,
  `Format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime NOT NULL,
  `Notified` tinyint(4) NOT NULL DEFAULT '0',
  `Emailed` tinyint(4) NOT NULL DEFAULT '0',
  `Data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ActivityID`),
  KEY `IX_Activity_Notify` (`NotifyUserID`,`Notified`),
  KEY `IX_Activity_Recent` (`NotifyUserID`,`DateUpdated`),
  KEY `IX_Activity_Feed` (`NotifyUserID`,`ActivityUserID`,`DateUpdated`),
  KEY `IX_Activity_DateUpdated` (`DateUpdated`),
  KEY `FK_Activity_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_activity`
--

LOCK TABLES `gdn_activity` WRITE;
/*!40000 ALTER TABLE `gdn_activity` DISABLE KEYS */;
INSERT INTO `gdn_activity` VALUES (1,17,-1,6,NULL,NULL,'{ActivityUserID,You} joined.','Welcome Aboard!',NULL,NULL,NULL,NULL,NULL,'2017-12-10 08:23:01','127.0.0.1','2017-12-10 13:15:19',0,0,'a:1:{s:15:\"ActivityUserIDs\";a:4:{i:0;i:5;i:1;i:4;i:2;i:3;i:3;i:2;}}'),(2,15,-1,2,1,NULL,'{RegardingUserID,you} &rarr; {ActivityUserID,you}','Ping! An activity post is a public way to talk at someone. When you update your status here, it posts it on your activity feed.','Html',NULL,NULL,NULL,1,'2017-12-10 08:23:13',NULL,'2017-12-10 08:23:13',0,0,NULL),(3,29,6,2,NULL,NULL,'{ActivityUserID,user} memberi komen mengenai <a href=\"{Url,html}\">{Data.Name,text}</a>',NULL,NULL,'/discussion/comment/2#Comment_2','Comment',2,2,'2017-12-10 13:34:22','127.0.0.1','2017-12-10 13:34:22',3,0,'a:3:{s:4:\"Name\";s:34:\"Hukum Menambah Tanda Pada Al-Quran\";s:8:\"Category\";s:7:\"General\";s:6:\"Reason\";s:4:\"mine\";}');
/*!40000 ALTER TABLE `gdn_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_activitycomment`
--

DROP TABLE IF EXISTS `gdn_activitycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_activitycomment` (
  `ActivityCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ActivityCommentID`),
  KEY `FK_ActivityComment_ActivityID` (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_activitycomment`
--

LOCK TABLES `gdn_activitycomment` WRITE;
/*!40000 ALTER TABLE `gdn_activitycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_activitycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_activitytype`
--

DROP TABLE IF EXISTS `gdn_activitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_activitytype` (
  `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AllowComments` tinyint(4) NOT NULL DEFAULT '0',
  `ShowIcon` tinyint(4) NOT NULL DEFAULT '0',
  `ProfileHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RouteCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ActivityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_activitytype`
--

LOCK TABLES `gdn_activitytype` WRITE;
/*!40000 ALTER TABLE `gdn_activitytype` DISABLE KEYS */;
INSERT INTO `gdn_activitytype` VALUES (1,'SignIn',0,0,'%1$s signed in.','%1$s signed in.',NULL,0,1),(2,'Join',1,0,'%1$s joined.','%1$s joined.',NULL,0,1),(3,'JoinInvite',1,0,'%1$s accepted %4$s invitation for membership.','%1$s accepted %4$s invitation for membership.',NULL,0,1),(4,'JoinApproved',1,0,'%1$s approved %4$s membership application.','%1$s approved %4$s membership application.',NULL,0,1),(5,'JoinCreated',1,0,'%1$s created an account for %3$s.','%1$s created an account for %3$s.',NULL,0,1),(6,'AboutUpdate',1,0,'%1$s updated %6$s profile.','%1$s updated %6$s profile.',NULL,0,1),(7,'WallComment',1,1,'%1$s wrote:','%1$s wrote on %4$s %5$s.',NULL,0,1),(8,'PictureChange',1,0,'%1$s changed %6$s profile picture.','%1$s changed %6$s profile picture.',NULL,0,1),(9,'RoleChange',1,0,'%1$s changed %4$s permissions.','%1$s changed %4$s permissions.',NULL,1,1),(10,'ActivityComment',0,1,'%1$s','%1$s commented on %4$s %8$s.','activity',1,1),(11,'Import',0,0,'%1$s imported data.','%1$s imported data.',NULL,1,0),(12,'Banned',0,0,'%1$s banned %3$s.','%1$s banned %3$s.',NULL,0,1),(13,'Unbanned',0,0,'%1$s un-banned %3$s.','%1$s un-banned %3$s.',NULL,0,1),(14,'Applicant',0,0,'%1$s applied for membership.','%1$s applied for membership.',NULL,1,0),(15,'WallPost',1,1,'%3$s wrote:','%3$s wrote on %2$s %5$s.',NULL,0,1),(16,'Default',0,0,NULL,NULL,NULL,0,1),(17,'Registration',0,0,NULL,NULL,NULL,0,1),(18,'Status',0,0,NULL,NULL,NULL,0,1),(19,'Ban',0,0,NULL,NULL,NULL,0,1),(20,'ConversationMessage',0,0,'%1$s sent you a %8$s.','%1$s sent you a %8$s.','message',1,0),(21,'AddedToConversation',0,0,'%1$s added %3$s to a %8$s.','%1$s added %3$s to a %8$s.','conversation',1,0),(22,'NewDiscussion',0,0,'%1$s started a %8$s.','%1$s started a %8$s.','discussion',0,0),(23,'NewComment',0,0,'%1$s commented on a discussion.','%1$s commented on a discussion.','discussion',0,0),(24,'DiscussionComment',0,0,'%1$s commented on %4$s %8$s.','%1$s commented on %4$s %8$s.','discussion',1,0),(25,'DiscussionMention',0,0,'%1$s mentioned %3$s in a %8$s.','%1$s mentioned %3$s in a %8$s.','discussion',1,0),(26,'CommentMention',0,0,'%1$s mentioned %3$s in a %8$s.','%1$s mentioned %3$s in a %8$s.','comment',1,0),(27,'BookmarkComment',0,0,'%1$s commented on your %8$s.','%1$s commented on your %8$s.','bookmarked discussion',1,0),(28,'Discussion',0,0,NULL,NULL,NULL,0,1),(29,'Comment',0,0,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `gdn_activitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_analyticslocal`
--

DROP TABLE IF EXISTS `gdn_analyticslocal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_analyticslocal` (
  `TimeSlot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Views` int(11) DEFAULT NULL,
  `EmbedViews` int(11) DEFAULT NULL,
  UNIQUE KEY `UX_AnalyticsLocal` (`TimeSlot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_analyticslocal`
--

LOCK TABLES `gdn_analyticslocal` WRITE;
/*!40000 ALTER TABLE `gdn_analyticslocal` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_analyticslocal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_attachment`
--

DROP TABLE IF EXISTS `gdn_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_attachment` (
  `AttachmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserID` int(11) NOT NULL,
  `Source` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `SourceID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `SourceURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateInserted` datetime NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AttachmentID`),
  KEY `IX_Attachment_ForeignID` (`ForeignID`),
  KEY `FK_Attachment_ForeignUserID` (`ForeignUserID`),
  KEY `FK_Attachment_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_attachment`
--

LOCK TABLES `gdn_attachment` WRITE;
/*!40000 ALTER TABLE `gdn_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_ban`
--

DROP TABLE IF EXISTS `gdn_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_ban` (
  `BanID` int(11) NOT NULL AUTO_INCREMENT,
  `BanType` enum('IPAddress','Name','Email') COLLATE utf8_unicode_ci NOT NULL,
  `BanValue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountUsers` int(10) unsigned NOT NULL DEFAULT '0',
  `CountBlockedRegistrations` int(10) unsigned NOT NULL DEFAULT '0',
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BanID`),
  UNIQUE KEY `UX_Ban` (`BanType`,`BanValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_ban`
--

LOCK TABLES `gdn_ban` WRITE;
/*!40000 ALTER TABLE `gdn_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_category`
--

DROP TABLE IF EXISTS `gdn_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `TreeLeft` int(11) DEFAULT NULL,
  `TreeRight` int(11) DEFAULT NULL,
  `Depth` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateMarkedRead` datetime DEFAULT NULL,
  `AllowDiscussions` tinyint(4) NOT NULL DEFAULT '1',
  `Archived` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UrlCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `CssClass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PermissionCategoryID` int(11) NOT NULL DEFAULT '-1',
  `PointsCategoryID` int(11) NOT NULL DEFAULT '0',
  `HideAllDiscussions` tinyint(4) NOT NULL DEFAULT '0',
  `DisplayAs` enum('Categories','Discussions','Heading','Default') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default',
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `LastDiscussionID` int(11) DEFAULT NULL,
  `LastDateInserted` datetime DEFAULT NULL,
  `AllowedDiscussionTypes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DefaultDiscussionType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `FK_Category_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_category`
--

LOCK TABLES `gdn_category` WRITE;
/*!40000 ALTER TABLE `gdn_category` DISABLE KEYS */;
INSERT INTO `gdn_category` VALUES (-1,NULL,1,4,0,0,0,NULL,1,0,'Root','root','Root of category tree. Users should never see this.',1,NULL,NULL,-1,0,0,'Default',1,1,'2017-12-10 08:23:06','2017-12-10 08:23:06',NULL,NULL,NULL,NULL,NULL),(1,-1,2,3,1,1,1,NULL,1,0,'General','general','General discussions',2,NULL,NULL,-1,0,0,'Default',1,1,'2017-12-10 08:23:06','2017-12-10 08:23:06',2,3,'2017-12-10 13:38:31',NULL,NULL);
/*!40000 ALTER TABLE `gdn_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_comment`
--

DROP TABLE IF EXISTS `gdn_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_comment` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DeleteUserID` int(11) DEFAULT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flag` tinyint(4) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CommentID`),
  KEY `IX_Comment_1` (`DiscussionID`,`DateInserted`),
  KEY `IX_Comment_DateInserted` (`DateInserted`),
  KEY `FK_Comment_InsertUserID` (`InsertUserID`),
  FULLTEXT KEY `TX_Comment` (`Body`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_comment`
--

LOCK TABLES `gdn_comment` WRITE;
/*!40000 ALTER TABLE `gdn_comment` DISABLE KEYS */;
INSERT INTO `gdn_comment` VALUES (2,3,2,NULL,NULL,'rrr','Markdown','2017-12-10 13:34:21',NULL,NULL,'127.0.0.1',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `gdn_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_conversation`
--

DROP TABLE IF EXISTS `gdn_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_conversation` (
  `ConversationID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contributors` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FirstMessageID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountMessages` int(11) NOT NULL DEFAULT '0',
  `CountParticipants` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ConversationID`),
  KEY `IX_Conversation_Type` (`Type`),
  KEY `IX_Conversation_RegardingID` (`RegardingID`),
  KEY `FK_Conversation_FirstMessageID` (`FirstMessageID`),
  KEY `FK_Conversation_InsertUserID` (`InsertUserID`),
  KEY `FK_Conversation_DateInserted` (`DateInserted`),
  KEY `FK_Conversation_UpdateUserID` (`UpdateUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_conversation`
--

LOCK TABLES `gdn_conversation` WRITE;
/*!40000 ALTER TABLE `gdn_conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_conversationmessage`
--

DROP TABLE IF EXISTS `gdn_conversationmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_conversationmessage` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `ConversationID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `FK_ConversationMessage_ConversationID` (`ConversationID`),
  KEY `FK_ConversationMessage_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_conversationmessage`
--

LOCK TABLES `gdn_conversationmessage` WRITE;
/*!40000 ALTER TABLE `gdn_conversationmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_conversationmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_discussion`
--

DROP TABLE IF EXISTS `gdn_discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_discussion` (
  `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `FirstCommentID` int(11) DEFAULT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` text COLLATE utf8_unicode_ci,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountViews` int(11) NOT NULL DEFAULT '1',
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateLastComment` datetime DEFAULT NULL,
  `LastCommentUserID` int(11) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DiscussionID`),
  KEY `IX_Discussion_Type` (`Type`),
  KEY `IX_Discussion_ForeignID` (`ForeignID`),
  KEY `IX_Discussion_DateInserted` (`DateInserted`),
  KEY `IX_Discussion_DateLastComment` (`DateLastComment`),
  KEY `IX_Discussion_RegardingID` (`RegardingID`),
  KEY `IX_Discussion_CategoryPages` (`CategoryID`,`DateLastComment`),
  KEY `IX_Discussion_CategoryInserted` (`CategoryID`,`DateInserted`),
  KEY `FK_Discussion_InsertUserID` (`InsertUserID`),
  FULLTEXT KEY `TX_Discussion` (`Name`,`Body`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_discussion`
--

LOCK TABLES `gdn_discussion` WRITE;
/*!40000 ALTER TABLE `gdn_discussion` DISABLE KEYS */;
INSERT INTO `gdn_discussion` VALUES (3,NULL,NULL,1,6,NULL,2,2,'Hukum Menambah Tanda Pada Al-Quran','Salam, boleh ke kita nak tambah tanda/simbol kita sendiri dalam ayat Al-Quran untuk memudahkan bacaan kita sendiri?','Markdown',NULL,1,NULL,1,0,0,0,'2017-12-10 13:22:03',NULL,'127.0.0.1',NULL,'2017-12-10 13:34:21',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `gdn_discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_draft`
--

DROP TABLE IF EXISTS `gdn_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_draft` (
  `DraftID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`DraftID`),
  KEY `FK_Draft_DiscussionID` (`DiscussionID`),
  KEY `FK_Draft_CategoryID` (`CategoryID`),
  KEY `FK_Draft_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_draft`
--

LOCK TABLES `gdn_draft` WRITE;
/*!40000 ALTER TABLE `gdn_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_invitation`
--

DROP TABLE IF EXISTS `gdn_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_invitation` (
  `InvitationID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoleIDs` text COLLATE utf8_unicode_ci,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `AcceptedUserID` int(11) DEFAULT NULL,
  `DateExpires` datetime DEFAULT NULL,
  PRIMARY KEY (`InvitationID`),
  UNIQUE KEY `UX_Invitation` (`Code`),
  UNIQUE KEY `UX_Invitation_code` (`Code`),
  KEY `IX_Invitation_Email` (`Email`),
  KEY `IX_Invitation_userdate` (`InsertUserID`,`DateInserted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_invitation`
--

LOCK TABLES `gdn_invitation` WRITE;
/*!40000 ALTER TABLE `gdn_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_log`
--

DROP TABLE IF EXISTS `gdn_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_log` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `Operation` enum('Delete','Edit','Spam','Moderate','Pending','Ban','Error') COLLATE utf8_unicode_ci NOT NULL,
  `RecordType` enum('Discussion','Comment','User','Registration','Activity','ActivityComment','Configuration','Group') COLLATE utf8_unicode_ci NOT NULL,
  `TransactionLogID` int(11) DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `RecordUserID` int(11) DEFAULT NULL,
  `RecordDate` datetime NOT NULL,
  `RecordIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OtherUserIDs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `ParentRecordID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Data` mediumtext COLLATE utf8_unicode_ci,
  `CountGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  KEY `IX_Log_Operation` (`Operation`),
  KEY `IX_Log_RecordType` (`RecordType`),
  KEY `IX_Log_RecordID` (`RecordID`),
  KEY `IX_Log_RecordUserID` (`RecordUserID`),
  KEY `IX_Log_RecordIPAddress` (`RecordIPAddress`),
  KEY `IX_Log_DateInserted` (`DateInserted`),
  KEY `IX_Log_ParentRecordID` (`ParentRecordID`),
  KEY `FK_Log_CategoryID` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_log`
--

LOCK TABLES `gdn_log` WRITE;
/*!40000 ALTER TABLE `gdn_log` DISABLE KEYS */;
INSERT INTO `gdn_log` VALUES (1,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:23:14',NULL,2,'2017-12-10 08:23:14','127.0.0.1','',NULL,NULL,NULL,'a:1:{s:4:\"_New\";a:7:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(2,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:23:19',NULL,2,'2017-12-10 08:23:19','127.0.0.1','',NULL,NULL,NULL,'a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(3,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:27:17',NULL,2,'2017-12-10 08:27:17','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:15:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"LRIILQMS6BMH.jpg\";s:10:\"MobileLogo\";s:16:\"8Y8BB9HCQBU6.jpg\";s:7:\"FavIcon\";s:28:\"favicon_a0aeddea6b656bb4.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(4,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:37:37',NULL,2,'2017-12-10 08:37:37','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:15:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"LRIILQMS6BMH.jpg\";s:10:\"MobileLogo\";s:16:\"8Y8BB9HCQBU6.jpg\";s:7:\"FavIcon\";s:28:\"favicon_a0aeddea6b656bb4.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"XOL1NK4hbatmPISQ\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"LRIILQMS6BMH.jpg\";s:10:\"MobileLogo\";s:16:\"8Y8BB9HCQBU6.jpg\";s:7:\"FavIcon\";s:28:\"favicon_a0aeddea6b656bb4.ico\";s:13:\"DefaultAvatar\";s:30:\"defaultavatar/CCEATE9UU2RR.jpg\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(5,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:43:18',NULL,3,'2017-12-10 08:43:18','127.0.0.1','',NULL,NULL,NULL,'a:1:{s:4:\"_New\";a:7:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(6,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:43:22',NULL,3,'2017-12-10 08:43:22','127.0.0.1','',NULL,NULL,NULL,'a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(7,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:44:04',NULL,3,'2017-12-10 08:44:04','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:15:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(8,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:44:52',NULL,3,'2017-12-10 08:44:52','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:15:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";s:13:\"DefaultAvatar\";s:30:\"defaultavatar/PKJ96BFCXEU3.jpg\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(9,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:48:24',NULL,3,'2017-12-10 08:48:24','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";s:13:\"DefaultAvatar\";s:30:\"defaultavatar/PKJ96BFCXEU3.jpg\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:17:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";s:13:\"DefaultAvatar\";s:30:\"defaultavatar/PKJ96BFCXEU3.jpg\";s:6:\"Locale\";s:5:\"ms_MY\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(10,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 08:48:38',NULL,3,'2017-12-10 08:48:38','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:17:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";s:13:\"DefaultAvatar\";s:30:\"defaultavatar/PKJ96BFCXEU3.jpg\";s:6:\"Locale\";s:5:\"ms_MY\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledLocales\";a:1:{s:8:\"vf_ms_MY\";s:5:\"ms_MY\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:17:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"MfgYmboeXcrgg3OP\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"MQBPNCE7TNB0.jpg\";s:10:\"MobileLogo\";s:16:\"H3SMTLEVJSDU.jpg\";s:7:\"FavIcon\";s:28:\"favicon_304f031563f4681d.ico\";s:13:\"DefaultAvatar\";s:30:\"defaultavatar/PKJ96BFCXEU3.jpg\";s:6:\"Locale\";s:5:\"ms_MY\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(11,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:08:40',NULL,4,'2017-12-10 09:08:40','127.0.0.1','',NULL,NULL,NULL,'a:1:{s:4:\"_New\";a:7:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(12,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:08:44',NULL,4,'2017-12-10 09:08:44','127.0.0.1','',NULL,NULL,NULL,'a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(13,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:08:57',NULL,4,'2017-12-10 09:08:57','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(14,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:09:12',NULL,4,'2017-12-10 09:09:12','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(15,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:28:34',NULL,4,'2017-12-10 09:28:34','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(16,'Delete','User',NULL,4,NULL,'2017-12-10 09:08:39','127.0.0.1',4,'2017-12-10 09:30:25','127.0.0.1','',NULL,NULL,NULL,'a:45:{s:6:\"UserID\";i:4;s:4:\"Name\";s:5:\"admin\";s:8:\"Password\";s:60:\"$2a$08$CscyxKnU8H3vSHqWfu2Qqe1jQvRi.9mHZ73LdaAmQQKzhyhj4M2Mi\";s:10:\"HashMethod\";s:7:\"Vanilla\";s:5:\"Photo\";N;s:5:\"Title\";N;s:8:\"Location\";N;s:5:\"About\";N;s:5:\"Email\";s:16:\"coisox@gmail.com\";s:9:\"ShowEmail\";i:0;s:6:\"Gender\";s:1:\"u\";s:11:\"CountVisits\";i:0;s:16:\"CountInvitations\";i:0;s:18:\"CountNotifications\";N;s:12:\"InviteUserID\";N;s:13:\"DiscoveryText\";N;s:11:\"Preferences\";N;s:11:\"Permissions\";a:38:{i:0;s:17:\"Garden.Email.View\";i:1;s:22:\"Garden.Settings.Manage\";i:2;s:20:\"Garden.Settings.View\";i:3;s:19:\"Garden.SignIn.Allow\";i:4;s:16:\"Garden.Users.Add\";i:5;s:17:\"Garden.Users.Edit\";i:6;s:19:\"Garden.Users.Delete\";i:7;s:20:\"Garden.Users.Approve\";i:8;s:22:\"Garden.Activity.Delete\";i:9;s:20:\"Garden.Activity.View\";i:10;s:20:\"Garden.Profiles.View\";i:11;s:20:\"Garden.Profiles.Edit\";i:12;s:22:\"Garden.Curation.Manage\";i:13;s:24:\"Garden.Moderation.Manage\";i:14;s:24:\"Garden.PersonalInfo.View\";i:15;s:34:\"Garden.AdvancedNotifications.Allow\";i:16;s:23:\"Garden.Community.Manage\";i:17;s:31:\"Conversations.Conversations.Add\";i:18;s:24:\"Vanilla.Discussions.View\";i:19;s:23:\"Vanilla.Discussions.Add\";i:20;s:24:\"Vanilla.Discussions.Edit\";i:21;s:28:\"Vanilla.Discussions.Announce\";i:22;s:24:\"Vanilla.Discussions.Sink\";i:23;s:25:\"Vanilla.Discussions.Close\";i:24;s:26:\"Vanilla.Discussions.Delete\";i:25;s:20:\"Vanilla.Comments.Add\";i:26;s:21:\"Vanilla.Comments.Edit\";i:27;s:23:\"Vanilla.Comments.Delete\";s:24:\"Vanilla.Discussions.View\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Discussions.Add\";a:1:{i:0;i:-1;}s:24:\"Vanilla.Discussions.Edit\";a:1:{i:0;i:-1;}s:28:\"Vanilla.Discussions.Announce\";a:1:{i:0;i:-1;}s:24:\"Vanilla.Discussions.Sink\";a:1:{i:0;i:-1;}s:25:\"Vanilla.Discussions.Close\";a:1:{i:0;i:-1;}s:26:\"Vanilla.Discussions.Delete\";a:1:{i:0;i:-1;}s:20:\"Vanilla.Comments.Add\";a:1:{i:0;i:-1;}s:21:\"Vanilla.Comments.Edit\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Comments.Delete\";a:1:{i:0;i:-1;}}s:10:\"Attributes\";a:1:{s:12:\"TransientKey\";s:16:\"Sa6NlCFIkSWHqCsd\";}s:18:\"DateSetInvitations\";N;s:11:\"DateOfBirth\";s:19:\"1975-09-16 00:00:00\";s:14:\"DateFirstVisit\";s:19:\"2017-12-10 09:08:39\";s:14:\"DateLastActive\";s:19:\"2017-12-10 09:08:39\";s:13:\"LastIPAddress\";s:9:\"127.0.0.1\";s:14:\"AllIPAddresses\";a:1:{i:0;s:9:\"127.0.0.1\";}s:12:\"DateInserted\";s:19:\"2017-12-10 09:08:39\";s:15:\"InsertIPAddress\";s:9:\"127.0.0.1\";s:11:\"DateUpdated\";s:19:\"2017-12-10 09:08:39\";s:15:\"UpdateIPAddress\";N;s:10:\"HourOffset\";i:8;s:5:\"Score\";N;s:5:\"Admin\";i:1;s:9:\"Confirmed\";i:1;s:8:\"Verified\";i:0;s:6:\"Banned\";i:0;s:7:\"Deleted\";i:0;s:6:\"Points\";i:0;s:24:\"CountUnreadConversations\";N;s:16:\"CountDiscussions\";i:1;s:22:\"CountUnreadDiscussions\";N;s:13:\"CountComments\";i:0;s:11:\"CountDrafts\";i:0;s:14:\"CountBookmarks\";N;s:9:\"_CssClass\";s:0:\"\";s:5:\"_Data\";a:1:{s:10:\"Discussion\";a:1:{i:0;a:27:{s:12:\"DiscussionID\";i:2;s:4:\"Type\";N;s:9:\"ForeignID\";N;s:10:\"CategoryID\";i:1;s:12:\"InsertUserID\";i:4;s:12:\"UpdateUserID\";N;s:14:\"FirstCommentID\";N;s:13:\"LastCommentID\";N;s:4:\"Name\";s:42:\"Simbol rekaan sendiri untuk bantuan bacaan\";s:4:\"Body\";s:180:\"Salam ustaz, kalo kita reka simbol sendiri dan tulis pada ayat Al-Quran untuk memudahkan bacaan diri kita sendiri, apa hukumnya? Adakah ianya dikira sebagai mengubah ayat Al-Quran?\";s:6:\"Format\";s:8:\"Markdown\";s:4:\"Tags\";N;s:13:\"CountComments\";i:0;s:14:\"CountBookmarks\";N;s:10:\"CountViews\";i:1;s:6:\"Closed\";i:0;s:8:\"Announce\";i:0;s:4:\"Sink\";i:0;s:12:\"DateInserted\";s:19:\"2017-12-10 09:29:40\";s:11:\"DateUpdated\";N;s:15:\"InsertIPAddress\";s:9:\"127.0.0.1\";s:15:\"UpdateIPAddress\";N;s:15:\"DateLastComment\";s:19:\"2017-12-10 09:29:40\";s:17:\"LastCommentUserID\";N;s:5:\"Score\";N;s:10:\"Attributes\";N;s:11:\"RegardingID\";N;}}}}',NULL),(17,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:32:32',NULL,2,'2017-12-10 09:32:32','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:8:\"Approval\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(18,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:36:25',NULL,2,'2017-12-10 09:36:25','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:8:\"Approval\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LdyajwUAAAAAEZPOy0T3CJj_6rj8iWg8bVVluh_\";s:16:\"CaptchaPublicKey\";s:40:\"6LdyajwUAAAAAMugkgLciCNs3h4J0luw7cYWmQMW\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(19,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:39:38',NULL,2,'2017-12-10 09:39:38','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LdyajwUAAAAAEZPOy0T3CJj_6rj8iWg8bVVluh_\";s:16:\"CaptchaPublicKey\";s:40:\"6LdyajwUAAAAAMugkgLciCNs3h4J0luw7cYWmQMW\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:8:\"Approval\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LdyajwUAAAAAEZPOy0T3CJj_6rj8iWg8bVVluh_\";s:16:\"CaptchaPublicKey\";s:40:\"6LdyajwUAAAAAMugkgLciCNs3h4J0luw7cYWmQMW\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(20,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:40:13',NULL,2,'2017-12-10 09:40:13','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:8:\"Approval\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LdyajwUAAAAAEZPOy0T3CJj_6rj8iWg8bVVluh_\";s:16:\"CaptchaPublicKey\";s:40:\"6LdyajwUAAAAAMugkgLciCNs3h4J0luw7cYWmQMW\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:8:\"Approval\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(21,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:44:49',NULL,2,'2017-12-10 09:44:49','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:8:\"Approval\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(22,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:45:12',NULL,2,'2017-12-10 09:45:12','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(23,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:45:23',NULL,2,'2017-12-10 09:45:23','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(24,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:45:34',NULL,2,'2017-12-10 09:45:34','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(25,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:47:45',NULL,2,'2017-12-10 09:47:45','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LesazwUAAAAAJCA1KldLoKDo8pp22SkpioNLXvU\";s:16:\"CaptchaPublicKey\";s:40:\"6LesazwUAAAAAAyyHth6GaKkNHugFrDFdrg2oDyU\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LfXbDwUAAAAAOhNVKr2drriJ96VkEcIxUoqtXxy\";s:16:\"CaptchaPublicKey\";s:40:\"6LfXbDwUAAAAALGFFbmzaQUSW7o37TINu7aReAy4\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(26,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:50:53',NULL,2,'2017-12-10 09:50:53','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LfXbDwUAAAAAOhNVKr2drriJ96VkEcIxUoqtXxy\";s:16:\"CaptchaPublicKey\";s:40:\"6LfXbDwUAAAAALGFFbmzaQUSW7o37TINu7aReAy4\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LfXbDwUAAAAAOhNVKr2drriJ96VkEcIxUoqtXxy\";s:16:\"CaptchaPublicKey\";s:40:\"6LfXbDwUAAAAALGFFbmzaQUSW7o37TINu7aReAy4\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:2:\"25\";s:12:\"SmtpSecurity\";s:0:\"\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(27,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 09:51:34',NULL,2,'2017-12-10 09:51:34','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LfXbDwUAAAAAOhNVKr2drriJ96VkEcIxUoqtXxy\";s:16:\"CaptchaPublicKey\";s:40:\"6LfXbDwUAAAAALGFFbmzaQUSW7o37TINu7aReAy4\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:2:\"25\";s:12:\"SmtpSecurity\";s:0:\"\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LfXbDwUAAAAAOhNVKr2drriJ96VkEcIxUoqtXxy\";s:16:\"CaptchaPublicKey\";s:40:\"6LfXbDwUAAAAALGFFbmzaQUSW7o37TINu7aReAy4\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(28,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:06:17',NULL,2,'2017-12-10 13:06:17','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:40:\"6LfXbDwUAAAAAOhNVKr2drriJ96VkEcIxUoqtXxy\";s:16:\"CaptchaPublicKey\";s:40:\"6LfXbDwUAAAAALGFFbmzaQUSW7o37TINu7aReAy4\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(29,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:06:23',NULL,2,'2017-12-10 13:06:23','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(30,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:13:57',NULL,2,'2017-12-10 13:13:57','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(31,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:16:35',NULL,2,'2017-12-10 13:16:35','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";b:0;s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(32,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:17:25',NULL,2,'2017-12-10 13:17:25','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";b:0;s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(33,'Delete','Discussion',33,1,1,'2017-12-10 08:23:13',NULL,2,'2017-12-10 13:22:22','127.0.0.1','',NULL,NULL,1,'a:28:{s:12:\"DiscussionID\";i:1;s:4:\"Type\";N;s:9:\"ForeignID\";s:4:\"stub\";s:10:\"CategoryID\";i:1;s:12:\"InsertUserID\";i:1;s:12:\"UpdateUserID\";N;s:14:\"FirstCommentID\";N;s:13:\"LastCommentID\";i:1;s:4:\"Name\";s:35:\"BAM! You&rsquo;ve got a sweet forum\";s:4:\"Body\";s:994:\"There&rsquo;s nothing sweeter than a fresh new forum, ready to welcome your community. A Vanilla Forum has all the bits and pieces you need to build an awesome discussion platform customized to your needs. Here&rsquo;s a few tips:\n<ul>\n   <li>Use the <a href=\"/dashboard/settings/gettingstarted\">Getting Started</a> list in the Dashboard to configure your site.</li>\n   <li>Don&rsquo;t use too many categories. We recommend 3-8. Keep it simple!</li>\n   <li>&ldquo;Announce&rdquo; a discussion (click the gear) to stick to the top of the list, and &ldquo;Close&rdquo; it to stop further comments.</li>\n   <li>Use &ldquo;Sink&rdquo; to take attention away from a discussion. New comments will no longer bring it back to the top of the list.</li>\n   <li>Bookmark a discussion (click the star) to get notifications for new comments. You can edit notification settings from your profile.</li>\n</ul>\nGo ahead and edit or delete this discussion, then spread the word to get this place cooking. Cheers!\";s:6:\"Format\";s:4:\"Html\";s:4:\"Tags\";N;s:13:\"CountComments\";i:1;s:14:\"CountBookmarks\";N;s:10:\"CountViews\";i:1;s:6:\"Closed\";i:0;s:8:\"Announce\";i:0;s:4:\"Sink\";i:0;s:12:\"DateInserted\";s:19:\"2017-12-10 08:23:13\";s:11:\"DateUpdated\";N;s:15:\"InsertIPAddress\";N;s:15:\"UpdateIPAddress\";N;s:15:\"DateLastComment\";s:19:\"2017-12-10 08:23:13\";s:17:\"LastCommentUserID\";i:1;s:5:\"Score\";N;s:10:\"Attributes\";N;s:11:\"RegardingID\";N;s:5:\"_Data\";a:1:{s:7:\"Comment\";a:1:{i:0;a:15:{s:9:\"CommentID\";i:1;s:12:\"DiscussionID\";i:1;s:12:\"InsertUserID\";i:1;s:12:\"UpdateUserID\";N;s:12:\"DeleteUserID\";N;s:4:\"Body\";s:340:\"This is the first comment on your site and it&rsquo;s an important one.\n\nDon&rsquo;t see your must-have feature? We keep Vanilla nice and simple by default. Use <b>addons</b> to get the special sauce your community needs.\n\nNot sure which addons to enable? Our favorites are Button Bar and Tagging. They&rsquo;re almost always a great start.\";s:6:\"Format\";s:4:\"Html\";s:12:\"DateInserted\";s:19:\"2017-12-10 08:23:13\";s:11:\"DateDeleted\";N;s:11:\"DateUpdated\";N;s:15:\"InsertIPAddress\";N;s:15:\"UpdateIPAddress\";N;s:4:\"Flag\";i:0;s:5:\"Score\";N;s:10:\"Attributes\";N;}}}}',NULL),(34,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:26:35',NULL,2,'2017-12-10 13:26:35','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledLocales\";a:1:{s:8:\"vf_ms_MY\";s:5:\"ms_MY\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(35,'Edit','Configuration',NULL,NULL,NULL,'2017-12-10 13:26:50',NULL,2,'2017-12-10 13:26:50','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledLocales\";a:1:{s:8:\"vf_ms_MY\";s:5:\"ms_MY\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:14:\"quransah_forum\";s:4:\"Host\";s:9:\"localhost\";s:4:\"User\";s:4:\"root\";s:8:\"Password\";s:0:\"\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledLocales\";a:1:{s:8:\"vf_ms_MY\";s:5:\"ms_MY\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"noCaptcha\";b:1;}s:6:\"Garden\";a:17:{s:5:\"Title\";s:14:\"Quransah Forum\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"vzKwCg2V3LfCOJrI\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:32;s:1:\"0\";i:16;s:1:\"0\";}}s:5:\"Email\";a:10:{s:11:\"SupportName\";s:14:\"Quransah Forum\";s:6:\"Format\";s:4:\"text\";s:14:\"SupportAddress\";s:16:\"coisox@gmail.com\";s:7:\"UseSmtp\";s:1:\"1\";s:8:\"SmtpHost\";s:14:\"smtp.gmail.com\";s:8:\"SmtpUser\";s:6:\"coisox\";s:12:\"SmtpPassword\";s:9:\"Try001122\";s:8:\"SmtpPort\";s:3:\"587\";s:12:\"SmtpSecurity\";s:3:\"tls\";s:10:\"OmitToName\";b:0;}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:5:\"2.3.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:9:\"Installed\";b:1;s:13:\"DefaultAvatar\";s:30:\"defaultavatar/RBHDS265I1D6.jpg\";s:13:\"HomepageTitle\";s:14:\"Quransah Forum\";s:11:\"Description\";s:0:\"\";s:4:\"Logo\";s:16:\"U5XJPJNA6T21.jpg\";s:10:\"MobileLogo\";s:16:\"0J0OTP5CA8XJ.jpg\";s:7:\"FavIcon\";s:28:\"favicon_86f0827cc8a4712d.ico\";s:6:\"Locale\";s:5:\"ms_MY\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.3.1\";}}}',NULL),(36,'Delete','Discussion',36,4,2,'2017-12-10 13:38:31','127.0.0.1',2,'2017-12-10 13:43:18','127.0.0.1','',NULL,NULL,1,'a:27:{s:12:\"DiscussionID\";i:4;s:4:\"Type\";N;s:9:\"ForeignID\";N;s:10:\"CategoryID\";i:1;s:12:\"InsertUserID\";i:2;s:12:\"UpdateUserID\";N;s:14:\"FirstCommentID\";N;s:13:\"LastCommentID\";N;s:4:\"Name\";s:5:\"ccccc\";s:4:\"Body\";s:2:\"cc\";s:6:\"Format\";s:8:\"Markdown\";s:4:\"Tags\";N;s:13:\"CountComments\";i:0;s:14:\"CountBookmarks\";N;s:10:\"CountViews\";i:1;s:6:\"Closed\";i:0;s:8:\"Announce\";i:0;s:4:\"Sink\";i:0;s:12:\"DateInserted\";s:19:\"2017-12-10 13:38:31\";s:11:\"DateUpdated\";N;s:15:\"InsertIPAddress\";s:9:\"127.0.0.1\";s:15:\"UpdateIPAddress\";N;s:15:\"DateLastComment\";s:19:\"2017-12-10 13:38:31\";s:17:\"LastCommentUserID\";N;s:5:\"Score\";N;s:10:\"Attributes\";N;s:11:\"RegardingID\";N;}',NULL);
/*!40000 ALTER TABLE `gdn_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_media`
--

DROP TABLE IF EXISTS `gdn_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_media` (
  `MediaID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignID` int(11) DEFAULT NULL,
  `ForeignTable` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImageWidth` smallint(5) unsigned DEFAULT NULL,
  `ImageHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbWidth` smallint(5) unsigned DEFAULT NULL,
  `ThumbHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MediaID`),
  KEY `IX_Media_Foreign` (`ForeignID`,`ForeignTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_media`
--

LOCK TABLES `gdn_media` WRITE;
/*!40000 ALTER TABLE `gdn_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_message`
--

DROP TABLE IF EXISTS `gdn_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllowDismiss` tinyint(4) NOT NULL DEFAULT '1',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `IncludeSubcategories` tinyint(4) NOT NULL DEFAULT '0',
  `AssetTarget` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CssClass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_message`
--

LOCK TABLES `gdn_message` WRITE;
/*!40000 ALTER TABLE `gdn_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_permission`
--

DROP TABLE IF EXISTS `gdn_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_permission` (
  `PermissionID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  `JunctionTable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionColumn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionID` int(11) DEFAULT NULL,
  `Garden.Email.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.SignIn.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Curation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.PersonalInfo.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.AdvancedNotifications.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Community.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Conversations.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Approval.Require` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Me` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Close` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PermissionID`),
  KEY `FK_Permission_RoleID` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_permission`
--

LOCK TABLES `gdn_permission` WRITE;
/*!40000 ALTER TABLE `gdn_permission` DISABLE KEYS */;
INSERT INTO `gdn_permission` VALUES (1,0,NULL,NULL,NULL,3,2,2,3,2,2,2,2,2,3,3,3,2,2,2,2,2,2,3,2,3,0,0,0,0,0,0,0,0,0,0),(2,0,'Category','PermissionCategoryID',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,2,2,2,2,2,3,2,2),(3,2,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(4,2,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(5,3,NULL,NULL,NULL,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(6,3,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(7,4,NULL,NULL,NULL,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(8,4,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(9,8,NULL,NULL,NULL,1,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0),(10,8,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0),(11,32,NULL,NULL,NULL,1,0,0,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1),(12,32,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1),(13,16,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,1,1,1,1,1,1,1,1,1,1),(14,16,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `gdn_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_regarding`
--

DROP TABLE IF EXISTS `gdn_regarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_regarding` (
  `RegardingID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `OriginalContent` text COLLATE utf8_unicode_ci,
  `ParentType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `Reports` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegardingID`),
  KEY `FK_Regarding_Type` (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_regarding`
--

LOCK TABLES `gdn_regarding` WRITE;
/*!40000 ALTER TABLE `gdn_regarding` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_regarding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_role`
--

DROP TABLE IF EXISTS `gdn_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` enum('guest','unconfirmed','applicant','member','moderator','administrator') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Deletable` tinyint(4) NOT NULL DEFAULT '1',
  `CanSession` tinyint(4) NOT NULL DEFAULT '1',
  `PersonalInfo` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_role`
--

LOCK TABLES `gdn_role` WRITE;
/*!40000 ALTER TABLE `gdn_role` DISABLE KEYS */;
INSERT INTO `gdn_role` VALUES (2,'Guest','Guests can only view content. Anyone browsing the site who is not signed in is considered to be a \"Guest\".','guest',1,0,0,0),(3,'Unconfirmed','Users must confirm their emails before becoming full members. They get assigned to this role.','unconfirmed',2,0,1,0),(4,'Applicant','Users who have applied for membership, but have not yet been accepted. They have the same permissions as guests.','applicant',3,0,1,0),(8,'Member','Members can participate in discussions.','member',4,1,1,0),(16,'Administrator','Administrators have permission to do anything.','administrator',6,1,1,0),(32,'Moderator','Moderators have permission to edit most content.','moderator',5,1,1,0);
/*!40000 ALTER TABLE `gdn_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_session`
--

DROP TABLE IF EXISTS `gdn_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_session` (
  `SessionID` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `TransientKey` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_session`
--

LOCK TABLES `gdn_session` WRITE;
/*!40000 ALTER TABLE `gdn_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_spammer`
--

DROP TABLE IF EXISTS `gdn_spammer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_spammer` (
  `UserID` int(11) NOT NULL,
  `CountSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CountDeletedSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_spammer`
--

LOCK TABLES `gdn_spammer` WRITE;
/*!40000 ALTER TABLE `gdn_spammer` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_spammer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_tag`
--

DROP TABLE IF EXISTS `gdn_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_tag` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ParentTagID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `CategoryID` int(11) NOT NULL DEFAULT '-1',
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `UX_Tag` (`Name`,`CategoryID`),
  KEY `IX_Tag_FullName` (`FullName`),
  KEY `IX_Tag_Type` (`Type`),
  KEY `FK_Tag_ParentTagID` (`ParentTagID`),
  KEY `FK_Tag_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_tag`
--

LOCK TABLES `gdn_tag` WRITE;
/*!40000 ALTER TABLE `gdn_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_tagdiscussion`
--

DROP TABLE IF EXISTS `gdn_tagdiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_tagdiscussion` (
  `TagID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`TagID`,`DiscussionID`),
  KEY `IX_TagDiscussion_CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_tagdiscussion`
--

LOCK TABLES `gdn_tagdiscussion` WRITE;
/*!40000 ALTER TABLE `gdn_tagdiscussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_tagdiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_user`
--

DROP TABLE IF EXISTS `gdn_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varbinary(100) NOT NULL,
  `HashMethod` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8_unicode_ci,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ShowEmail` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` enum('u','m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'u',
  `CountVisits` int(11) NOT NULL DEFAULT '0',
  `CountInvitations` int(11) NOT NULL DEFAULT '0',
  `CountNotifications` int(11) DEFAULT NULL,
  `InviteUserID` int(11) DEFAULT NULL,
  `DiscoveryText` text COLLATE utf8_unicode_ci,
  `Preferences` text COLLATE utf8_unicode_ci,
  `Permissions` text COLLATE utf8_unicode_ci,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateSetInvitations` datetime DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `DateFirstVisit` datetime DEFAULT NULL,
  `DateLastActive` datetime DEFAULT NULL,
  `LastIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllIPAddresses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HourOffset` int(11) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT '0',
  `Confirmed` tinyint(4) NOT NULL DEFAULT '1',
  `Verified` tinyint(4) NOT NULL DEFAULT '0',
  `Banned` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `Points` int(11) NOT NULL DEFAULT '0',
  `CountUnreadConversations` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) DEFAULT NULL,
  `CountUnreadDiscussions` int(11) DEFAULT NULL,
  `CountComments` int(11) DEFAULT NULL,
  `CountDrafts` int(11) DEFAULT NULL,
  `CountBookmarks` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_User_Name` (`Name`),
  KEY `IX_User_Email` (`Email`),
  KEY `IX_User_DateLastActive` (`DateLastActive`),
  KEY `IX_User_DateInserted` (`DateInserted`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_user`
--

LOCK TABLES `gdn_user` WRITE;
/*!40000 ALTER TABLE `gdn_user` DISABLE KEYS */;
INSERT INTO `gdn_user` VALUES (1,'System','QLI0DNP1JGLXA4Q2DM9C','Random','http://127.0.0.1/quransah/forum/applications/dashboard/design/images/usericon.png',NULL,NULL,NULL,'system@example.com',0,'u',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-10 08:22:47',NULL,NULL,NULL,0,NULL,2,1,0,0,0,0,NULL,0,NULL,NULL,NULL,NULL),(2,'admin','$2a$08$mLJxOx3svc2atbCpY6I6E.puO5lcufUztfvvzzWmtmykItfeXoTYu','Vanilla',NULL,NULL,NULL,NULL,'coisox@gmail.com',0,'u',1,0,NULL,NULL,NULL,NULL,'a:38:{i:0;s:17:\"Garden.Email.View\";i:1;s:22:\"Garden.Settings.Manage\";i:2;s:20:\"Garden.Settings.View\";i:3;s:19:\"Garden.SignIn.Allow\";i:4;s:16:\"Garden.Users.Add\";i:5;s:17:\"Garden.Users.Edit\";i:6;s:19:\"Garden.Users.Delete\";i:7;s:20:\"Garden.Users.Approve\";i:8;s:22:\"Garden.Activity.Delete\";i:9;s:20:\"Garden.Activity.View\";i:10;s:20:\"Garden.Profiles.View\";i:11;s:20:\"Garden.Profiles.Edit\";i:12;s:22:\"Garden.Curation.Manage\";i:13;s:24:\"Garden.Moderation.Manage\";i:14;s:24:\"Garden.PersonalInfo.View\";i:15;s:34:\"Garden.AdvancedNotifications.Allow\";i:16;s:23:\"Garden.Community.Manage\";i:17;s:31:\"Conversations.Conversations.Add\";i:18;s:24:\"Vanilla.Discussions.View\";i:19;s:23:\"Vanilla.Discussions.Add\";i:20;s:24:\"Vanilla.Discussions.Edit\";i:21;s:28:\"Vanilla.Discussions.Announce\";i:22;s:24:\"Vanilla.Discussions.Sink\";i:23;s:25:\"Vanilla.Discussions.Close\";i:24;s:26:\"Vanilla.Discussions.Delete\";i:25;s:20:\"Vanilla.Comments.Add\";i:26;s:21:\"Vanilla.Comments.Edit\";i:27;s:23:\"Vanilla.Comments.Delete\";s:24:\"Vanilla.Discussions.View\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Discussions.Add\";a:1:{i:0;i:-1;}s:24:\"Vanilla.Discussions.Edit\";a:1:{i:0;i:-1;}s:28:\"Vanilla.Discussions.Announce\";a:1:{i:0;i:-1;}s:24:\"Vanilla.Discussions.Sink\";a:1:{i:0;i:-1;}s:25:\"Vanilla.Discussions.Close\";a:1:{i:0;i:-1;}s:26:\"Vanilla.Discussions.Delete\";a:1:{i:0;i:-1;}s:20:\"Vanilla.Comments.Add\";a:1:{i:0;i:-1;}s:21:\"Vanilla.Comments.Edit\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Comments.Delete\";a:1:{i:0;i:-1;}}','a:3:{s:12:\"TransientKey\";s:16:\"ebZYBCikUZ1LPaSL\";s:16:\"LastLoginAttempt\";i:1512898393;s:9:\"LoginRate\";i:1;}',NULL,'1975-09-16 00:00:00','2017-12-10 08:23:01','2017-12-10 09:31:49','127.0.0.1','127.0.0.1','2017-12-10 08:23:01','127.0.0.1','2017-12-10 08:23:01',NULL,8,NULL,1,1,0,0,0,0,NULL,0,NULL,1,NULL,NULL),(3,'[Deleted User]','D86S9DPETR','Vanilla',NULL,NULL,NULL,'','user_3@deleted.email',0,'u',0,0,0,NULL,'',NULL,'','a:1:{s:5:\"State\";s:7:\"Deleted\";}',NULL,NULL,'2017-12-10 08:43:16','2017-12-10 08:43:16','127.0.0.1','127.0.0.1','2017-12-10 08:43:16','127.0.0.1','2017-12-10 09:34:15',NULL,0,NULL,0,1,0,0,1,0,0,0,0,0,0,0),(4,'[Deleted User]','VCMKYIBGYV','Vanilla',NULL,NULL,NULL,'','user_4@deleted.email',0,'u',0,0,0,NULL,'',NULL,'','a:1:{s:5:\"State\";s:7:\"Deleted\";}',NULL,NULL,'2017-12-10 09:08:39','2017-12-10 09:08:39','127.0.0.1','127.0.0.1','2017-12-10 09:08:39','127.0.0.1','2017-12-10 09:34:07',NULL,0,NULL,0,1,0,0,1,0,0,0,0,0,0,0),(5,'[Deleted User]','SCYCJXY1EJ','Vanilla',NULL,NULL,NULL,'','user_5@deleted.email',0,'u',0,0,0,NULL,'',NULL,'','a:1:{s:5:\"State\";s:7:\"Deleted\";}',NULL,NULL,'2017-12-10 09:48:25','2017-12-10 09:48:25','127.0.0.1','127.0.0.1','2017-12-10 09:48:25','127.0.0.1','2017-12-10 13:14:24',NULL,0,NULL,0,0,0,0,1,0,0,0,0,0,0,0),(6,'Aizal','$2a$08$J6VSzV5ZSAp9y7IxMgBdue.3dFmp00fa1flv5gF6ghOb1P7qXbix.','Vanilla',NULL,NULL,NULL,NULL,'aizal@ansi.com.my',0,'m',0,0,1,NULL,NULL,NULL,'a:12:{i:0;s:17:\"Garden.Email.View\";i:1;s:19:\"Garden.SignIn.Allow\";i:2;s:20:\"Garden.Activity.View\";i:3;s:20:\"Garden.Profiles.View\";i:4;s:20:\"Garden.Profiles.Edit\";i:5;s:31:\"Conversations.Conversations.Add\";i:6;s:24:\"Vanilla.Discussions.View\";i:7;s:23:\"Vanilla.Discussions.Add\";i:8;s:20:\"Vanilla.Comments.Add\";s:24:\"Vanilla.Discussions.View\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Discussions.Add\";a:1:{i:0;i:-1;}s:20:\"Vanilla.Comments.Add\";a:1:{i:0;i:-1;}}','a:4:{s:8:\"EmailKey\";s:8:\"Z7D6E03O\";s:12:\"TransientKey\";s:16:\"Dq8i5QFn5AktcBBZ\";s:24:\"CountDiscussionSpamCheck\";i:1;s:23:\"DateDiscussionSpamCheck\";s:19:\"2017-12-10 13:22:03\";}',NULL,NULL,'2017-12-10 13:15:18','2017-12-10 13:15:18','127.0.0.1','127.0.0.1','2017-12-10 13:15:18','127.0.0.1','2017-12-10 13:21:08','127.0.0.1',8,NULL,0,1,1,0,0,0,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `gdn_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthentication`
--

DROP TABLE IF EXISTS `gdn_userauthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthentication` (
  `ForeignUserKey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ForeignUserKey`,`ProviderKey`),
  KEY `FK_UserAuthentication_UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthentication`
--

LOCK TABLES `gdn_userauthentication` WRITE;
/*!40000 ALTER TABLE `gdn_userauthentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthenticationnonce`
--

DROP TABLE IF EXISTS `gdn_userauthenticationnonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthenticationnonce` (
  `Nonce` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL,
  PRIMARY KEY (`Nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthenticationnonce`
--

LOCK TABLES `gdn_userauthenticationnonce` WRITE;
/*!40000 ALTER TABLE `gdn_userauthenticationnonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthenticationnonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthenticationprovider`
--

DROP TABLE IF EXISTS `gdn_userauthenticationprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthenticationprovider` (
  `AuthenticationKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticationSchemeAlias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssociationSecret` text COLLATE utf8_unicode_ci,
  `AssociationHashMethod` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AuthenticateUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignInUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignOutUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProfileUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `Active` tinyint(4) NOT NULL DEFAULT '1',
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AuthenticationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthenticationprovider`
--

LOCK TABLES `gdn_userauthenticationprovider` WRITE;
/*!40000 ALTER TABLE `gdn_userauthenticationprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthenticationprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthenticationtoken`
--

DROP TABLE IF EXISTS `gdn_userauthenticationtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthenticationtoken` (
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserKey` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TokenSecret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TokenType` enum('request','access') COLLATE utf8_unicode_ci NOT NULL,
  `Authorized` tinyint(4) NOT NULL,
  `Timestamp` timestamp NOT NULL,
  `Lifetime` int(11) NOT NULL,
  PRIMARY KEY (`Token`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthenticationtoken`
--

LOCK TABLES `gdn_userauthenticationtoken` WRITE;
/*!40000 ALTER TABLE `gdn_userauthenticationtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthenticationtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usercategory`
--

DROP TABLE IF EXISTS `gdn_usercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usercategory` (
  `UserID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateMarkedRead` datetime DEFAULT NULL,
  `Unfollow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usercategory`
--

LOCK TABLES `gdn_usercategory` WRITE;
/*!40000 ALTER TABLE `gdn_usercategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usercategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usercomment`
--

DROP TABLE IF EXISTS `gdn_usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usercomment` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usercomment`
--

LOCK TABLES `gdn_usercomment` WRITE;
/*!40000 ALTER TABLE `gdn_usercomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userconversation`
--

DROP TABLE IF EXISTS `gdn_userconversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userconversation` (
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `CountReadMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  `DateCleared` datetime DEFAULT NULL,
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `DateConversationUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`ConversationID`),
  KEY `IX_UserConversation_Inbox` (`UserID`,`Deleted`,`DateConversationUpdated`),
  KEY `FK_UserConversation_ConversationID` (`ConversationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userconversation`
--

LOCK TABLES `gdn_userconversation` WRITE;
/*!40000 ALTER TABLE `gdn_userconversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userconversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userdiscussion`
--

DROP TABLE IF EXISTS `gdn_userdiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userdiscussion` (
  `UserID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateLastViewed` datetime DEFAULT NULL,
  `Dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Participated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`DiscussionID`),
  KEY `FK_UserDiscussion_DiscussionID` (`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userdiscussion`
--

LOCK TABLES `gdn_userdiscussion` WRITE;
/*!40000 ALTER TABLE `gdn_userdiscussion` DISABLE KEYS */;
INSERT INTO `gdn_userdiscussion` VALUES (2,3,NULL,1,'2017-12-10 13:34:21',0,0,1),(6,3,NULL,0,'2017-12-10 13:22:03',0,0,1);
/*!40000 ALTER TABLE `gdn_userdiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usermerge`
--

DROP TABLE IF EXISTS `gdn_usermerge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usermerge` (
  `MergeID` int(11) NOT NULL AUTO_INCREMENT,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MergeID`),
  KEY `FK_UserMerge_OldUserID` (`OldUserID`),
  KEY `FK_UserMerge_NewUserID` (`NewUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usermerge`
--

LOCK TABLES `gdn_usermerge` WRITE;
/*!40000 ALTER TABLE `gdn_usermerge` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usermerge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usermergeitem`
--

DROP TABLE IF EXISTS `gdn_usermergeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usermergeitem` (
  `MergeID` int(11) NOT NULL,
  `Table` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Column` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `RecordID` int(11) NOT NULL,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  KEY `FK_UserMergeItem_MergeID` (`MergeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usermergeitem`
--

LOCK TABLES `gdn_usermergeitem` WRITE;
/*!40000 ALTER TABLE `gdn_usermergeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usermergeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usermeta`
--

DROP TABLE IF EXISTS `gdn_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usermeta` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`UserID`,`Name`),
  KEY `IX_UserMeta_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usermeta`
--

LOCK TABLES `gdn_usermeta` WRITE;
/*!40000 ALTER TABLE `gdn_usermeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userpoints`
--

DROP TABLE IF EXISTS `gdn_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userpoints` (
  `SlotType` enum('d','w','m','y','a') COLLATE utf8_unicode_ci NOT NULL,
  `TimeSlot` datetime NOT NULL,
  `Source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Total',
  `CategoryID` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL,
  `Points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SlotType`,`TimeSlot`,`Source`,`CategoryID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userpoints`
--

LOCK TABLES `gdn_userpoints` WRITE;
/*!40000 ALTER TABLE `gdn_userpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userrole`
--

DROP TABLE IF EXISTS `gdn_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userrole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`),
  KEY `IX_UserRole_RoleID` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userrole`
--

LOCK TABLES `gdn_userrole` WRITE;
/*!40000 ALTER TABLE `gdn_userrole` DISABLE KEYS */;
INSERT INTO `gdn_userrole` VALUES (6,8),(2,16);
/*!40000 ALTER TABLE `gdn_userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10 21:54:40
