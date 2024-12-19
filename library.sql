CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '1',
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Veaceslav Corotnean','202427015',0,1),(2,'Beatriz Cansado','202327095',0,1),(3,'Renato Almeida','202427065',0,1),(4,'Advanced Python','John Doe',1,1),(5,'Flask for Beginners','Jane Doe',0,1),(6,'Learning SQL','Alex Smith',1,1),(7,'O Senhor dos Anéis','J.R.R. Tolkien',1,1),(8,'Dom Casmurro','Machado de Assis',1,1),(9,'A Culpa é das Estrelas','John Green',1,1),(10,'1984','George Orwell',1,1),(11,'Harry Potter e a Pedra Filosofal','J.K. Rowling',0,1),(12,'1984','George Orwell',1,5),(13,'To Kill a Mockingbird','Harper Lee',1,8),(14,'The Great Gatsby','F. Scott Fitzgerald',1,10),(15,'The Catcher in the Rye','J.D. Salinger',1,7),(16,'Pride and Prejudice','Jane Austen',1,9),(17,'Animal Farm','George Orwell',1,4),(18,'Brave New World','Aldous Huxley',1,6),(19,'The Lord of the Rings','J.R.R. Tolkien',1,10),(20,'The Hobbit','J.R.R. Tolkien',1,8),(21,'Fahrenheit 451','Ray Bradbury',1,3),(22,'Jane Eyre','Charlotte Bronte',1,6),(23,'Wuthering Heights','Emily Bronte',1,7),(24,'The Alchemist','Paulo Coelho',1,5),(25,'Crime and Punishment','Fyodor Dostoevsky',1,4),(26,'War and Peace','Leo Tolstoy',1,3),(27,'Great Expectations','Charles Dickens',1,8),(28,'The Odyssey','Homer',1,6),(29,'Moby Dick','Herman Melville',1,4),(30,'The Iliad','Homer',1,5),(31,'Les Miserables','Victor Hugo',1,7),(32,'Dracula','Bram Stoker',1,3),(33,'Frankenstein','Mary Shelley',1,9),(34,'The Picture of Dorian Gray','Oscar Wilde',1,6),(35,'The Scarlet Letter','Nathaniel Hawthorne',1,8),(36,'The Grapes of Wrath','John Steinbeck',1,7),(37,'Catch-22','Joseph Heller',1,10),(38,'The Kite Runner','Khaled Hosseini',1,4),(39,'Life of Pi','Yann Martel',1,5),(40,'The Road','Cormac McCarthy',1,6),(41,'Slaughterhouse-Five','Kurt Vonnegut',1,7),(42,'A Tale of Two Cities','Charles Dickens',1,8),(43,'Little Women','Louisa May Alcott',1,9),(44,'The Book Thief','Markus Zusak',1,5),(45,'The Fault in Our Stars','John Green',1,4),(46,'Gone Girl','Gillian Flynn',1,6),(47,'The Hunger Games','Suzanne Collins',1,8),(48,'Divergent','Veronica Roth',1,10),(49,'The Maze Runner','James Dashner',1,3),(50,'The Chronicles of Narnia','C.S. Lewis',1,7),(51,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',1,6),(52,'Harry Potter and the Chamber of Secrets','J.K. Rowling',1,5),(53,'Harry Potter and the Prisoner of Azkaban','J.K. Rowling',1,9),(54,'Harry Potter and the Goblet of Fire','J.K. Rowling',1,10),(55,'Harry Potter and the Order of the Phoenix','J.K. Rowling',1,7),(56,'Harry Potter and the Half-Blood Prince','J.K. Rowling',1,8),(57,'Harry Potter and the Deathly Hallows','J.K. Rowling',1,6),(58,'The Shining','Stephen King',1,5),(59,'It','Stephen King',1,4),(60,'Misery','Stephen King',1,3),(61,'Carrie','Stephen King',1,7),(62,'The Stand','Stephen King',1,6),(63,'A Game of Thrones','George R.R. Martin',1,8),(64,'A Clash of Kings','George R.R. Martin',1,7),(65,'A Storm of Swords','George R.R. Martin',1,9),(66,'A Feast for Crows','George R.R. Martin',1,6),(67,'A Dance with Dragons','George R.R. Martin',1,5),(68,'Dune','Frank Herbert',1,8),(69,'Children of Dune','Frank Herbert',1,9),(70,'God Emperor of Dune','Frank Herbert',1,6),(71,'Heretics of Dune','Frank Herbert',1,5),(72,'Chapterhouse: Dune','Frank Herbert',1,7),(73,'Ender\'s Game','Orson Scott Card',1,10),(74,'Speaker for the Dead','Orson Scott Card',1,8),(75,'Xenocide','Orson Scott Card',1,6),(76,'Children of the Mind','Orson Scott Card',1,7),(77,'Shadow of the Hegemon','Orson Scott Card',1,9),(78,'Ready Player One','Ernest Cline',1,10),(79,'Armada','Ernest Cline',1,6),(80,'The Martian','Andy Weir',1,8),(81,'Project Hail Mary','Andy Weir',1,7),(82,'Artemis','Andy Weir',1,5),(83,'The Expanse: Leviathan Wakes','James S.A. Corey',1,8),(84,'The Expanse: Caliban\'s War','James S.A. Corey',1,7),(85,'The Expanse: Abaddon\'s Gate','James S.A. Corey',1,6),(86,'The Expanse: Cibola Burn','James S.A. Corey',1,5),(87,'The Expanse: Nemesis Games','James S.A. Corey',1,9),(88,'The Expanse: Babylon\'s Ashes','James S.A. Corey',1,10),(89,'The Expanse: Persepolis Rising','James S.A. Corey',1,8),(90,'The Expanse: Tiamat\'s Wrath','James S.A. Corey',1,7),(91,'The Expanse: Leviathan Falls','James S.A. Corey',1,6),(92,'The Hitchhiker\'s Guide to the Galaxy','Douglas Adams',1,10),(93,'The Restaurant at the End of the Universe','Douglas Adams',1,8),(94,'Life, the Universe and Everything','Douglas Adams',1,6),(95,'So Long, and Thanks for All the Fish','Douglas Adams',1,7),(96,'Mostly Harmless','Douglas Adams',1,9),(97,'Foundation','Isaac Asimov',1,10),(98,'Foundation and Empire','Isaac Asimov',1,8),(99,'Second Foundation','Isaac Asimov',1,6),(100,'Prelude to Foundation','Isaac Asimov',1,7),(101,'Forward the Foundation','Isaac Asimov',1,9),(102,'I, Robot','Isaac Asimov',1,8),(103,'The Caves of Steel','Isaac Asimov',1,6),(104,'The Naked Sun','Isaac Asimov',1,5),(105,'The Robots of Dawn','Isaac Asimov',1,7),(106,'Robots and Empire','Isaac Asimov',1,9),(107,'Neuromancer','William Gibson',1,10),(108,'Count Zero','William Gibson',1,6),(109,'Mona Lisa Overdrive','William Gibson',1,7),(110,'Pattern Recognition','William Gibson',1,8),(111,'Zero History','William Gibson',1,9);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `loan_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_date` date DEFAULT NULL,
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,3,'2024-12-14 00:00:00',NULL,1),(2,1,3,'2024-12-14 00:00:00',NULL,1),(3,1,1,'2024-12-14 00:00:00',NULL,1),(4,1,1,'2024-12-14 00:00:00',NULL,1),(5,1,1,'2024-12-14 00:00:00',NULL,1),(6,2,2,'2024-12-14 00:00:00',NULL,1),(7,1,1,'2024-12-14 00:00:00',NULL,1),(8,3,7,'2024-12-14 00:00:00',NULL,1),(10,3,3,'2024-12-14 00:00:00',NULL,1),(11,1,4,'2024-12-14 00:00:00',NULL,1),(12,31,1,'2024-12-14 00:00:00',NULL,0),(13,32,2,'2024-12-14 00:00:00',NULL,0),(14,33,3,'2024-12-14 00:00:00',NULL,0),(18,1,53,'2024-12-15 00:00:00',NULL,1),(20,36,14,'2024-12-16 00:00:00',NULL,1),(21,1,11,'2024-12-19 00:00:00',NULL,0);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','john.doe@example.com'),(2,'Alice','alice@example.com'),(3,'Bob','bob@example.com'),(4,'Charlie','charlie@example.com'),(6,'Alice Johnson','alice.johnson@example.com'),(7,'Bob Smith','bob.smith@example.com'),(8,'Charlie Brown','charlie.brown@example.com'),(9,'David Wilson','david.wilson@example.com'),(10,'Emma Davis','emma.davis@example.com'),(11,'Fiona Clark','fiona.clark@example.com'),(12,'George Hall','george.hall@example.com'),(13,'Hannah Lewis','hannah.lewis@example.com'),(14,'Isabella Moore','isabella.moore@example.com'),(15,'Jack Harris','jack.harris@example.com'),(16,'Katherine King','katherine.king@example.com'),(17,'Liam Wright','liam.wright@example.com'),(18,'Mia Lopez','mia.lopez@example.com'),(19,'Noah Hill','noah.hill@example.com'),(20,'Olivia Scott','olivia.scott@example.com'),(21,'Paul Adams','paul.adams@example.com'),(22,'Quinn Mitchell','quinn.mitchell@example.com'),(23,'Rachel Perez','rachel.perez@example.com'),(24,'Samuel Roberts','samuel.roberts@example.com'),(25,'Thomas Young','thomas.young@example.com'),(26,'Uma Clark','uma.clark@example.com'),(27,'Victor Lee','victor.lee@example.com'),(28,'William Turner','william.turner@example.com'),(29,'Xavier Walker','xavier.walker@example.com'),(30,'Yasmine Carter','yasmine.carter@example.com'),(31,'Veaceslav Corotnean','202427015@uatla.pt'),(32,'Beatriz Cansado','202327095@uatla.pt'),(33,'Renato Almeida','202427065@uatla.pt'),(36,'Margarida Corotnean','margarida@teste.pt');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 20:06:26
