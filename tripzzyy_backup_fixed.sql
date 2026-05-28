-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: tripzy_db
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accomodation` varchar(255) DEFAULT NULL,
  `budget` double NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `days` int NOT NULL,
  `destination` varchar(255) NOT NULL,
  `end_date` date DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `itinerary` varchar(10000) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transportation` varchar(255) DEFAULT NULL,
  `travelers` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `accommodation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8wb14dx6ed0bpp3planbay88u` (`user_id`),
  CONSTRAINT `FK8wb14dx6ed0bpp3planbay88u` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (8,NULL,50000,'2026-05-28 08:03:16.947883',6,'Manali, Himachal Pradesh','2026-06-03','','{\n  \"tripDetails\": {\n    \"from\": \"Jalgaon\",\n    \"to\": \"Manali, Himachal Pradesh\",\n    \"startDate\": \"2026-05-29\",\n    \"endDate\": \"2026-06-03\",\n    \"budget\": 50000,\n    \"interests\": [],\n    \"transportation\": \"Mixed\",\n    \"accommodation\": \"Resort\"\n  },\n  \"itinerary\": [\n    {\n      \"day\": 1,\n      \"date\": \"2026-05-29\",\n      \"morning\": \"Travel from Jalgaon to Delhi by flight, then take a bus or taxi to Manali\",\n      \"afternoon\": \"Check-in at the resort and freshen up\",\n      \"evening\": \"Explore the nearby Hadimba Devi Temple and Mall Road\",\n      \"restaurant\": \"Mayur Restaurant, estimated cost: Ôé╣800 per person\",\n      \"travelTips\": \"Be prepared for a long journey, carry necessary documents and medication\",\n      \"importantNotes\": \"Check the weather forecast before traveling\"\n    },\n    {\n      \"day\": 2,\n      \"date\": \"2026-05-30\",\n      \"morning\": \"Visit the Solang Valley for adventure activities like paragliding and skiing\",\n      \"afternoon\": \"Try river rafting in the Beas River\",\n      \"evening\": \"Enjoy a bonfire and stargazing at the resort\",\n      \"restaurant\": \"The Orchard Restaurant, estimated cost: Ôé╣1000 per person\",\n      \"travelTips\": \"Wear comfortable shoes and carry a change of clothes\",\n      \"importantNotes\": \"Check the safety guidelines before participating in adventure activities\"\n    },\n    {\n      \"day\": 3,\n      \"date\": \"2026-05-31\",\n      \"morning\": \"Take a day trip to the Rohtang Pass\",\n      \"afternoon\": \"Visit the Rahala Falls and enjoy the scenic views\",\n      \"evening\": \"Explore the Old Manali market and try local cuisine\",\n      \"restaurant\": \"Dylan\'s Toasted and Roasted Coffee House, estimated cost: Ôé╣600 per person\",\n      \"travelTips\": \"Carry a valid ID proof and be prepared for a long drive\",\n      \"importantNotes\": \"Check the road conditions before traveling to Rohtang Pass\"\n    },\n    {\n      \"day\": 4,\n      \"date\": \"2026-06-01\",\n      \"morning\": \"Visit the Vashisht Hot Water Springs and Temple\",\n      \"afternoon\": \"Take a walk in the beautiful village of Vashisht\",\n      \"evening\": \"Enjoy a relaxing spa treatment at the resort\",\n      \"restaurant\": \"Everest Restaurant, estimated cost: Ôé╣900 per person\",\n      \"travelTips\": \"Carry a towel and change of clothes\",\n      \"importantNotes\": \"Respect the local culture and traditions\"\n    },\n    {\n      \"day\": 5,\n      \"date\": \"2026-06-02\",\n      \"morning\": \"Go trekking to the Jogini Waterfall\",\n      \"afternoon\": \"Visit the Manu Temple and explore the nearby village\",\n      \"evening\": \"Enjoy a cultural show at the resort\",\n      \"restaurant\": \"Green Forest Cafe, estimated cost: Ôé╣700 per person\",\n      \"travelTips\": \"Wear comfortable shoes and carry a water bottle\",\n      \"importantNotes\": \"Check the trekking route and difficulty level before embarking\"\n    },\n    {\n      \"day\": 6,\n      \"date\": \"2026-06-03\",\n      \"morning\": \"Check-out of the resort and travel back to Delhi\",\n      \"afternoon\": \"Take a flight from Delhi back to Jalgaon\",\n      \"evening\": \"Reach Jalgaon, end of the trip\",\n      \"restaurant\": \"None\",\n      \"travelTips\": \"Be prepared for a long journey, carry necessary documents and medication\",\n      \"importantNotes\": \"Check the flight schedule and plan accordingly\"\n    }\n  ],\n  \"estimatedCostBreakdown\": {\n    \"transportation\": 15000,\n    \"accommodation\": 18000,\n    \"food\": 8000,\n    \"activities\": 4000,\n    \"miscellaneous\": 3000,\n    \"total\": 50000\n  }\n}','Jalgaon','2026-05-29','PLANNED','Mixed',8,7,'Resort'),(11,NULL,50000,'2026-05-28 17:06:26.970811',4,'Wayanad, Kerala','2026-06-04','Couple Special','{\n  \"tripDetails\": {\n    \"from\": \"Mumbai\",\n    \"to\": \"Wayanad, Kerala\",\n    \"startDate\": \"2026-06-01\",\n    \"endDate\": \"2026-06-04\",\n    \"budget\": 50000\n  },\n\n  \"itinerary\": [\n    {\n      \"day\": 1,\n      \"title\": \"Arrival in Wayanad\",\n      \"mood\": \"Romantic\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Check-in at the resort\",\n          \"description\": \"Relax and unwind at the luxurious resort\",\n          \"location\": \"Wayanad\",\n          \"estimatedCost\": 10000\n        },\n        {\n          \"time\": \"Afternoon\",\n          \"title\": \"Couples Spa\",\n          \"description\": \"Rejuvenate with a relaxing spa session\",\n          \"location\": \"Resort\",\n          \"estimatedCost\": 5000\n        }\n      ],\n\n      \"foodRecommendation\": \"Traditional Kerala cuisine\",\n      \"hotelSuggestion\": \"Luxury resort with private pool\",\n\n      \"travelTips\": [\n        \"Book the resort in advance to avoid peak season rush\",\n        \"Carry sunscreen and sunglasses for outdoor activities\"\n      ]\n    },\n    {\n      \"day\": 2,\n      \"title\": \"Explore Wayanad\",\n      \"mood\": \"Adventure\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Wayanad Wildlife Sanctuary\",\n          \"description\": \"Take a guided tour of the sanctuary\",\n          \"location\": \"Wayanad\",\n          \"estimatedCost\": 2000\n        },\n        {\n          \"time\": \"Afternoon\",\n          \"title\": \"Edakkal Caves\",\n          \"description\": \"Explore the ancient caves\",\n          \"location\": \"Wayanad\",\n          \"estimatedCost\": 1000\n        }\n      ],\n\n      \"foodRecommendation\": \"Try local street food\",\n      \"hotelSuggestion\": \"Same resort as previous day\",\n\n      \"travelTips\": [\n        \"Wear comfortable shoes for the sanctuary tour\",\n        \"Respect wildlife and follow guide instructions\"\n      ]\n    },\n    {\n      \"day\": 3,\n      \"title\": \"Romantic Getaway\",\n      \"mood\": \"Intimate\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Sunrise View\",\n          \"description\": \"Watch the sunrise together\",\n          \"location\": \"Resort\",\n          \"estimatedCost\": 0\n        },\n        {\n          \"time\": \"Afternoon\",\n          \"title\": \"Private Dinner\",\n          \"description\": \"Enjoy a romantic dinner\",\n          \"location\": \"Resort\",\n          \"estimatedCost\": 8000\n        }\n      ],\n\n      \"foodRecommendation\": \"Candlelight dinner\",\n      \"hotelSuggestion\": \"Same resort as previous day\",\n\n      \"travelTips\": [\n        \"Book the private dinner in advance\",\n        \"Carry a camera to capture the moment\"\n      ]\n    },\n    {\n      \"day\": 4,\n      \"title\": \"Departure\",\n      \"mood\": \"Relaxed\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Check-out from the resort\",\n          \"description\": \"Depart for Mumbai\",\n          \"location\": \"Wayanad\",\n          \"estimatedCost\": 0\n        }\n      ],\n\n      \"foodRecommendation\": \"Breakfast at the resort\",\n      \"hotelSuggestion\": \"None\",\n\n      \"travelTips\": [\n        \"Check-out from the resort on time\",\n        \"Carry all belongings and documents\"\n      ]\n    }\n  ]\n}','Mumbai','2026-06-01','PLANNED','Car',2,1,'Resort'),(12,NULL,50000,'2026-05-28 17:22:51.223730',7,'Kerala','2026-06-04','','{\n  \"tripDetails\": {\n    \"from\": \"Mumbai\",\n    \"to\": \"Kerala\",\n    \"startDate\": \"2026-05-29\",\n    \"endDate\": \"2026-06-04\",\n    \"budget\": 50000\n  },\n\n  \"itinerary\": [\n    {\n      \"day\": 1,\n      \"title\": \"Arrival in Kerala\",\n      \"mood\": \"Relaxing\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Check-in to Hotel\",\n          \"description\": \"Arrive at Cochin International Airport and check-in to a luxurious hotel in the city\",\n          \"location\": \"Cochin\",\n          \"estimatedCost\": 8000\n        }\n      ],\n\n      \"foodRecommendation\": \"Try traditional Kerala cuisine like Appam and Stew\",\n      \"hotelSuggestion\": \"Taj Malabar Resort & Spa\",\n\n      \"travelTips\": [\n        \"Book a taxi or cab from the airport to the hotel\",\n        \"Exchange currency at the airport for local expenses\"\n      ]\n    },\n    {\n      \"day\": 2,\n      \"title\": \"Exploring Cochin\",\n      \"mood\": \"Cultural\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Visit Fort Kochi\",\n          \"description\": \"Explore the historic Fort Kochi area, including the Dutch Palace and St. Francis Church\",\n          \"location\": \"Fort Kochi\",\n          \"estimatedCost\": 500\n        }\n      ],\n\n      \"foodRecommendation\": \"Try seafood at a local restaurant\",\n      \"hotelSuggestion\": \"Taj Malabar Resort & Spa\",\n\n      \"travelTips\": [\n        \"Wear comfortable shoes for walking\",\n        \"Respect local customs and traditions when visiting historical sites\"\n      ]\n    },\n    {\n      \"day\": 3,\n      \"title\": \"Backwaters of Alleppey\",\n      \"mood\": \"Serene\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Houseboat Cruise\",\n          \"description\": \"Take a luxurious houseboat cruise through the backwaters of Alleppey\",\n          \"location\": \"Alleppey\",\n          \"estimatedCost\": 12000\n        }\n      ],\n\n      \"foodRecommendation\": \"Try traditional Kerala snacks like Banana Fritters\",\n      \"hotelSuggestion\": \"Lake Palace Resort\",\n\n      \"travelTips\": [\n        \"Book a houseboat with a reputable operator\",\n        \"Bring sunscreen and a hat for outdoor protection\"\n      ]\n    },\n    {\n      \"day\": 4,\n      \"title\": \"Hill Station of Munnar\",\n      \"mood\": \"Adventurous\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Tea Plantation Visit\",\n          \"description\": \"Visit a tea plantation and learn about the production process\",\n          \"location\": \"Munnar\",\n          \"estimatedCost\": 1000\n        }\n      ],\n\n      \"foodRecommendation\": \"Try local tea and snacks\",\n      \"hotelSuggestion\": \"Tea Valley Resort & Spa\",\n\n      \"travelTips\": [\n        \"Wear layers for changing weather conditions\",\n        \"Bring a camera to capture scenic views\"\n      ]\n    },\n    {\n      \"day\": 5,\n      \"title\": \"Wildlife of Thekkady\",\n      \"mood\": \"Exhilarating\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Periyar Wildlife Sanctuary Visit\",\n          \"description\": \"Take a guided tour of the Periyar Wildlife Sanctuary\",\n          \"location\": \"Thekkady\",\n          \"estimatedCost\": 2000\n        }\n      ],\n\n      \"foodRecommendation\": \"Try local spices and herbs\",\n      \"hotelSuggestion\": \"Spice Village Resort\",\n\n      \"travelTips\": [\n        \"Book a guided tour with a reputable operator\",\n        \"Bring binoculars for wildlife spotting\"\n      ]\n    },\n    {\n      \"day\": 6,\n      \"title\": \"Beach Relaxation\",\n      \"mood\": \"Relaxing\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Beach Visit\",\n          \"description\": \"Spend the day relaxing at a beautiful beach\",\n          \"location\": \"Kovalam\",\n          \"estimatedCost\": 1500\n        }\n      ],\n\n      \"foodRecommendation\": \"Try seafood at a beachside restaurant\",\n      \"hotelSuggestion\": \"Taj Green Cove Resort & Spa\",\n\n      \"travelTips\": [\n        \"Bring sunscreen and a hat for outdoor protection\",\n        \"Respect local customs and traditions when visiting the beach\"\n      ]\n    },\n    {\n      \"day\": 7,\n      \"title\": \"Departure\",\n      \"mood\": \"Reflective\",\n\n      \"activities\": [\n        {\n          \"time\": \"Morning\",\n          \"title\": \"Check-out and Departure\",\n          \"description\": \"Check-out of the hotel and depart from Cochin International Airport\",\n          \"location\": \"Cochin\",\n          \"estimatedCost\": 8000\n        }\n      ],\n\n      \"foodRecommendation\": \"Try a traditional Kerala breakfast\",\n      \"hotelSuggestion\": \"\",\n\n      \"travelTips\": [\n        \"Book a taxi or cab from the hotel to the airport\",\n        \"Exchange currency at the airport for international expenses\"\n      ]\n    }\n  ]\n}','Mumbai','2026-05-29','PLANNED','Flight',2,1,'Hotel');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mumbai','India','2026-05-24 10:03:54.019454','poorva@gmail.com','Poorva Chandrakant Mahajan','$2a$10$NAxpdrydAnfyX0BzZ/8mxOZjvq8l76kA44SdsSQy15M7GjrT0m5US','9876543210',NULL,'USER'),(2,'jalgaon','India','2026-05-26 22:01:06.809128','lokeshsurve@gmail.com','Lokesh Pradip Surve','$2a$10$d0NGSXbJ9/EzqheRmMvql.o0Dv0SSDtZ7dpdOAICoz4ik2mW6/kJW','+917841985831',NULL,'USER'),(3,'jalgaon','India','2026-05-26 22:04:37.704795','lokesh@gmail.com','Lokesh Pradip Surve','$2a$10$V7yBKPtqS/f6zqv3woDejuqFvgMC4cGSmSFcroAUKBWWqgxRAKR3i','+917841985831',NULL,'USER'),(4,'jalgaon','India','2026-05-26 22:07:05.247151','lokesh1@gmail.com','Lokesh Pradip Surve','$2a$10$k7HPcCO13E8ifmrLNlEqx.bPJvSpdAP3upQ6wQCMwNLcCTHSFBXEa','+917841985831',NULL,'USER'),(5,'Mumbai','India','2026-05-26 22:43:58.216737','jetha@gmail.com','Jethalal Champaklal Gada','$2a$10$nfAhtmeXENAtp1nhsbYwMuOQKSsazNQngZ3gr7.ydATbLPEhlkjJ.','9876543210',NULL,'USER'),(6,'jalgaon','India','2026-05-26 22:49:23.339043','jetha1@gmail.com','Jethalal Champaklal Gada','$2a$10$vuOW0p.kNCbyk1h5Rd2gIOSJzhCXviR7u3PmjkZtCQAin8TgVo/Yu','+917841985831',NULL,'USER'),(7,'Pune','India','2026-05-28 07:39:49.152459','mohini@gmail.com','Mohini Chandrakant Pawar','$2a$10$wlCg64X2VNSxz5K97BSNkupx7KcyBo32908F3q8/Jblgcvid/trlC','9403831829',NULL,'USER');
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

-- Dump completed on 2026-05-28 21:59:29
