-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 26, 2013 at 04:26 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `linkpost`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `name`, `status`) VALUES
(1, 'Category1', 1),
(2, 'Category2', 1),
(3, 'Category3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `commentid` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `likes` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parentcommentid` int(11) NOT NULL,
  PRIMARY KEY (`commentid`),
  UNIQUE KEY `commentid` (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentid`, `text`, `likes`, `status`, `postid`, `date`, `parentcommentid`) VALUES
(1, 'This is first test comment', 1, 0, 11, '2013-01-23 19:40:58', -1),
(3, 'this is second comment', 0, 0, 11, '2013-01-08 18:30:00', -1),
(4, 'This is third comment', 1, 0, 11, '2013-01-23 19:38:17', -1),
(5, 'asdasad', 1, 0, 11, '2013-01-23 19:41:03', 1),
(6, 'bbbbbbb', 0, 0, 11, '2013-01-23 19:33:26', 3),
(7, 'this is reply', 0, 0, 11, '2013-01-13 16:17:21', 6),
(8, 'This is reply2', 1, 0, 11, '2013-01-13 16:19:39', 7),
(9, 'Reply3', 1, 0, 11, '2013-01-13 16:21:29', 8),
(10, '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888889999999999999999999999999', -1, 0, 11, '2013-01-13 16:25:20', 9),
(11, 'This first comment for heading 55555', 0, 0, 8, '2013-01-20 15:13:25', -1),
(12, 'This is second comment', 0, 0, 8, '2013-01-20 15:13:37', -1),
(13, 'This is subcomment for first comment', 0, 0, 8, '2013-01-20 15:13:56', -1),
(14, 'lllll', 0, 0, 8, '2013-01-20 15:21:03', 11),
(15, '', 0, 0, 11, '2013-01-20 17:52:46', 6),
(16, 'ad', 0, 0, 11, '2013-01-22 17:43:56', 10),
(17, '', -2, 0, 11, '2013-01-24 03:23:02', -1),
(18, 'my reply', 0, 0, 11, '2013-01-24 12:39:32', 7);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `msgid` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `text` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `readstatus` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `senduserid` int(11) NOT NULL,
  `getuserid` int(11) NOT NULL,
  `showstatus` int(11) NOT NULL,
  PRIMARY KEY (`msgid`),
  UNIQUE KEY `msgid` (`msgid`),
  UNIQUE KEY `msgid_2` (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msgid`, `subject`, `text`, `status`, `readstatus`, `date`, `senduserid`, `getuserid`, `showstatus`) VALUES
(1, 'sample sub', 'sample text 222222', 1, 0, '2012-12-28 18:30:00', 1, 2, -1),
(2, 'test message', 'testing', 1, 0, '2012-12-28 18:30:00', 2, 1, 1),
(3, 'message from ashiniit', 'text fromashiniit ,,,,,', 1, 0, '2012-12-28 18:30:00', 1, 2, -1),
(4, 'test message', 'testing 12', 1, 1, '2012-12-28 18:30:00', 1, 2, -1),
(5, 'test message', 'testing 12', 1, 0, '2013-01-01 18:14:25', 2, 1, 1),
(6, 'Re:test message', 'sent by ashiniit on 2012-12-29 00:00:00.0testing 12', 1, 0, '2013-01-01 18:14:36', 2, 1, 0),
(7, 'Re:test message', 'sent by ashiniit on 2012-12-29 00:00:00.0testing 12', 1, 0, '2013-01-01 18:16:10', 2, 1, 0),
(8, 'Re:test message', 'sent by ashiniit on 2012-12-29 00:00:00.0testing 12', 1, 0, '2013-01-02 02:38:30', 2, 1, 1),
(9, 'eeeeeee', 'rrrrrrrrrrr', 1, 0, '2013-01-17 18:03:50', 2, 1, 1),
(10, 'sssdsssdsss', '5555555', 1, 0, '2013-01-17 18:06:16', 2, 1, 1),
(11, '', '', 1, 0, '2013-01-17 18:08:54', 2, 1, 1),
(12, 'ppppppp', '000000000000000', 1, 0, '2013-01-17 18:10:13', 2, 1, 1),
(13, 'this is testing subject', 'this is testing text', 1, 1, '2013-01-18 19:20:26', 1, 2, 0),
(14, 'this is testing subject', 'this is testing text', 1, 1, '2013-01-18 19:20:26', 1, 2, 0),
(15, 'what is happening...............??', '111121333131313131adaadsadsadnnnnnnnnnnnnnnnnnnnnnnnmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 1, 1, '2013-01-18 19:41:18', 1, 2, -1),
(16, 'Re:what is happening...............??', 'sent by ashiniit on 2013-01-19 01:11:18.0111121333131313131adaadsadsadnnnnnnnnnnnnnnnnnnnnnnnmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 1, 0, '2013-01-19 16:10:58', 2, 1, 1),
(18, 'Re:what is happening...............??', 'this is samplesent by ashiniit on 2013-01-19 01:11:18.0111121333131313131adaadsadsadnnnnnnnnnnnnnnnnnnnnnnnmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 1, 1, '2013-01-19 16:13:28', 2, 1, 1),
(19, 'what is happening...............??', '111121333131313131adaadsadsadnnnnnnnnnnnnnnnnnnnnnnnmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 1, 0, '2013-01-19 18:36:55', 2, 1, 1),
(20, 'Re:what is happening...............??', '', 1, 0, '2013-01-19 18:41:49', 2, 1, 1),
(21, 'Re:what is happening...............??', 'vfrrrrrrfffffsent by ashiniit on 2013-01-20 00:06:55.0111121333131313131adaadsadsadnnnnnnnnnnnnnnnnnnnnnnnmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 1, 0, '2013-01-19 18:47:45', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `postid` int(11) NOT NULL,
  `link` longtext NOT NULL,
  `likes` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `thumblink` varchar(200) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`postid`),
  UNIQUE KEY `postid` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postid`, `link`, `likes`, `date`, `status`, `title`, `thumblink`, `categoryid`, `userid`) VALUES
(3, 'http://cricket.yahoo.com/news/england-in-trouble-on-a-dicey-pitch--100544352.html', 8, '2012-12-13 18:30:00', 1, 'this is heading 1', 'http://l.yimg.com/bt/api/res/1.2/DEHcVkKmE.rrzimK23al9w--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtweG9mZj01MDtweW9mZj0w/http%3A//l.yimg.com/os/153/2012/12/13/3-pietersen-jpg_065113.jpg.cf.png', 1, 1),
(4, 'http://cricket.yahoo.com/news/england-in-trouble-on-a-dicey-pitch--100544352.html', 9, '2012-12-13 18:30:00', 1, 'this is heading 2', 'http://l.yimg.com/bt/api/res/1.2/DEHcVkKmE.rrzimK23al9w--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtweG9mZj01MDtweW9mZj0w/http%3A//l.yimg.com/os/153/2012/12/13/3-pietersen-jpg_065113.jpg.cf.png', 2, 2),
(6, 'http://cricket.yahoo.com/news/england-in-trouble-on-a-dicey-pitch--100544352.html', 3, '2012-12-15 18:30:00', 1, 'hhww', 'http://l.yimg.com/bt/api/res/1.2/DEHcVkKmE.rrzimK23al9w--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtweG9mZj01MDtweW9mZj0w/http%3A//l.yimg.com/os/153/2012/12/13/3-pietersen-jpg_065113.jpg.cf.png', 1, 2),
(7, 'http://in.lifestyle.yahoo.com/where-december-093100306.html', 2, '2012-12-15 18:30:00', 1, 'this is heading 4', 'http://l.yimg.com/bt/api/res/1.2/_HPGSJBS7yrlClKBLbeaxg--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtweG9mZj01MDtweW9mZj0w/http%3A//media.zenfs.com/en_IN/News/CNTraveller/HBIMG_1651.jpg1351751167.cf.png', 2, 2),
(8, 'http://in.lifestyle.yahoo.com/where-december-093100306.html', 2, '2012-12-15 18:30:00', 1, 'this is heading 55555', 'http://l.yimg.com/bt/api/res/1.2/_HPGSJBS7yrlClKBLbeaxg--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtweG9mZj01MDtweW9mZj0w/http%3A//media.zenfs.com/en_IN/News/CNTraveller/HBIMG_1651.jpg1351751167.cf.png', 1, 2),
(9, 'http://in.lifestyle.yahoo.com/where-december-093100306.html', -3, '2012-12-15 19:13:35', 1, 'This is heading 6', 'http://l.yimg.com/bt/api/res/1.2/_HPGSJBS7yrlClKBLbeaxg--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtweG9mZj01MDtweW9mZj0w/http%3A//media.zenfs.com/en_IN/News/CNTraveller/HBIMG_1651.jpg1351751167.cf.png', 1, 2),
(10, 'http://google.com', 4, '2012-12-16 16:09:56', 1, 'heading 789', '', 1, 2),
(11, 'http://www.yahoo.com', 5, '2012-12-16 16:11:18', 1, 'asa', 'http://l.yimg.com/t/i/in/adv/housead/myhp/300x250_myhp_katrina_27jun11.jpg', 1, 2),
(12, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', -1, '2013-01-14 15:01:01', 1, 'assalkjlsak', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 1, 2),
(13, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', 1, '2013-01-14 15:01:18', 1, 'aaaa', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 2, 2),
(14, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', -1, '2013-01-14 15:01:31', 1, 'sas', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 1, 2),
(15, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', -6, '2013-01-14 15:01:44', 1, 'asassasaas', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 2, 2),
(16, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', 5, '2013-01-14 15:01:55', 1, 'assa', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 1, 2),
(17, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', 3, '2013-01-14 15:02:08', 1, 'sadads', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 1, 2),
(18, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', -1, '2013-01-14 15:02:17', 1, 'asasas', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 1, 2),
(19, 'http://cricket.yahoo.com/news/williams-provides-twist-to-cronje-scandal-151826786.html', 0, '2013-01-16 09:09:47', 1, 'bbbb', 'http://l2.yimg.com/bt/api/res/1.2/7DNpiH18yOh6JZd8zUoJbA--/YXBwaWQ9eW5ld3M7Zmk9ZmlsbDtoPTYwMDtweG9mZj01MDtweW9mZj0wO3c9NjAw/http%3A//l.yimg.com/t/cricket/410-henry-williams.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `upvote` longtext NOT NULL,
  `downvote` longtext NOT NULL,
  `upvotecomment` longtext NOT NULL,
  `downvotecomment` longtext NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `nickname`, `email`, `username`, `password`, `status`, `upvote`, `downvote`, `upvotecomment`, `downvotecomment`) VALUES
(1, 'testashish', 'ashiniit@gmail.com', 'ashiniit', 'ash', 1, '', '', '', ''),
(2, '', 'asajlkajslk', 'ashi', 'and', 1, ',8,3,10,4,7,11,13,9,18,16,17', ',6,12,14,15', ',5,4,8,9,1', ',10,17,17'),
(3, '', '', 'ashi1', 'andi', 1, '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
