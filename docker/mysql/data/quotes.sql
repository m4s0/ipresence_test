-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ipresence
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx` (`name`,`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (39,' Ancient Indian Proverb','ancient-indian-proverb'),(84,'–Audrey Hepburn','audrey-hepburn'),(67,'Abigail Van Buren','abigail-van-buren'),(82,'Abraham Lincoln','abraham-lincoln'),(3,'Albert Einstein','albert-einstein'),(15,'Alice Walker','alice-walker'),(8,'Amelia Earhart','amelia-earhart'),(31,'Anais Nin','anais-nin'),(66,'Ann Landers','ann-landers'),(48,'Anne Frank','anne-frank'),(33,'Aristotle','aristotle'),(44,'Arthur Ashe','arthur-ashe'),(81,'Ayn Rand','ayn-rand'),(9,'Babe Ruth','babe-ruth'),(61,'Benjamin Franklin','benjamin-franklin'),(78,'Beverly Sills','beverly-sills'),(62,'Bill Cosby','bill-cosby'),(60,'Bob Dylan','bob-dylan'),(38,'Booker T. Washington','booker-t-washington'),(16,'Buddha','buddha'),(14,'Charles Swindoll','charles-swindoll'),(17,'Chinese Proverb','chinese-proverb'),(24,'Christopher Columbus','christopher-columbus'),(47,'Confucius','confucius'),(50,'Dalai Lama','dalai-lama'),(12,'Earl Nightingale','earl-nightingale'),(79,'Eleanor Roosevelt','eleanor-roosevelt'),(59,'Erica Jong','erica-jong'),(37,'Erma Bombeck','erma-bombeck'),(68,'Farrah Gray','farrah-gray'),(5,'Florence Nightingale','florence-nightingale'),(29,'Frank Sinatra','frank-sinatra'),(41,'George Addair','george-addair'),(64,'George Eliot','george-eliot'),(76,'Gloria Steinem','gloria-steinem'),(80,'Grandma Moses','grandma-moses'),(46,'Helen Keller','helen-keller'),(36,'Henry David Thoreau','henry-david-thoreau'),(27,'Henry Ford','henry-ford'),(58,'Jamie Paolinetti','jamie-paolinetti'),(45,'Japanese Proverb','japanese-proverb'),(69,'Jesse Owens','jesse-owens'),(34,'Jesus','jesus'),(26,'Jim Rohn','jim-rohn'),(28,'Johann Wolfgang von Goethe','johann-wolfgang-von-goethe'),(11,'John Lennon','john-lennon'),(56,'Joshua J. Marine','joshua-j-marine'),(1,'Kevin Kruse','kevin-kruse'),(49,'Lao Tzu','lao-tzu'),(52,'Latin Proverb','latin-proverb'),(57,'Leonardo da Vinci','leonardo-da-vinci'),(55,'Les Brown','les-brown'),(77,'Mae Jemison','mae-jemison'),(43,'Maimonides','maimonides'),(54,'Marie Curie','marie-curie'),(13,'Mark Twain','mark-twain'),(73,'Martin Luther King Jr.','martin-luther-king-jr'),(25,'Maya Angelou','maya-angelou'),(7,'Michael Jordan','michael-jordan'),(2,'Napoleon Hill','napoleon-hill'),(72,'Norman Vaughan','norman-vaughan'),(83,'Norman Vincent Peale','norman-vincent-peale'),(65,'Oprah Winfrey','oprah-winfrey'),(23,'Pablo Picasso','pablo-picasso'),(42,'Plato','plato'),(35,'Ralph Waldo Emerson','ralph-waldo-emerson'),(4,'Robert Frost','robert-frost'),(63,'Roger Staubach','roger-staubach'),(71,'Rosa Parks','rosa-parks'),(51,'Sheryl Sandberg','sheryl-sandberg'),(70,'Sir Claus Moser','sir-claus-moser'),(18,'Socrates','socrates'),(22,'Stephen Covey','stephen-covey'),(20,'Steve Jobs','steve-jobs'),(74,'Teddy Roosevelt','teddy-roosevelt'),(40,'Theodore Roosevelt','theodore-roosevelt'),(75,'Tony Robbins','tony-robbins'),(53,'Unknown','unknown'),(21,'Vince Lombardi','vince-lombardi'),(32,'Vincent Van Gogh','vincent-van-gogh'),(10,'W. Clement Stone','w-clement-stone'),(6,'Wayne Gretzky','wayne-gretzky'),(19,'Woody Allen','woody-allen'),(30,'Zig Ziglar','zig-ziglar');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `text` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6B71CBF4F675F31B` (`author_id`),
  CONSTRAINT `FK_6B71CBF4F675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
INSERT INTO `quote` VALUES (1,1,'Life isn’t about getting and having, it’s about giving and being.'),(2,2,'Whatever the mind of man can conceive and believe, it can achieve.'),(3,3,'Strive not to be a success, but rather to be of value.'),(4,4,'Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.'),(5,5,'I attribute my success to this: I never gave or took any excuse.'),(6,6,'You miss 100% of the shots you don’t take.'),(7,7,'I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.'),(8,8,'The most difficult thing is the decision to act, the rest is merely tenacity.'),(9,9,'Every strike brings me closer to the next home run.'),(10,10,'Definiteness of purpose is the starting point of all achievement.'),(11,1,'We must balance conspicuous consumption with conscious capitalism.'),(12,11,'Life is what happens to you while you’re busy making other plans.'),(13,12,'We become what we think about.'),(14,13,'Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails.  Explore, Dream, Discover.'),(15,14,'Life is 10% what happens to me and 90% of how I react to it.'),(16,15,'The most common way people give up their power is by thinking they don’t have any.'),(17,16,'The mind is everything. What you think you become.'),(18,17,'The best time to plant a tree was 20 years ago. The second best time is now.'),(19,18,'An unexamined life is not worth living.'),(20,19,'Eighty percent of success is showing up.'),(21,20,'Your time is limited, so don’t waste it living someone else’s life!'),(22,21,'Winning isn’t everything, but wanting to win is.'),(23,22,'I am not a product of my circumstances. I am a product of my decisions.'),(24,23,'Every child is an artist.  The problem is how to remain an artist once he grows up.'),(25,24,'You can never cross the ocean until you have the courage to lose sight of the shore.'),(26,25,'I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.'),(27,26,'Either you run the day, or the day runs you.'),(28,27,'Whether you think you can or you think you can’t, you’re right.'),(29,13,'The two most important days in your life are the day you are born and the day you find out why.'),(30,28,'Whatever you can do, or dream you can, begin it.  Boldness has genius, power and magic in it.'),(31,29,'The best revenge is massive success.'),(32,30,'People often say that motivation doesn’t last. Well, neither does bathing.  That’s why we recommend it daily.'),(33,31,'Life shrinks or expands in proportion to one’s courage.'),(34,32,'If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced.'),(35,33,'There is only one way to avoid criticism: do nothing, say nothing, and be nothing.'),(36,34,'Ask and it will be given to you; search, and you will find; knock and the door will be opened for you.'),(37,35,'The only person you are destined to become is the person you decide to be.'),(38,36,'Go confidently in the direction of your dreams.  Live the life you have imagined.'),(39,37,'When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me.'),(40,38,'Few things can help an individual more than to place responsibility on him, and to let him know that you trust him.'),(41,39,'Certain things catch your eye, but pursue only those that capture the heart.'),(42,40,'Believe you can and you’re halfway there.'),(43,41,'Everything you’ve ever wanted is on the other side of fear.'),(44,42,'We can easily forgive a child who is afraid of the dark; the real tragedy of life is when men are afraid of the light.'),(45,43,'Teach thy tongue to say, “I do not know,” and thous shalt progress.'),(46,44,'Start where you are. Use what you have.  Do what you can.'),(47,11,'When I was 5 years old, my mother always told me that happiness was the key to life.  When I went to school, they asked me what I wanted to be when I grew up.  I wrote down ‘happy’.  They told me I didn’t understand the assignment, and I told them they didn’t understand life.'),(48,45,'Fall seven times and stand up eight.'),(49,46,'When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.'),(50,47,'Everything has beauty, but not everyone can see.'),(51,48,'How wonderful it is that nobody need wait a single moment before starting to improve the world.'),(52,49,'When I let go of what I am, I become what I might be.'),(53,25,'Life is not measured by the number of breaths we take, but by the moments that take our breath away.'),(54,50,'Happiness is not something readymade.  It comes from your own actions.'),(55,51,'If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on.'),(56,33,'First, have a definite, clear practical ideal; a goal, an objective. Second, have the necessary means to achieve your ends; wisdom, money, materials, and methods. Third, adjust all your means to that end.'),(57,52,'If the wind will not serve, take to the oars.'),(58,53,'You can’t fall if you don’t climb.  But there’s no joy in living your whole life on the ground.'),(59,54,'We must believe that we are gifted for something, and that this thing, at whatever cost, must be attained.'),(60,55,'Too many of us are not living our dreams because we are living our fears.'),(61,56,'Challenges are what make life interesting and overcoming them is what makes life meaningful.'),(62,38,'If you want to lift yourself up, lift up someone else.'),(63,57,'I have been impressed with the urgency of doing. Knowing is not enough; we must apply. Being willing is not enough; we must do.'),(64,58,'Limitations live only in our minds.  But if we use our imaginations, our possibilities become limitless.'),(65,59,'You take your life in your own hands, and what happens? A terrible thing, no one to blame.'),(66,60,'What’s money? A man is a success if he gets up in the morning and goes to bed at night and in between does what he wants to do.'),(67,61,'I didn’t fail the test. I just found 100 ways to do it wrong.'),(68,62,'In order to succeed, your desire for success should be greater than your fear of failure.'),(69,3,'A person who never made a mistake never tried anything new.'),(70,17,'The person who says it cannot be done should not interrupt the person who is doing it.'),(71,63,'There are no traffic jams along the extra mile.'),(72,64,'It is never too late to be what you might have been.'),(73,65,'You become what you believe.'),(74,32,'I would rather die of passion than of boredom.'),(75,53,'A truly rich man is one whose children run into his arms when his hands are empty.'),(76,66,'It is not what you do for your children, but what you have taught them to do for themselves, that will make them successful human beings.'),(77,67,'If you want your children to turn out well, spend twice as much time with them, and half as much money.'),(78,68,'Build your own dreams, or someone else will hire you to build theirs.'),(79,69,'The battles that count aren’t the ones for gold medals. The struggles within yourself–the invisible battles inside all of us–that’s where it’s at.'),(80,70,'Education costs money.  But then so does ignorance.'),(81,71,'I have learned over the years that when one’s mind is made up, this diminishes fear.'),(82,47,'It does not matter how slowly you go as long as you do not stop.'),(83,65,'If you look at what you have in life, you’ll always have more. If you look at what you don’t have in life, you’ll never have enough.'),(84,50,'Remember that not getting what you want is sometimes a wonderful stroke of luck.'),(85,25,'You can’t use up creativity.  The more you use, the more you have.'),(86,72,'Dream big and dare to fail.'),(87,73,'Our lives begin to end the day we become silent about things that matter.'),(88,74,'Do what you can, where you are, with what you have.'),(89,75,'If you do what you’ve always done, you’ll get what you’ve always gotten.'),(90,76,'Dreaming, after all, is a form of planning.'),(91,77,'It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live.'),(92,78,'You may be disappointed if you fail, but you are doomed if you don’t try.'),(93,79,'Remember no one can make you feel inferior without your consent.'),(94,80,'Life is what we make it, always has been, always will be.'),(95,81,'The question isn’t who is going to let me; it’s who is going to stop me.'),(96,27,'When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.'),(97,82,'It’s not the years in your life that count. It’s the life in your years.'),(98,83,'Change your thoughts and you change your world.'),(99,61,'Either write something worth reading or do something worth writing.'),(100,84,'Nothing is impossible, the word itself says, “I’m possible!”'),(101,20,'The only way to do great work is to love what you do.'),(102,30,'If you can dream it, you can achieve it.');
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-18  1:09:05
