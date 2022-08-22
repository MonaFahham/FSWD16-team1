-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Aug 2022 um 22:24
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mtm`
--
CREATE DATABASE IF NOT EXISTS `mtm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mtm`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Book'),
(2, 'Phone'),
(3, 'Clothes'),
(4, 'Electronics'),
(5, 'Baby'),
(6, 'Kitchen'),
(7, 'Decoration');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment` enum('paypal','cash') DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `weight` decimal(7,2) NOT NULL DEFAULT 0.00,
  `url_slug` varchar(255) NOT NULL DEFAULT '',
  `status` enum('Available','Not Available') NOT NULL DEFAULT 'Available',
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `rrp`, `quantity`, `date_added`, `weight`, `url_slug`, `status`, `picture`) VALUES
(2, 'Moby Dick', 'Moby-Dick (1851) is the sixth book by American writer Herman Melville. The work is an epic sea story of Captain Ahab\'s voyage in pursuit of Moby Dick, a great white whale. It initially received mixed reviews and at Melville\'s death in 1891 was remembered, if at all, as a children\'s sea adventure, but now is considered one of the Great American Novels and a leading work of American Romanticism. The opening line, \"Call me Ishmael,\" is one of the most recognizable opening lines in Western literature. Ishmael then narrates the voyage of the whaleship Pequod, commanded by Captain Ahab. Ahab has one purpose: revenge on Moby Dick, a ferocious, enigmatic white whale that on a previous voyage destroyed Ahab\'s ship and severed his leg at the knee. The detailed and realistic descriptions of whale hunting and the process of extracting whale oil, as well as life aboard a ship among a culturally diverse crew, are mixed with exploration of class and social status, good and evil, and the existence of God.', '6.55', '0.13', 100, '2014-01-23 10:00:00', '590.00', 'https://en.wikipedia.org/wiki/Moby-Dick', 'Available', 'moby-dick.jpg'),
(3, 'The Da Vinci Code (Robert Langdon)', 'While in Paris, Harvard symbologist Robert Langdon is awakened by a phone call in the dead of the night. The elderly curator of the Louvre has been murdered inside the museum, his body covered in baffling symbols. As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinci—clues visible for all to see and yet ingeniously disguised by the painter. Even more startling, the late curator was involved in the Priory of Sion—a secret society whose members included Sir Isaac Newton, Victor Hugo, and Da Vinci—and he guarded a breathtaking historical secret. Unless Langdon and Neveu can decipher the labyrinthine puzzle—while avoiding the faceless adversary who shadows their every move—the explosive, ancient truth will be lost forever.', '7.49', '0.11', 59, '2009-03-31 10:00:00', '500.00', 'https://en.wikipedia.org/wiki/The_Da_Vinci_Code', 'Not Available', 'The-Da-Vinci-Code.jpg'),
(4, 'The Lost Symbol', 'In this stunning follow-up to the global phenomenon The Da Vinci Code, Dan Brown demonstrates once again why he is the world’s most popular thriller writer. The Lost Symbol is a masterstroke of storytelling--a deadly race through a real-world labyrinth of codes, secrets, and unseen truths.  all under the watchful eye of Brown’s most terrifying villain to date. Set within the hidden chambers, tunnels, and temples of Washington, D.C., The Lost Symbol accelerates through a startling landscape toward an unthinkable finale.\\r\\n\\r\\nAs the story opens, Harvard symbologist Robert Langdon is summoned unexpectedly to deliver an evening lecture in the U.S. Capitol Building. Within minutes of his arrival, however, the night takes a bizarre turn. A disturbing object--artfully encoded with five symbols--is discovered in the Capitol Building. Langdon recognizes the object as an ancient invitation . . .one meant to usher its recipient into a long-lost world of esoteric wisdom.When Langdon’s beloved mentor, Peter Solomon--a prominent Mason and philanthropist--is brutally kidnapped, Langdon realizes his only hope of saving Peter is to accept this mystical invitation and follow wherever it leads him. Langdon is instantly plunged into a clandestine world of Masonic secrets, hidden history, and never-before-seen locations--all of which seem to be dragging him toward a single, inconceivable truth. As the world discovered in The Da Vinci Code and Angels & Demons, Dan Brown’s novels are brilliant tapestries of veiled histories, arcane symbols, and enigmatic codes. In this new novel, he again challenges readers with an intelligent, lightning-paced story that offers surprises at every turn. The Lost Symbol is exactly what Brown’s fans have been waiting for . . . his most thrilling novel yet.', '15.00', '0.00', 30, '2009-09-15 12:00:00', '780.00', 'https://en.wikipedia.org/wiki/The_Lost_Symbol', 'Available', 'The-Lost-Symbol.jpg'),
(5, 'Fingerprints of the Gods: The Evidence of Earth', 'Could the story of mankind be far older than we have previously believed? Using tools as varied as archaeo-astronomy, geology, and computer analysis of ancient myths, Graham Hancock presents a compelling case to suggest that it is.“A fancy piece of historical sleuthing . . . intriguing and entertaining and sturdy enough to give a long pause for thought.”—Kirkus Reviews In Fingerprints of the Gods, Hancock embarks on a worldwide quest to put together all the pieces of the vast and fascinating jigsaw of mankind’s hidden past. In ancient monuments as far apart as Egypt’s Great Sphinx, the strange Andean ruins of Tiahuanaco, and Mexico’s awe-inspiring Temples of the Sun and Moon, he reveals not only the clear fingerprints of an as-yet-unidentified civilization of remote antiquity, but also startling evidence of its vast sophistication, technological advancement, and evolving scientific knowledge. A record-breaking number one bestseller in Britain, Fingerprints of the Gods contains the makings of an intellectual revolution, a dramatic and irreversible change in the way that we understand our past—and so our future. And Fingerprints of God tell us something more. As we recover the truth about prehistory and discover the real meaning of ancient myths and monuments, it becomes apparent that a warning has been handed down to us, a warning of the terrible cataclysm that afflicts the Earth in great cycles at irregular intervals of time—a cataclysm that may be about to recur.“Readers will hugely enjoy their quest in these pages of inspired storytelling.”—The Times (UK)', '24.66', '0.15', 20, '1996-04-02 12:00:00', '500.00', 'https://en.wikipedia.org/wiki/Fingerprints_of_the_Gods', 'Available', 'Fingerprints_of_the_Gods.jpg'),
(6, 'Zoo Station: The Story of Christiane F. (True Stories)', 'This incredible autobiography of Christiane F. provides a vivid portrait of teen friendship, drug abuse, and alienation in and around Berlin\'s notorious Zoo Station. Christiane\'s rapid descent into heroin abuse and prostitution is shocking, but the boredom, longing for acceptance, thrilling risks, and even her musical obsessions are familiar to everyone. Previously published in Germany and the US to critical acclaim, Zest\'s new translation includes original photographs of Christiane and her friends.', '42.00', '0.00', 60, '2013-01-01 12:42:00', '363.00', 'https://www.arte.tv/en/videos/104808-000-A/zoo-station-the-story-of-christiane-f/', 'Not Available', 'zoo-station-the-story-of-christiane-f.jpg'),
(7, 'Ugly Love: A Novel', 'From Colleen Hoover, the #1 New York Times bestselling author of It Ends with Us, a heart-wrenching love story that proves attraction, at first sight, can be messy. When Tate Collins meets airline pilot Miles Archer, she doesn\'t think it\'s love at first sight. They wouldn’t even go so far as to consider themselves friends. The only thing Tate and Miles have in common is an undeniable mutual attraction. Once their desires are out in the open, they realize they have the perfect set-up. He doesn’t want love, she doesn’t have time for love so that just leaves the sex. Their arrangement could be surprisingly seamless, as long as Tate can stick to the only two rules Miles has for her. Never ask about the past. don\'t expect a future. They think they can handle it, but realize almost immediately they can’t handle it at all. Hearst gets infiltrated. Promises get broken. nRules get shattered. Love gets ugly.', '10.40', '0.15', 60, '2022-08-12 23:36:06', '272.00', 'https://colleen-hoover.fandom.com/wiki/Ugly_Love', 'Available', 'Ugly_Love.jpg'),
(8, 'The Silent Patient', 'An unforgettable―and Hollywood-bound―new thriller. A mix of Hitchcockian suspense, Agatha Christie plotting, and Greek tragedy. Entertainment Weekly The Silent Patient is a shocking psychological thriller of a woman’s act of violence against her husband―and of the therapist obsessed with uncovering her motive. Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word. Alicia’s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London. Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations―a search for the truth that threatens to consume him.', '12.99', '0.20', 50, '2019-02-05 14:00:00', '522.00', 'https://en.wikipedia.org/wiki/The_Silent_Patient', 'Not Available', 'The_Silent_Patient.jpg'),
(9, 'All That’s Left in the World', 'What If It\'s Us meets They Both Die at the End in this postapocalyptic, queer YA adventure romance from debut author Erik J. Brown. Perfect for fans of Adam Silvera, Alex London, and Heartstopper by Alice Oseman. When Andrew stumbles upon Jamie’s house, he’s injured, starved, and has nothing left to lose. A deadly pathogen has killed off most of the world’s population, including everyone both boys have ever loved. And if this new world has taught them anything, it’s to be scared of what other desperate people will do. so why does it seem so easy for them to trust each other? After danger breaches their shelter, they flee south in search of civilization. But something isn’t adding up about Andrew’s story, and it could cost them everything. And Jamie has a secret, too. He’s starting to feel something more than friendship for Andrew, adding another layer of fear and confusion to an already tumultuous journey. The road ahead of them is long, and to survive, they’ll have to shed their secrets, face the consequences of their actions, and find the courage to fight for the future they desire, together. Only one thing feels certain: all that’s left in their world is the undeniable pull they have toward each other.', '15.99', '0.15', 9, '2022-03-08 12:00:00', '431.00', 'https://www.goodreads.com/en/book/show/58329296-all-that-s-left-in-the-world', 'Available', '-all-that-s-left-in-the-world.jpg'),
(10, 'Apple iPhone 13 (128 GB) - Pink', 'About this item\r\n6,1\" Super Retina XDR Display\r\nDer Kinomodus fügt automatisch geringe Tiefenschärfe hinzu und verschiebt den Fokus in deinen Videos\r\nFortschrittliches Zwei-Kamera-System mit 12 MP Weitwinkel‑ und Ultraweitwinkel-Objektiven; Fotografische Stile, Smart HDR 4, Nachtmodus, 4K HDR Aufnahme mit Dolby Vision\r\n12 MP TrueDepth Frontkamera mit Nachtmodus, 4K HDR Aufnahme mit Dolby Vision\r\nA15 Bionic Chip für superschnelle Performance\r\nBis zu 19 Std. Videowiedergabe\r\nRobustes Design mit Ceramic Shield\r\nBranchenführender IP68 Wasserschutz\r\n5G für superschnelle Downloads und Streaming in höchster Qualität\r\niOS 15 ist vollgepackt mit neuen Features, damit du mehr mit dem iPhone machen kannst als je zuvor', '858.55', '0.50', 200, '2022-01-07 20:00:00', '0.00', 'https://www.amazon.de/-/en/MLPH3ZD-A/dp/B09G93ND7F/ref=sr_1_3?crid=3JRUQA9TF0PPK&keywords=handy+iphone+13&qid=1660340743&sprefix=cellphone+iphone13%2Caps%2C884&sr=8-3', 'Available', 'phone1.jpg'),
(11, 'Ulefone Note 12 smartphone Android without contract (2022), mobile phone 4 GB/128 GB/128 GB, 4 core processor, strong 7,700 mAh battery, 6.82 inch HD+ display, Android 11.4 g/3 g/2 g, 13 MP + 2 MP cam', 'About this item\r\n4 Kern Prozessor：Ganz besonders rentiert sich ein 4 Kern Prozessor für Nutzer, die mehrere Anwendungen parallel laufen lassen möchten. Smartphone mit mehreren CPU-Kernen sind in der Regel schneller und seltener überlastet.\r\nSpeicher 128GB+128GB microSD Karte+Ram 4GB：Mit einem internen Speicher von 128 GB und der Möglichkeit, ihr Speicher lässt sich per microSD Karte auf bis zu 256 GB zu erweitern,bietet dir das Ulefone note 12 viel Platz, um deine Bilder, Videos, Musik oder Dateien zu speichern.\r\nAlte Ausführung und Bluetooth 4.2 :Ulefone rüstet immer noch 3,5 mm Kopfhörerbuchse für Nostalgiker aus.Sie können so ziemlich jeden kabelgebundenen Kopfhörer verwenden – Sie müssen sich keine Gedanken darüber machen, ob es sich um Lightning oder USB-C handelt oder ob die Konnektivität ein- und ausgeht. Keine Batterien zum Aufladen, keine Dongles zum Anbringen.Das ulefone note 12 ist jedoch auch mit Bluetooth 4.2 ausgestattet, aber es ist auch schön, zumindest die Option zu haben.\r\nLängste Akkulaufzeit: Ulefone note 12 mit sattem 7.700 mAh Akku.Der App-Standby von Android 11 versetzt Apps in den „Standby“-Modus, wenn Sie sie nicht aktiv verwenden, wodurch die Standby-Zeit des Mobiltelefons länger wird bis zu 465 Stunden.\r\nAndroid 11: Auf Ulefone note 12 läuft Android 11 Leistungsstarkes und einfacheres Android 11erhältst Du mehr Kontrolle über Deine Daten.\r\nMehrfachkamera +HD+ Display : Auflösung Mehrfachkamera 13MP+8MP+2MP und HD+ Display des Ulefone note 12 ist ein wahrer Augenschmaus. Genieße mit dem großen 6,82 Zoll-Display deine Lieblingsinhalte in einer lebendigen, brillanten und scharfen Farbqualität.\r\nGesichtsentsperrung,Gesichtserkennung und Finger­abdruck­sensor with power key:Ulefone note 12 kann mit Ihrem Gesicht oder Fingerabdruck entsperrt werden, wodurch Ihre Telefoninformationen sicherer und funktionaler werden.', '135.99', '0.15', 300, '2021-08-11 14:00:00', '485.00', 'https://www.amazon.de/-/en/Ulefone-Note-12/dp/B0B28QLC4N/ref=sr_1_4?crid=2YDK7VOFP5MAR&keywords=handy&qid=1660341198&sprefix=cellphone%2Caps%2C277&sr=8-4&th=1', 'Not Available', 'secondphone.jpg'),
(12, 'Samsung Galaxy A13 Android Smartphone, 6.6 Inch Infinity-V Display, Android 12, 4GB RAM and 64GB Internal Expandable Memory, 5000mAh ³ Battery, Light Blue', 'About this item\r\nVIBRANT DISPLAY More space to play with the 6.6 inch Infinity V display, FHD+ technology of the 4G smartphone makes your daily content sharp, defined and clear.\r\nMinimalist design: it combines soft colours with a delicate appearance and feels comfortable in the hand.\r\nQuad camera system: capture unforgettable moments with the 50MP main camera, expand the viewing angle with the ultra wide angle camera, optimize the focus with the deep camera and improve your shots with the macro camera.\r\nLONG BATTERY LIFE: A battery that will not slow down your rhythms. The 5000 mAh battery of these phones will accompany you all day long and even longer.\r\nHigh performance: with an Octa-Core processor and up to 4GB of RAM, the Galaxy A13 offers fast and efficient performance. Save as much as you want with the 64 GB internal memory, expandable with microSD card up to 1 TB².', '158.51', '0.00', 200, '2022-05-19 14:00:00', '420.00', 'https://www.amazon.de/-/en/Samsung-Smartphone-Infinity-V-Internal-Expandable-blue/dp/B09SHWTRFL/ref=sr_1_6?crid=2YDK7VOFP5MAR&keywords=handy&qid=1660341198&sprefix=cellphone%2Caps%2C277&sr=8-6&th=1', 'Available', 'thirdphone.jpg'),
(13, 'Smartphone, Android 11, 4+32 GB, no contract, 6.1-inch HD+ mobile phone, 8MP+5MP camera, 4G LTE dual SIM smartphone, GPS, BT 5.0', 'About this item\r\nAndroid 11 smartphone: equipped with Android 11, 4 GB RAM, the mobile phone offers you the latest and most popular features and uses the 6 nm process to achieve better performance while saving energy\r\nLarge 6.1 inch FHD+ mobile phone: the large 6.1 inch full HD+ display with wide colour space provides vivid colours and details while reaching up to 1,000 Nit to ensure the clarity of the screen even in bright daylight\r\nAmazing sound quality phone: with the two super-linear speakers on the top and bottom of the phone, the CWOWDEFU smartphone delivers impressive stereo sound for games or videos\r\n【Dual 4G SIM Slot Design】 - The cheap LTE smartphone has 2 slots, you do not need to take an additional mobile phone with you to use your second number. The dual SIM mobile phone has a separate SD card slot, you can expand the memory with SD by up to 128 GB;\r\nMulti-camera system: with the 5 + 13 MP main camera, you can take many sharp and clear photos, adjust the focus with the deep camera or go close to the details with the macro camera.', '139.99', '0.12', 150, '2021-08-11 15:00:00', '540.00', 'https://www.amazon.de/Smartphone-Android-contract-6-1-inch-black/dp/B09W256343/ref=sr_1_22_sspa?crid=2YDK7VOFP5MAR&keywords=handy&qid=1660341198&sprefix=cellphone%2Caps%2C277&sr=8-22-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyU1FNRFIxUVlRS0MzJmVuY3J5cHR', 'Not Available', 'forthphone.jpg'),
(14, 'DOOGEE S97 Pro Outdoor Mobile Phone 8GB+128GB Smartphone without Contract with Rangefinder, 8500mAh 33W Fast Charging 48MP Quad Camera, Android 11 Helio G95 6.39 Inch IP68 Waterproof. NFC Orange', 'About this item\r\nHelio G95 octa-core processor / Android 11 / 8GB + 128GB: Helio G95 is higher than G90, 20% higher than Helio P90. Doogee S97 Pro outdoor mobile phone equipped with the Helio G95 Octa-Core processor and Android 11 system. You can have super gaming experience. 8GB RAM provides the phone with more buffer memory and so you can perform multi-tasks without limit. 128 GB ROM (SD up to 256 GB) can meet your every storage requirements\r\n40 m rangefinder + dedicated rangefinder button: the Doogee S97 Pro waterproof outdoor mobile phone is equipped with an infrared rangefinder. With these functions, each user can measure length, area, volume and pythagoras. ±3cm measuring accuracy. When you open the rangefinder function, you can click the left button to start the measurement. The construction site mobile phone saves you time and tool costs, suitable for construction workers, engineers.\r\n48MP + 16MP super camera: Doogee S97 Pro robust outdoor mobile phone without contract has a 48MP AI main camera. The 48MP camera delivers an ultra-high resolution camera image. Zoom into your photo and explore a shockingly clear new world. Capture your stories in a captivating 4K recording. 16MP AI selfie camera captures minute details and focus on the beauty in you.\r\n8500 mAh + 33 W fast charging + 10 W wireless charging: Doogee S97 Pro outdoor smartphone large battery, 8500 mAh super battery can stand for 26 days of standby, 40 hours of conversation, 33 W super fast charging the phone can be fully charged in 2 hours, it is a reliable choice for outdoor adventures. At the same time, the Doogee S97 Pro mobile phone supports wireless charging with 10 W.\r\nIP68/IP69K + 6.39 inch corning gorilla glass: Doogee S97 Pro unlocked mobile phone is waterproof according to IP68 and IP69K, 2 m fall protection against ground and 1.5 m fall protection against concrete pavement, 360° dustproof in all directions. The 6.3 inch screen offers you excellent all-round view. It integrates multiple functions, gyroscope, compass, GPS, GLONASS, Beidou, Galileo navigation system, OTG, fingerprint and NFC.', '329.99', '0.10', 400, '2020-08-12 15:00:00', '340.00', 'https://www.amazon.de/-/en/S97-Smartphone-Contract-Rangefinder-Waterproof-PRO-Orange/dp/B098QXVBVB/ref=sr_1_20?crid=2YDK7VOFP5MAR&keywords=handy&qid=1660341852&sprefix=cellphone%2Caps%2C277&sr=8-20&th=1', 'Available', 'fifthphone.jpg'),
(15, 'OUKITEL WP17 Outdoor Smartphone 2022 Upgrade Version, 8300 mAh Outdoor Mobile Phone 128 GB + 8 GB, 90 Hz 6.78 Inch FHD+ Display, Helio G95 Game Chip, 64 MP + 20 MP Camera, 18 W Fast Charging Android 1', 'About this item\r\n6.78 inch 90 Hz FHD+ screen: the OUKITEL WP17 mobile phone is equipped with the IPS display (2460 x 1080). 90Hz refresh rate and 180Hz touch sampling rate. Bring a smooth and silky experience. Bright colours, high saturation, fine image quality, faster screen response\r\nEXCELLENT CAMERA LENS: The outdoor smartphone is equipped with a 64MP main lens and a 20MP night vision lens on the back and a 16MP selfie lens on the front. Supports Ultra HD video recording in 4K/30fps format. Night scene mode, multi-person selfie, slow motion, surround mode, etc. A variety of functions is worth discovering\r\n128GB & G95 Gaming Chip: OUKITEL WP17 mobile phone 8GB RAM can run multiple software and games at the same time smoothly, uses 128GB fast flash memory and supports up to 2TB TF memory card. Octa-Core GP5 gaming flagship chip, offers you a durable and smooth experience\r\n8300 mAh & 18 W fast charging: outdoor smartphone uses an 8300 mAh battery with high capacity equipped with 18 W (9 V 2 A) fast charging. Charging takes only 3 hours. Do not let \"battery be afraid\". When used with OTG, WP17 smartphone can be used as a mobile power source for other mobile phones and electronic devices\r\nQuality upgrade & premium service: Compared with the quality problems of WP17 mobile phone 2021, OUKITEL WP17 smartphone 2022 was updated and optimised in hardware and software to solve the quality problems. At the same time, we offer a 180-day return service and a 365-day free exchange service', '329.99', '0.30', 100, '2020-05-12 18:00:00', '350.00', 'https://www.amazon.de/-/en/OUKITEL-WP17-Smartphone-2022-Charging/dp/B09WYM9VV6/ref=sr_1_23?crid=2YDK7VOFP5MAR&keywords=handy&qid=1660341991&sprefix=cellphone%2Caps%2C277&sr=8-23', 'Not Available', 'sixthphone.jpg'),
(16, 'FriRex Hoodie', 'Large lettering embroidered on the front\r\nEmbroidered logo on the hood\r\nClosure: Pull On\r\n60% Cotton, 40% Polyester\r\nHoodie\r\nTwo-tone hood\r\nPrinted neckband and woven labels\r\nEmbossed cord eyelets', '39.99', '0.12', 300, '2022-08-03 10:00:00', '100.00', 'https://www.amazon.de/FriRex-hoodie-black-m/dp/B07N5LHBFJ/ref=sr_1_58_sspa?crid=2E1FCGNNWUJMR&keywords=Kleidung&qid=1660342273&sprefix=clothe%2Caps%2C750&sr=8-58-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzMzdaNUhUM1Y2OTlWJmVuY3J5cHRlZElkPUEwMTk0NDY5MlRBRFc5M0', 'Available', 'firstclothes.jpg'),
(17, 'Miusol Women\'s Vintage Lace A-Line Dress Cocktail Party Evening Dresses\r\n', 'Recommended sizes: EU36/38 (Small), UK 40/42 (Medium), UK 44/46 (Large), UK 48/50 (X-Large), UK 52 (XX-Large)\r\nSheath waist, sleeveless, slim cut\r\nIn Ärmellos\r\nClosure: zipper\r\n95% Polyester, 5% Elastane\r\nS\r\nModel: M9205_BLK_M.x\r\nTie on the chest, sexy dress, back zip.\r\nBusiness, casual, picnic, rockabilly, festival, celebration, joy, wedding party, and 50s party, etc. Suitable for a party dress, cocktail dress.\r\nZip fastener on the back. Please put a little wax on the zip if it jams.', '37.99', '0.09', 80, '2022-08-02 11:00:00', '0.00', 'https://www.amazon.de/dp/B07QQRM1N1/ref=sspa_dk_detail_6?psc=1&pd_rd_i=B07QQRM1N1&pd_rd_w=Ot4NX&content-id=amzn1.sym.9fc1171e-ba31-4c42-ab98-1a7e5ade3aff&pf_rd_p=9fc1171e-ba31-4c42-ab98-1a7e5ade3aff&pf_rd_r=CHKCJFRGD5BWKK1K1HVW&pd_rd_wg=PXwRT&pd_rd_r=6b8c', 'Available', 'secondclothes.jpg'),
(18, 'Sunnykud Women’s Elegant, V-Neck Dress, Business Dresses, Bodycon Long Sleeve Winter Dress, Cocktail Dress, Pencil Dress, Business Figure-hugging Knee-length Jumper Dress', 'Material: 90% polyester and 10% acrylic.\r\nOccasion: Perfect for wedding, office, night club, bar, beach, holidays, honeymoon, spring.\r\nLange Ärmel\r\nClosure: Wickel\r\n90% Polyester, 10% Polyacryl\r\nWickel\r\nDesign: Very soft and breathable fabric. Casual, silky, figure-hugging party dress. Deep Cross V-Neck, Long Sleeve.\r\nFeature: Sexy club party dress. Elastic material, Above the knee, cuffs on the hip, monochrome. Make you more vivid and eye-catching.\r\nHigh wearing comfort, the dress with an attractive V-neck falls loosely at the front in a trendy wrap look up to the hip, where it is in the figure-hugging skirt part. Open toe booties, a bangle and the great wrap dress and your eye-catching party look is in the box.', '15.99', '0.60', 80, '2022-08-02 12:00:00', '150.00', 'https://www.amazon.de/Sunnykud-Business-Cocktail-Figure-hugging-Knee-length/dp/B07XK2W2CH/ref=d_pd_sbs_sccl_1_57/260-8548923-9555058?pd_rd_w=ky1uB&content-id=amzn1.sym.dd12e595-59ba-462a-a82b-6daceb70766d&pf_rd_p=dd12e595-59ba-462a-a82b-6daceb70766d&pf_rd', 'Not Available', 'thirdclothes.jpg'),
(19, 'Boomcool Men Fitness Workout Clothing Gym Running Compression Pants Shirt Top Long Sleeve Jacket Set', 'BE SURE TO REFER TO the size chart BEFORE YOU BUY.\r\nA blend of 92% polyester and 8% Smooth and Ultra-Soft fabric, comfortable enough to be worn all day.\r\n92% polyester\r\nHand Wash Only\r\nCollar Style: Classic\r\nCompression\r\nLong Sleeve\r\n3 in 1 set, running shorts + compression leggings+Short sleeve,ultra-soft & smooth for extreme comfort with very little weight.\r\nQuick drying and moisture wicking.Transporting moisture away from the skin.Keeping you cool and dry during sports,suitable for all seasons.\r\nGreat for weight training, football, rugby, skiing, snowboarding,tennis,rowing cycling,equestrian athletics etc', '17.99', '0.14', 600, '2022-08-01 13:00:00', '250.00', 'https://www.amazon.co.uk/Boomcool-Fitness-Workout-Clothing-Compression/dp/B08LDBLSZY/ref=sr_1_10?crid=XJ42AZTZSAI1&keywords=men+clothes&qid=1660344108&s=apparel&sprefix=men+clothes%2Cfashion%2C203&sr=1-10', 'Available', 'forthclothes.jpg'),
(20, 'Lomon Men\'s Gym Tank Tops Sports T Shirt Thin Fitness Muscle Vest Sleeveless Hoodies with Pockets\r\n', 'Comfortable Workout Tank: Sleeveless hoodies quality fabric is comfort, lightweight and stretchy, suitable for all seasons, perfect for gym and training\r\nUnique Design of Gym Tops: The fit tank tops has Zipper pocket,it’s practical,Exercise while listening to music,you can put your phone or headphones in it.\r\n95% Polyester, 5% Elastane\r\nFastening: Zipper\r\nRegular Fit\r\nSleeveless\r\nSports T Shirt : Thin athletic gym shirt,Lightweight athlectic shirt,whether running or other fitness,will make you more comfortable.\r\nEasy-Matching: Match with a pair of black slacks, sports shoes, sweatpants, casual pants, the physical and casual dress will make you more energetic.\r\nIdeal For: The hooded vests are suitable for workout, fitness, gym, bodybuilding, basketball, training, squats, lunges, and deadlifts, running, jogging, vacation, outdoor leisure or trendy casual wear. Great for all seasons.', '18.50', '0.15', 120, '2022-08-07 14:00:00', '160.00', 'https://www.amazon.co.uk/Sleeveless-Hoodie-Running-Training-Clothes/dp/B088R688YW/ref=sr_1_47?crid=XJ42AZTZSAI1&keywords=men+clothes&qid=1660344237&s=apparel&sprefix=men+clothes%2Cfashion%2C203&sr=1-47', 'Available', 'fifthclothes.jpg'),
(21, 'JACK & JONES Men\'s JJILIAM JJORIGINAL AM 010 LID NOOS Jeans, Grey (Grey Denim), W34/L34 (Manufacturer size: 34)', 'Note: This item is eligible for FREE Click and Collect without a minimum order subject to availability. Details\r\nSize chart \r\nSkinny\r\n98% Cotton, 2% Elastane\r\nNormal wash cycle at 40°,Do not bleach,Drying low temperature,Iron at medium temperature,Do not clean\r\nFastening: Zipper\r\nMedium\r\nSkinny\r\nSuper Skinny\r\n12109954\r\n', '26.56', '0.00', 60, '2022-08-08 11:00:00', '130.00', 'https://www.amazon.co.uk/JONES-JJILIAM-JJORIGINAL-Jeans-Manufacturer/dp/B01E5MWKGA/ref=sr_1_39?pf_rd_i=1730981031&pf_rd_m=A3P5ROKL5A1OLE&pf_rd_p=ecfa52ea-3668-4dde-8ea2-7de49dbe3c7d&pf_rd_r=ZFVEYXGYEGNR6XB41243&pf_rd_s=merchandised-search-5&pf_rd_t=101&qi', 'Available', 'sixthclothes.jpg'),
(22, 'Mens Belt, CHAOREN Leather Ratchet Belt for Men Dress 1 3/8\", Adjustable Trim to Exact Fit, Automatic Buckle Belt', 'Note: This item is eligible for FREE Click and Collect without a minimum order subject to availability. Details\r\nCHAOREN Belt Men, Automatic Buckle Belt, Leather Ratchet Belts for Men, Width 35mm (1 3/8\"). Suitable for Suit Trousers and Jeans. The Best Men\'s Clothing Accessories.\r\nRatchet Notch Design: There Are 32 Ratchet Notches on the Back of the Belt, Fine-tuned at 5mm Intervals to Precisely Adapt to Changes in Your Waist.\r\nDry Cloth Clean\r\nFastening: buckle\r\nEasy to Use: The belt slides into the sliding buckle, the ratchet strap locks automatically, holeless design, the feel is more flexible, the strap can be adjusted quickly and precisely.\r\nSize Adjustable: the Band Can Be Cut to Adjust the Length to Fit Exactly Around Your Waist.\r\nAutomatic Buckle: Galvanic, Scratch Resistant. Tightly Closed, Easy to Remove.\r\nDurability: Leather Belt, Flexible and Sturdy. Enough Flexibility.\r\nGift Idea: Stylish Gift Box Packaging, the Best Gift for Men. the Quality Belt is Suitable for Men\'s Dress Code for All Occasions, Any Formal and Business Suits.', '19.99', '0.10', 600, '2022-08-02 14:00:00', '50.00', 'https://www.amazon.co.uk/dp/B09JWM5D3H/ref=twister_B09YRDMS7W?_encoding=UTF8&psc=1', 'Available', 'seventhclothes.jpg'),
(23, 'Scepter 24 Inch Professional Thin 75 Hz 1080p LED Monitor 2 x HDMI VGA Built-in Speakers Machine Black (E248W-19203R Series)', '61 cm (24\") ultra-thin profile\r\nModern, elegant metallic design\r\nNarrow bezel with thin chassis Power range (V, A, Hz) - AC-DC adapter Input 100-240 VAC, 50/60 Hz, 1.0 A (max.) Output power: 12 V DC, 2.5 A. Power consumption (Typical): 25.4W. Detachable Neck/Stand: Yes\r\n2 x HDMI ports (convertible to DVI). Contrast Ratio: 1000:1\r\nVESA wall mount ready HDMI input signal support - 1920x1080@75Hz, 1080/60p, 1080/60i, 720p, 480p, 480i, Built-in speakers - 2 x 2W 8 ohms. Mounting Type: VESA Hole Pattern 100mm x 100mm', '103.66', '0.20', 140, '2022-06-05 14:00:00', '2.61', 'https://www.amazon.com/Sceptre-E248W-19203R-Monitor-Speakers-Metallic/dp/B0773ZY26F/ref=sr_1_6?qid=1659954844&rnid=16225009011&s=electronics&sr=1-6&th=1', 'Available', 'firstelectronic.jpg'),
(24, 'DJI Mini 3 Pro (DJI RC) - Lightweight and foldable camera drone with 4K/60fps video, 48MP photo, 34 min flight time, tri-directional obstacle detection, ideal for aerial photography and social media', 'About this item\r\nHassle-Free Manufacturing - Weighing less than 249g, Mini 3 Pro requires no registration in most countries and regions. The foldable and compact design also makes it easy to take with you on any adventure.\r\nSeriously Pro Shots - Capture your world in remarkable detail with 4K/60fps video and 48MP photos. The advanced camera system supports dual native ISO and f/1.7 aperture for high-quality images, night and day.\r\nPerfect portrait shots in one tap - the redesigned DJI Mini 3 Pro offers true vertical shooting for portrait shots, ideal for social media. The gimbal rotates 90 degrees so you don\'t have to compromise on image quality.\r\nSweet Air Time - Enjoy an extended flight time of up to 34 minutes and capture and explore more of your surroundings.\r\nFly with Confidence: DJI Mini 3 Pro features three-directional obstacle detection and APAS 4.0, for unmatched safety in the Mini series.\r\nCreate and share on the go - DJI Mini 3 Pro offers an extensive range of intelligent functions including FocusTrack, True Vertical Shooting, MasterShots, Timelapse, QuickTransfer and more.\r\nIncludes the new DJI RC that comes pre-installed with the DJI Fly app and features a built-in 5.5\" HD display for clear viewing even in direct sunlight.\r\nNote : Products with electrical plugs are designed for use in the United States. Sockets and voltages vary by country. For example, this product may require an adapter or converter to work at your destination. Please check compatibility before purchasing.', '909.00', '0.10', 260, '2022-08-01 01:00:00', '0.00', 'https://www.amazon.com/DJI-Mini-Pro-Lightweight-Tri-Directional/dp/B09WDBDGBZ/ref=sr_1_10?qid=1659954882&rnid=16225009011&s=electronics&sr=1-10&th=1', 'Available', 'secondelectronic.jpg'),
(25, 'Logitech H390 Wired Headset, Stereo Headphones with Noise Canceling Mic, USB, In-Line Control, PC/Mac/Laptop - Black', 'About this item\r\nOptimal comfort: PC headphones with plush, padded headband and ear cups\r\nEnhanced Audio: Experience premium sound quality; System Requirements: Windows Vista, Windows 7, Windows 8, Windows 10 or later, Chrome OS USB port, Mac OS X (10.2.8 or later) USB port\r\nNoise Cancellation: A rotating microphone that minimizes background noise for clear calls\r\nAdvanced digital USB, Connections: USB compatible (1.1 and 2.0)\r\nIn-Line Controls: Adjust volume and mute your mic through the headset cord\r\nUSB Connectivity: Plug and play when you\'re ready with a simple USB connection\r\nUpgrade to Logitech H540 headset for high definition sound and on-ear control\r\nWorks with Chromebook: This product is tested and certified how it works with Chromebook, which means it meets Google compatibility standards and will work seamlessly with your Chromebook\r\nNote: If the headset does not work, please adjust the headset volume on the cable control. Make sure the headset is not muted. The mute light flashes when mute has been activated. Check the USB cable connection to your computer. Try a different USB port on your computer. Connect directly to your computer. Do not use a USB hub.', '23.99', '0.40', 50, '2022-08-13 22:00:00', '120.00', 'https://www.amazon.com/Logitech-Headset-H390-Noise-Cancelling/dp/B000UXZQ42/ref=sr_1_40?qid=1659954819&s=electronics&sr=1-40&th=1', 'Not Available', 'thirdelectronic.jpg'),
(26, 'Fitbit Sense Advanced Smartwatch with Heart Health Tools, Stress Management & Skin Temperature Trends, Carbon/Graphite, One Size (S & L Bands Included)', 'About this item\r\nDie EDA-Scan-App erkennt elektrodermische Aktivität, die die Reaktion Ihres Körpers auf Stress anzeigen kann, und ein integrierter Hauttemperatursensor protokolliert Ihre jede Nacht auf, damit Sie sehen können, wann es variiert\r\nBewerten Sie Ihr Herz auf Vorhofflimmern - eine Herzrhythmusunregelmäßigkeit - und teilen Sie Ergebnisse einfach mit Ihrem Arzt (die Fitbit ECG App ist nur in ausgewählten Ländern verfügbar. Nicht für Personen unter 22 Jahren geeignet. Betriebstemperatur: 14 °C bis 45 °C\r\nEin Hauttemperatursensor am Handgelenk verfolgt Ihre jede Nacht und Sie können sehen, wie es variiert. Sie können auch Ihren nächtlichen Blutsauerstoffgehalt auf einen Blick mit unserer Sammlung von Zifferblättern sehen. Maximale Betriebshöhe: 8,5 m\r\nHigh and low heart rate notifications to alert you when your seems to be above or below your average\r\nBattery lasts 6 plus days and provides a fast all-day charge in just 12 minutes (varies with usage and other factors; up to 12 hours with continuous GPS)\r\nUse built-in GPS during runs, hikes, rides and more to see pace and distance without your phone. Use the built-in microphone and speaker to take Bluetooth calls hands-free when your phone is nearby (requires more frequent charging)\r\nVerwenden Sie Google Assistant oder Amazon Alexa integriert, um schnelle Nachrichten zu erhalten, Schlafenszeit-Erinnerungen und Alarme zu einstellen, Ihre Smart-Home-Geräte zu steuern und mehr einfach mit Ihrer Uhr zu sprechen', '214.84', '0.28', 600, '2022-08-13 12:00:00', '230.00', 'https://www.amazon.com/Fitbit-Advanced-Smartwatch-Management-Temperature/dp/B08DFCWVZ4/ref=sr_1_4?qid=1659954924&rnid=16225009011&s=electronics&sr=1-4', 'Available', 'forthelectronic.jpg'),
(27, 'MP3 Player, 16GB Portable Bluetooth 4.2 HiFi Lossless Music Players MP4 with Voice Recorder and FM Radio Speaker, Expandable up to 128 GB', 'About this item\r\n♬【16GB Internal & 128GB External Memory】Support to store at least 5,000 songs and books with built-in 16GB internal memory, support up to 128GB Micro TF Card (NOT INCLUDED). 500mAh super large battery capacity can play music for up to 50 hours when fully charged for 2 hours, it is an excellent gift for boys and girls\r\n♬【Multifunctional MP3 Player】 MP3 player not only designed with music play. The built-in speaker can let you enjoy music without headphones, with Bluetooth connection, FM radio, E-book, image browsing, video play, voice recording, A-B repeat, but also supports alarm clock, calendar, file folders, time screen-saver, etc. Perfect for outdoor, gym fitness, and entertainment\r\n♬【Bluetooth 4.2 & HiFi Lossless Sound】Our MP3 Player adopts technology with lossless sound quality, it means you can listen to CD-level wireless music with faster transmission speed, stable performance, and high anti-jamming capability. Easily connect to Bluetooth speaker or Bluetooth headset within 10 meters. Support most of the popular audio formats: MP3、WMA、APE、FLAC、WAV\r\n♬【Unique Design with 2.4-inch Large Screen】 MP3 player has 2.4-inch smooth true-color displaying screen, high resolution, and excellent touching. The case adopts has sturdy plastic and metal zinc alloy cover, which has a strong resistance to pressure and impact. It is ultra-thin, combined ergonomic theory design a comfortable human curvature, TFT high-definition display, clearer picture quality, reflecting true color, restore high-definition picture quality\r\n♬【Package Including & Professional Service】 The package comes with MP3 player, User Manual, USB Cable, Earphones included; Best Service-Professional Customer Service Team\r\nNote : Products with electrical plugs are designed for use in the United States. Sockets and voltages vary by country. For example, this product may require an adapter or converter to work at your destination. Please check compatibility before purchasing.', '31.98', '0.40', 500, '2022-08-02 16:00:00', '360.00', 'https://www.amazon.com/Portable-Bluetooth-Lossless-Recorder-Expandable/dp/B0B3R44YSB/ref=sr_1_30_sspa?qid=1659955250&rnid=16225009011&s=electronics&sr=1-30-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExUTZaSkdQUVFOVUlJJmVuY3J5cHRlZElkPUEwNjE0ODA4MzhZUkJLTz', 'Available', 'fifthelectronic.jpg'),
(28, 'ZesGood Battery Organizer Storage Box Fireproof Waterproof Explosion Proof Battery Storage Organizer with Tester Holds 200+ Batteries (Battery Not Included)', 'About this item\r\n【Battery Organizer Storage Box】Package includes battery tester BT-168 and 6pcs AA/AAA battery storage box, can hold over 200 batteries, for easy storage of AAA, C, D, 9V and button batteries. The large mesh pocket creates more space to store batteries or accessories.\r\nFIREPROOF & WATERPROOF & EXPLOSION PROOF: The storage box is made of high quality non-itch silicone coated fiberglass, resistant to high temperature 1093℃. The special material has a certain explosion-proof property and waterproof function. So we designed this fireproof battery box to ensure the safety of your battery as much as possible.\r\n【Keeps Batteries Tidy】The storage box keeps your batteries safe in well-organized foam cutouts and easy to find. It\'s perfect for home use or as an extra layer of protection and convenience when taking it out. The cut foams stay inside, you need take some time to remove them.\r\nLIGHTWEIGHT & PORTABLE & SECURE: Our fireproof battery organizer bag features dual zipper and heavy duty handle to protect batteries from bumps. Not only can you hang the battery bag safely on the wall, in the closet, in a drawer, on a table or anywhere away from the fire, but you can also take it to various outdoor activities.\r\nPackage Contents: 1 x Fireproof Battery Storage Box 1 x Battery Tester 6 x Small Hard AA AAA Battery Storage Boxes Note: Batteries are not included. If you have any problem about our battery organizer bag, please feel free to let us know, your feedback will have a great impact on improving our products. Battery Storage Battery Organizer Storage Box Battery Tester Battery Box Fireproof Waterproof Explosion-Proof Safe Carry Case Bag Bard Bolder Batteries Storage Case\r\nNew (2) from $35.99\r\nNote : Products with electrical plugs are designed for use in the United States. Sockets and voltages vary by country. For example, this product may require an adapter or converter to work at your destination. Please check compatibility before purchasing.', '35.99', '0.28', 400, '2021-06-15 15:00:00', '4.25', 'https://www.amazon.com/Organizer-Fireproof-Waterproof-Explosionproof-ZesGood/dp/B083PQZLLB/ref=sr_1_14_sspa?qid=1659955348&rnid=16225009011&s=electronics&sr=1-14-spons&psc=1&smid=A3PBO1J05MILGR&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzUTVPODJERlJDUjNFJmVuY3J5cHRl', 'Available', 'sixthelectronic.jpg'),
(29, 'Baby Trend EZ Ride 35 Travel System, Doodle Dots\r\n', 'About this item\r\nStroller for children up to 22.7 kg and up to 106.7 cm\r\nTwo front wheels for excellent manoeuvrability\r\nLarge canopy with viewing window and large storage basket\r\nHeight adjustable handle and covered parent tray is ideal for mom and dad\r\nSwiveling children\'s tray with snack/cup holders', '269.80', '0.10', 120, '2022-08-13 11:00:00', '10.50', 'https://www.amazon.com/Baby-Trend-Travel-System-Doodle/dp/B079624FFS/ref=sr_1_7?qid=1659956468&rnid=16225005011&s=baby-products-intl-ship&sr=1-7', 'Available', 'firstbaby.jpg'),
(30, 'Munchkin Float and Play Bubbles Bath Toys, Pack of 4', 'About this item\r\nIncludes 2 fun characters and 2 fun toys that spin and rattle.\r\nEach ball stimulates baby\'s sight, hearing and touch.\r\nTextured rings move freely around the balls.\r\nThe balls float in the water.\r\nSuitable for toddlers from 4 months.', '8.99', '0.12', 900, '2021-05-02 12:00:00', '100.00', 'https://www.amazon.com/Munchkin-Float-Play-Bubbles-Count/dp/B00I3K25R0/ref=sr_1_15?qid=1659956463&rnid=16225005011&s=baby-products-intl-ship&sr=1-15', 'Available', 'secondbaby.jpg'),
(31, 'YDF Johnson\'s Head-to-Toe Baby & Newborn Wash & Shampoo + Johnson\'s Moisturizing Pink Baby Lotion - 500ML', 'About this item\r\nWHAT YOU WILL GET - 1 500ml Head to toe baby wash &1 500ml pink baby lotion\r\nWASH - Pediatrician-tested and pH-balanced gentle cleanser to maintain baby\'s natural skin moisture barrier\r\nWASH - 2-in-1 baby wash & shampoo tear-free and as gentle to your baby\'s eyes as pure water\r\nLOTION - Made with coconut oil, the newborn baby lotion is designed with input from parents like you and helps delicate baby skin maintain its natural moisture balance\r\nLOTION - baby moisturizing pink lotion with coconut oil hydrates and nourishes your little one\'s skin and provides a full 24 hours of dry skin relief', '19.98', '0.00', 800, '2022-08-02 11:00:00', '200.00', 'https://www.amazon.com/YDF-Johnsons-Newborn-Shampoo-Moisturizing/dp/B09B4953D4/ref=psdc_1253810011_t3_B07D2JMJPS', 'Available', 'thirdbaby.jpg'),
(32, 'Baby Feeding Kit Silicone Suction Plate Dinosaur Shape Self Feeding Adjustable Bib Suction Plate for Baby Toddlers with Spoon Fork Adjustable Bib Set Blue Dinosaurs', 'About this item\r\n100% silicone\r\n进口\r\nSAFE FOR TODDLER: The baby sucker pad is made of 100% food grade silicone that is BPA, BPS, PVC, latex and phthalate free. Silicone has a natural resistance to bacteria, making it safe and hygienic. Safe for babies, no plastic smell. No added fillers or harmful chemicals\r\nSelf Feeding: This baby feeding set includes 1 x dinosaur shaped plate, 1 x adjustable bib, 1 x spoon and 1 x fork. The cute dinosaur shape can enhance toddler\'s eating enjoyment. The adjustable bib and easy-to-grip spoon and fork help toddlers improve their self-feeding skills.\r\nEASY TO WASH/CLEAN: Dishwasher and microwave safe. Silicone can withstand low and high temperatures, easy to switch from the refrigerator or freezer to the oven or microwave. Oven safe up to 190°C. Dishwasher safe on top shelf. Or simply wash off with warm soapy water.\r\nStrong suction: easy and firm on a flat surface. If you put the plate on the surface with both hands, it can be easily pasted on it. No intention. No tipping over of food. No more chaos or mayhem. Say goodbye to traditional bowls or plates. And the plate sucker is suitable for any flat surface. Like table and counter tops, most high chair trays including space saving models.\r\nScientific Design: The waterproof adjustable silicone bib can prevent food from spilling, which means no more dirty clothes and messy eating pictures. Soft silicone spoons and forks can protect your baby\'s mouth and help them feed safely.', '16.90', '0.15', 700, '2022-02-08 14:00:00', '200.00', 'https://www.amazon.com/Set%EF%BC%8CSilicone-Dinosaur-SelfFeeding-Adjustable-Dinosaurs/dp/B09PL3Z299/ref=sr_1_13_sspa?qid=1659956600&rnid=16225005011&s=baby-products-intl-ship&sr=1-13-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUE4SFBBQkEzQ0s0V0wmZW5jcnlwdGV', 'Available', 'forthbaby.jpg'),
(33, 'Graco DuoDiner LX high chair converts to dining seat, Metropole', 'About this item\r\n3-in-1 convertible high chair that grows with your child\r\nBaby high chair with reclining function, provides a comfortable place for your baby\r\nFully equipped baby high chair for your little diner\r\nEasily converts to a booster seat when your child is ready. Wipe clean plastic tub, footrest and frame\r\nInfant head and body support and soft strap covers ensure baby is comfortable\r\nEasy-to-clean seat pad is wipeable or machine washable', '109.90', '0.21', 600, '2022-08-01 17:00:00', '0.00', 'https://www.amazon.com/-/de/dp/B00AHVR708/ref=psdc_166793011_t1_B00PTL13LA', 'Available', 'fifthbaby.jpg'),
(34, 'Sassy Stacks of Circles Stacking Ring STEM Educational Toy, Ages 6+ Months, Multicolored, 9 Piece Set', 'About this item\r\nStraight stick for rings of different sizes, strengthens hand-eye coordination\r\nChunky rings make it easy for baby to grasp, strengthen fine motor skills\r\nEach ring has a different texture and weight; the textured variety is ideal for the mouth!\r\nColorful beads in transparent ring for baby to connect sound to sight\r\n9 piece set\r\nRecommended age: 6 to 24 months. BPA free', '8.99', '0.31', 900, '2021-04-12 19:00:00', '100.00', 'https://www.amazon.com/dp/B07NXDJ52C/ref=d_pd_psc_dp_d_0_t2_sccl_2_13/138-8208802-5693667?pd_rd_w=Sj2Q7&content-id=amzn1.sym.81424b04-299d-4bf9-83d4-308fe8582715&pf_rd_p=81424b04-299d-4bf9-83d4-308fe8582715&pf_rd_r=1RW1VVC524SN4MKEHQRX&pd_rd_wg=pXZeS&pd_r', 'Not Available', 'sixthbaby.jpg'),
(35, 'Tinone Building Blocks Toy - Learning Construction Toys for 5 + Year Old Boys, Erector Set Building Blocks Educational Toys for Kids 5-7, STEM Toys Gifts for 4 5 6 7 8-Year-Old Boys Girls (Beam)\r\n', 'About this item\r\n【Learn From Play】: Featured as with 4 models, this STEM Building Toy set is an educational toy for Boys, Girls and Kids to improve their sense of construction and engineering ability. Forming a good ability such as improving hand-eye coordination and dexterity will benefit kids, MAXMIZE THEIR SENSE OF CREAVITY.\r\n【SAFETY GUARANTEE】: All components of this building blocks set have been certified to be safe, toxic free and without pungent smell.\r\n【Recommended Age】: This is a great constructional toy set for education purpose for those kids under teen age , especially for Boys and Girls aged from 8, 9, 10 and to up +. Take apart this stem toy and reassemble it, it grows up with your child and enhance your Son and Daughter\'s ability.\r\n【Ideal Kids\' Gift】: No matter for Christmas, Children\'s Day or for Boys, Girls\' Birthday, this DIY building and engineering kit toy is definitely the best choice for them.\r\n【Build to Last】: Each piece of component passed strict examination before packaging process, no sharp edges, and will not fade for long time use. Easy to clean.You can Totally trust our building blocks Toy！', '15.99', '0.00', 50, '2022-08-07 12:00:00', '400.00', 'https://www.amazon.com/dp/B08XN7DKBZ/ref=sspa_dk_detail_3?pd_rd_i=B08XN7DKBZ&pd_rd_w=3id5P&content-id=amzn1.sym.3be1c5b9-5b41-4830-a902-fa8556c19eb5&pf_rd_p=3be1c5b9-5b41-4830-a902-fa8556c19eb5&pf_rd_r=VJF0RRAMFFWRS7A7JZ4K&pd_rd_wg=fFYGp&pd_rd_r=75c7f7e1-', 'Available', 'seventhbaby.jpg');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `rrp`, `quantity`, `date_added`, `weight`, `url_slug`, `status`, `picture`) VALUES
(36, 'Tirrinia Bamboo Wine Rack Christmas Tree 6 Bottle Wine Rack for Dining Tables Countertops Kitchens and Cabinets DIY Wine Bottle Holder Wine Holder for Furniture Decoration', 'About this item\r\nChristmas Appearance: The Tirrinia wine rack has a cute and fun Christmas themed look and is a great way to display your prized wine in addition to everyday storage. Add an extra touch of decoration to your bar, dining table and shelves and save a lot of space.\r\nConvenient Design: The unique design of the inclined and small bottle mouth. The inclined angle of the bottle allows the wine to come in full contact with the cork, avoiding the deterioration of the wine due to contact with air and making the wine last longer. The small spout allows the wine to be firmly placed in the wooden wine rack without falling.\r\n【High Quality】Our products are made of natural bamboo material, which has the unique wooden touch of bamboo. Strong, durable and eco-friendly, it\'s a boon for eco-lovers. The thickness of the board is 1.3cm, which can withstand the weight of 6 bottles of wine and prevent the wine from shaking and falling.\r\n【Perfect Gift】With its beautiful Christmas tree appearance and thick natural bamboo material, this tabletop wine rack is perfect as a gift, perfect gift for parents, loved ones and friends on Christmas, birthday, housewarming and weddings.\r\n【Easy to Assemble】In the package, we provide the accessories and tools for installation. By following our installation instructions, you can easily get a complete wine rack and experience the fun of assembly. In addition, it matches your home style and brings a touch of brightness to your life.\r\nNote : Products with electrical plugs are designed for use in the United States. Sockets and voltages vary by country. For example, this product may require an adapter or converter to work at your destination. Please check compatibility before purchasing.', '23.99', '0.10', 890, '2021-05-17 14:00:00', '600.00', 'https://www.amazon.com/Tirrinia-Christmas-Countertops-Furniture-Decoration/dp/B09TR9NJG3/ref=sr_1_29_sspa?qid=1659956967&rnid=16225011011&s=kitchen-intl-ship&sr=1-29-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFMWVM5MVZHRE9PRUMmZW5jcnlwdGVkSWQ9QTAxOTEwOTQzNlpUWk', 'Available', 'firstkitchen.jpg'),
(37, 'Magic Bullet Mixer, klein, silberfarben, 11-teiliges Set', 'About this item\r\nWhat\'s Included: (1) 250W Motor Base, (1) Cross Blade, (1) Tall Cup, (1) Short Cup, (1) Party Cup, (2) Lip Rings, (2) Resealable Lids, (1) To-Go -Lid and 10 second recipe booklet\r\nThe magic orb chop, blend, blend, whip, grind and more. Impact-resistant plastic cup\r\nEasily create your favorite meals and snacks like smoothies, omelettes, sauces and dips. 250 watt high torque socket\r\nWith the included recipe book, you can quickly and easily prepare delicious dishes from appetizers to desserts. Add 1/2 cup water to make a smooth mixture for veggies', '39.98', '0.12', 60, '2022-08-03 13:00:00', '600.00', 'https://www.amazon.com/Magic-Bullet-Blender-Small-Silver/dp/B012T634SM/ref=sr_1_21?qid=1659956967&rnid=16225011011&s=kitchen-intl-ship&sr=1-21', 'Available', 'secondkitchen.jpg'),
(38, 'Mr. Coffee 2129512 Mini Brew Switch Coffee Maker, Black', 'About this item\r\nThe Mr. Coffee 5-cup coffee maker makes up to 750ml of coffee - perfect for two 340ml cups. Simple switch with power indicator lights up to show the coffee maker is on or to remind you to turn it off\r\nCompact design is ideal for small spaces; updated ergonomic carafe offers easy pouring and handling, and features ounce markings for perfect measuring\r\nGrab-a-Cup\'s automatic pause allows you to grab a cup before the brew is finished\r\nEasily visible water window allows you to see the exact water level to avoid overflows\r\nLift & Clean filter basket for easy cleaning', '14.99', '0.40', 300, '2022-08-02 12:00:00', '900.00', 'https://www.amazon.com/Mr-Coffee-2129512-5-Cup-Switch/dp/B08QD33PZ2/ref=sr_1_28?qid=1659957020&rnid=16225011011&s=kitchen-intl-ship&sr=1-28&th=1', 'Not Available', 'thirdkitchen.jpg'),
(39, 'Brita XL 27 cup dispenser with 1 standard filter, made without BPA, UltraMax, Gray (package may vary)\r\n', 'About this item\r\nThe UltraMax water dispenser is BPA free and holds 27 cups of water, enough to fill nine reusable water bottles, packaging may vary\r\nGet great tasting water with zero waste. Switching to Brita will save you money and replace 1,800 single-use plastic water bottles a year\r\nThis space-saving filtered water dispenser is fridge-friendly, features an easy-seal lid and precise pouring tap. Height: 26.6 cm Width: 14.4 cm Length: 36.5 cm Weight: 1.4 kg\r\nBrita is the #1 water filter that reduces chlorine (taste and odor), mercury, copper and more. Get cleaner, filtered water with a helpful sticker indicator that makes filter reminders effortless\r\nCompatible with Elite and Standard filters; replace your Elite filter at 120 gallons or about every 6 months or standard filter at 40 gallons or about every 2 months', '34.00', '0.15', 60, '2022-08-13 01:50:11', '200.00', 'https://www.amazon.com/Brita-Dispenser-Standard-Without-UltraMax/dp/B09WBX1WKC/ref=sr_1_33?qid=1659957020&rnid=16225011011&s=kitchen-intl-ship&sr=1-33&th=1', 'Available', 'forthkitchen.jpg'),
(40, 'Placemats Set of 6 - PVC Heat-Resistant Placemats Wipe Clean Kitchen Placemats Double-Sided Placemats Easy to Clean Suitable for Dining Table Kitchen Restaurant (Off-White)\r\n', 'About this item\r\nHigh-quality materials: the placemats are made of 70% PVC and 30% polyester, which is easy to clean, does not fade, bends freely and does not deform. Waterproof placemats add more color to your DIN table.\r\nSpace-saving: The size of the kitchen table mats is 30 x 45 cm. There is no trace of curling, which is convenient for storage and saves space. Heat-resistant placemats protect your DIN table from scalds and scratches and keep your furniture as new.\r\n✨ Easy to clean: PVC table mat is easy to clean, when the table mat is dirty, just wipe it with a damp cloth or rinse it under the tap, and it can be cleaned quickly. Can be cleaned in the dishwasher.\r\n✨ Wide range of applications: wipeable placemats in a set include 6 placemats, which can easily decorate the kitchen or restaurant. Dinn table placemats, very suitable for family gatherings, daily use, restaurants, etc.\r\n✨ GUARANTEE FOR YOU : If you are not completely satisfied with your purchase or the product is damaged in transit, please contact us immediately. We will solve your problems immediately.\r\n', '19.99', '0.14', 60, '2022-08-02 11:00:00', '200.00', 'https://www.amazon.com/Table-Placemats-Set-Heat-Resistant-Restaurant/dp/B09KRLR2V3/ref=sr_1_79_sspa?qid=1659957066&rnid=16225011011&s=kitchen-intl-ship&sr=1-79-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyRTA4MFg3QlVDSU5VJmVuY3J5cHRlZElkPUEwODU1Njg1RDdKNlc1M1Y3', 'Available', 'fifthkitchen.jpg'),
(41, 'Toshiba rice cooker 6 cups uncooked (3L) with fluffy logic and one-touch cooking, white\r\n', 'About this item\r\nAbout Toshiba - Toshiba brings more than 140 years of innovation to market with the first automatic electric rice cooker in 1955 and is a leader in the rice cooking industry.\r\nJapanese Rice Cooker - Industry-leading 3D cooking technology and intelligent 6-step cooking process. The steam valve and inner non-stick pot can retain the steam and heat for perfect fluffy rice every time.\r\nPROFESSIONAL RICE COOKER - 7 pre-programmed settings to cook white rice, brown rice, blended rice, short or long grain rice, oatmeal, porridge perfect in terms of texture, flavor and aroma. 12 cups of cooked rice to serve to the family.\r\nFast Rice Function - The Toshiba Rice Cooker has a fast rice function, the specially designed sensor accelerates the cooking time to 30 minutes, which is an excellent and a great time-saving option.\r\nKeep Warm Function - The rice cooker\'s keep warm function activates automatically when cooking is complete and keeps the contents at an ideal serving temperature for up to 24 hours.\r\n2 Programmable Delay Time Functions - The rice cooker has 2 delay time options, set the timer to have the rice ready when you need it. Just add rice and water in the morning and come home to eat delicious rice\r\nRemovable, Large Steam Vent: As you cook, steam rises through the vent with no blisters to flip and no messy overflow.', '114.89', '0.23', 80, '2022-08-02 15:00:00', '900.00', 'https://www.amazon.com/dp/B0838SMXFZ/ref=sspa_dk_detail_4?psc=1&pd_rd_i=B0838SMXFZ&pd_rd_w=RW7Ui&content-id=amzn1.sym.25e96bbe-93d6-4790-9c18-ab0bc96db737&pf_rd_p=25e96bbe-93d6-4790-9c18-ab0bc96db737&pf_rd_r=CJ865V3W1KYNZB4B0QVJ&pd_rd_wg=0YRel&pd_rd_r=927', 'Available', 'sixthkitchen.jpg'),
(42, 'Artfen Artificial Silk Flocked Poppies Long Stem 25\" Tall Without Vase 5 Pcs', 'About this item\r\n5 x French Corn Poppies\r\nMaterial: silk, plastic, wire, high quality flocking stem. Overall 25\" tall, each flower head 4\" in diameter.\r\nThe stem is easy to bend, suitable for DIY, make the style you want.\r\nPerfect for decorating wedding, your home and garden, office, coffee house, altar, church and so on.\r\nThey are also perfect for floral arrangements, centerpieces, crafts and more.', '15.99', '0.12', 900, '2020-08-19 12:00:00', '500.00', 'https://www.amazon.com/Artfen-Artificial-Flocking-Flowers-Wedding/dp/B07R2417QN/ref=sr_1_2_sspa?qid=1659957473&rnid=1063278&s=kitchen-intl-ship&sr=1-2-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyRzYwM1RURUQyS0JMJmVuY3J5cHRlZElkPUEwOTgzNTg0M0VJSEkyTEVHODc2WCZlb', 'Not Available', 'firstdecor.jpg'),
(43, 'JUGROUPE Gold Stamping Printing Geometry Throw Pillow Cases 18\"x18\" Ultra Soft Short Plush Fabric Square Decorative for Living Room Bed Sofa Car (GOILD 2)\r\n', 'About this item\r\nHIGH QUALITY FABRIC: Package includes 4 pieces 18\" x 18\". Autumn pillowcases, which are made of eco-friendly cotton linen, breathable, natural fabric, have various functions, such as anti-wrinkle and anti-static. Completely handmade, thick fabric makes the pillowcase super comfortable and durable. Pillowcase only, pillow not included.\r\nUnique Design: The pillowcase has an invisible zipper, which makes the appearance of the pillowcase simple and beautiful. Open zippers all over the side and slide easily, stable enough. Front print, back without design. Bright in color and vivid in design, these pillowcases can prevent stains on the surface of the pillows. Simple and elegant design, our pillowcases have a variety of different pattern combinations to meet your different needs.\r\nWidely used: the pattern of each cushion cover is different. You can choose your favorite pattern. It can be used on the sofa, bed, chair, car, floor, stool, office, coffee shop and other occasions to make your living room clean and beautiful, very suitable for decoration and party.\r\nWashing Instructions: Machine washable, wash in cold water or 30°C, gentle cycle or hand wash. Best to air dry. Do not bleach.\r\nWe appreciate your purchase of our pillowcases. If you are not satisfied with your order, we offer a replacement or a full refund within three months of delivery.', '15.90', '0.12', 999, '2021-08-24 13:00:00', '200.00', 'https://www.amazon.com/JUGROUPE-Stamping-Geometry-Ultra-Soft-Decorative/dp/B09NKP1LHN/ref=sr_1_14_sspa?qid=1659957520&refinements=p_72%3A1248915011&rnid=1248913011&s=kitchen-intl-ship&sr=1-14-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExQVdBRlQwQTdVRkoxJmVuY3J5', 'Available', 'seconddecor.jpg'),
(44, 'Americanflat Framed Round Mirror for Bathroom Bedroom Entryway Living Room Large Round Mirror for Wall Decor\r\n', 'About this item\r\naluminum, glass\r\nBRING LIGHT INTO YOUR SPACE: Hang this beautiful round mirror in your hallway or bathroom for a stylish way to add light to your space. This mirror with a black aluminum frame is perfect for a bedroom or hallway.\r\nMeasurements: Measuring 50cm in diameter, this mirror is large enough to give you a good view without being too big to dominate a room. The gold bathroom mirror frame is made of aluminum and measures 0.8 cm wide x 3.3 cm deep\r\nIDEAL AS BATHROOM MIRROR: Designed as a wall mirror, these bathroom mirrors are perfect for enhancing your wall decor. A gold framed mirror complements almost any color scheme and will add light and a sense of space to your home. A suspension on the back makes it easy to hang up the mirror.\r\nHohe Qualität: Dieser runde Spiegel ist mit Einfachheit und Präzision entworfen und besteht aus hochwertigem Aluminium und bleifreiem Glas. Ein stabiler Aufhänger auf der Rückseite ist alles notwendige Zubehör, um Ihren Wandspiegel aufzuhängen.\r\nSchutzverpackung: Americanflat hat eine exklusive proprietäre Verpackung entwickelt, die eine sichere Lieferung von zerbrechlichen Gegenständen gewährleistet, sodass Sie mit Vertrauen bestellen können. Klicken Sie auf und legen Sie es noch heute in den Einkaufswagen!\r\n', '14.44', '0.16', 600, '2022-08-02 16:00:00', '700.00', 'https://www.amazon.com/Americanflat-Framed-Gold-Round-Mirror/dp/B09ZGRDZ9Q/ref=sr_1_1_sspa?qid=1659957481&rnid=1063278&s=kitchen-intl-ship&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFVMlVaWlQ1Sk8yTU4mZW5jcnlwdGVkSWQ9QTA1OTM5MjQzQ0wwSTNWVDU1VE5OJmVu', 'Available', 'thirddecor.jpg'),
(45, 'Leicofay Ceramic Donut Vase Hollow 2 Pcs Cream Vases for Decoration Nordic Minimalism Style Decor for Wedding Dining Table Party Living Room Office Bedroom (L x W x Bottle Mouth 2.5cm)\r\n', 'About this item\r\nMinimalist Abstract Design - If the ordinary vase design doesn\'t attract you, you will be attracted to this white ceramic vase for living room decoration. The donut design gives the vase a modern feel, adding more romance and style to your home\r\nThis round white vase is handmade of clay, the frosted feeling adds a different feeling to the bohemian style. A white ceramic vase is suitable for pampas grass, dried flowers, reeds, and complements a variety of interior styles.\r\nTHE PERFECT MULTIPURPOSE GIFT - Two different sizes of pampas grass and white ceramic vases make the perfect decoration for any room. It can be placed in the dining room, living room, bedroom, office, kitchen, reading room and so on. It can also be a great gift for weddings, housewarmings and any special events.\r\nSIZE - You will receive 2 beautiful beige flower vases, the larger one is 9\" H x 8\" W and the shorter one is 7.25\" H x 7\" W. The neck opening is 2.5cm and maybe a little off as these are handmade vases.\r\nAfter-sales service: If you have any questions about these 2-piece white ceramic vases, do not hesitate to contact us, we are always ready to help you.', '31.99', '0.00', 400, '2021-08-24 12:00:00', '0.20', 'https://www.amazon.com/Leicofay-Ceramic-Minimalism-Wedding-Bedroom/dp/B09SGGJ3VF/ref=sr_1_9?qid=1659957488&rnid=1063278&s=kitchen-intl-ship&sr=1-9', 'Available', 'forthdecor.jpg'),
(46, 'Alpine Corporation Tiered Column Tabletop Fountain with 3 Candles Mini Indoor Waterfall Relaxing Water Feature 11\" Tall Brown\r\n', 'About this item\r\n3-Tier Fountain: Perfect for creating a calm and romantic atmosphere in any room of your choice, such as living room, bedroom, bathroom or office\r\nELEGANT ACCESSORIES: Featuring natural stone-like pillars and real river stones for a rustic charm that brings the beauty of nature into your interiors, creates a beautiful centerpiece for your dining table, coffee table or kitchen island\r\nRelaxed Moods: A jet of water erupts from each level, mimicking the soothing sounds of a small waterfall. Tea lights create a subtle and warm glow for a zen-like atmosphere to calm your mind\r\nEASY SETUP: Just plug into an outlet, fill the lower sink with water, and the internal pump will create a nice flow of water, no complex installation required\r\nPERFECT SIZE: Fountain measures 9\"L x 9\"W x 11\"H, the perfect size for any table or countertop in your home', '38.82', '0.35', 600, '2021-08-23 20:00:00', '800.00', 'https://www.amazon.com/-/de/dp/B002YKMPQ6/ref=d_rtpb_sp_comp_sccl_2_5/138-8208802-5693667?pd_rd_w=CIKzU&content-id=amzn1.sym.719ec0db-1a87-4ec0-bd91-b6471354f976&pf_rd_p=719ec0db-1a87-4ec0-bd91-b6471354f976&pf_rd_r=Z0MFVW2MTTNKVTP7KNDD&pd_rd_wg=SzfdE&pd_r', 'Available', 'fifthdecor.jpg'),
(47, 'Shelving Solution Wall Sconces, with Tealight Candle Holder Antique Bronze Style Metal Wall Art Decorations for Living Room, Bathroom, Dining Room and Office Set of 2\r\n', 'About this item\r\nANTIQUE Sconce: Add an eye-catching look to any room with this fabulous pair of sconce candle holders. Each light features an openwork silhouette and a cylindrical glass shade that allows you to place pillar candle or flameless LED light to increase brightness. Candle not included; Compatibility: 4.1 cm W column.\r\nEasy to Install: Lightweight and durable. There is a keyhole on the back, you can easily hang them on the wall. It is very easy to install this hanging wall sconce.\r\nStylish Decoration: A great gift for anyone who likes classic or modern decoration. These two metal candlesticks are a great decoration for a nice holiday gift for relatives and friends.\r\nINDOOR AND OUTDOOR APPLICATION These wall lights are an ideal choice whether you are looking to decorate a modern family home or decorate a farmhouse or barn room. If it\'s outside, make sure it\'s in a covered area.\r\nWide Application: This mesmerizing candle holder is made of metal and glass. It shows a variety of styles and perfect decoration for any room. Such as living room, bedroom, bathroom, dining room and entrance passage.', '28.98', '0.26', 888, '2022-08-11 12:00:00', '500.00', 'https://www.amazon.com/-/de/dp/B08P51DPYK/ref=pd_bxgy_img_sccl_2/138-8208802-5693667?pd_rd_w=wHYoV&content-id=amzn1.sym.7757a8b5-874e-4a67-9d85-54ed32f01737&pf_rd_p=7757a8b5-874e-4a67-9d85-54ed32f01737&pf_rd_r=WBV2APYQTFEBTCPH1NRW&pd_rd_wg=8cD61&pd_rd_r=6', 'Available', 'sixthdecor.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products_categories`
--

CREATE TABLE `products_categories` (
  `id` int(11) NOT NULL,
  `fk_products` int(11) DEFAULT NULL,
  `fk_categories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products_categories`
--

INSERT INTO `products_categories` (`id`, `fk_products`, `fk_categories`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 2),
(10, 11, 2),
(11, 12, 2),
(12, 13, 2),
(13, 14, 2),
(14, 15, 2),
(15, 16, 3),
(16, 17, 3),
(17, 18, 3),
(18, 19, 3),
(19, 20, 3),
(20, 21, 3),
(21, 22, 3),
(23, 23, 4),
(24, 24, 4),
(25, 25, 4),
(26, 26, 4),
(27, 27, 4),
(28, 28, 4),
(29, 29, 5),
(30, 30, 5),
(31, 31, 5),
(32, 32, 5),
(33, 33, 5),
(34, 34, 5),
(35, 35, 5),
(36, 36, 6),
(37, 37, 6),
(38, 38, 6),
(39, 39, 6),
(40, 40, 6),
(41, 41, 6),
(42, 42, 7),
(43, 43, 7),
(44, 44, 7),
(45, 45, 7),
(46, 46, 7),
(47, 47, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `review`
--

INSERT INTO `review` (`review_id`, `fk_product`, `fk_user`, `message`) VALUES
(1, 9, 1, 'good'),
(2, 9, 4, 'best'),
(3, 9, 1, 'great'),
(4, 10, 1, 'Thank you'),
(5, 10, 4, 'great book'),
(33, 3, 3, 'super'),
(36, 3, 3, 'thanksss'),
(37, 3, 3, 'thanksss'),
(38, 3, 3, 'thanksss');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL,
  `quantity` int(20) NOT NULL DEFAULT 1,
  `total` int(11) NOT NULL,
  `fk_products` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shoppingcart`
--

INSERT INTO `shoppingcart` (`id`, `quantity`, `total`, `fk_products`, `fk_user`, `create_at`) VALUES
(1, 2, 0, 9, 1, '2022-08-16 07:15:19'),
(2, 2, 0, 44, 1, '2022-08-16 07:17:43'),
(3, 5, 75, 5, 3, '2022-08-16 13:14:09'),
(4, 5, 75, 5, 3, '2022-08-16 13:16:30'),
(5, 2, 49, 4, 3, '2022-08-16 13:16:30'),
(6, 5, 75, 5, 3, '2022-08-16 13:17:19'),
(7, 2, 49, 4, 3, '2022-08-16 13:17:19'),
(8, 5, 75, 5, 3, '2022-08-16 13:22:09'),
(9, 2, 49, 4, 3, '2022-08-16 13:22:09'),
(10, 5, 75, 5, 3, '2022-08-16 13:22:23'),
(11, 5, 75, 5, 3, '2022-08-16 13:22:36'),
(12, 2, 49, 4, 3, '2022-08-16 13:22:36'),
(13, 5, 75, 5, 3, '2022-08-16 13:23:17'),
(14, 2, 49, 4, 3, '2022-08-16 13:23:17'),
(15, 5, 75, 5, 3, '2022-08-16 13:27:09'),
(16, 2, 49, 4, 3, '2022-08-16 13:27:09'),
(17, 5, 75, 5, 3, '2022-08-16 13:27:47'),
(18, 2, 49, 4, 3, '2022-08-16 13:27:47'),
(19, 5, 75, 5, 3, '2022-08-16 13:27:52'),
(20, 2, 49, 4, 3, '2022-08-16 13:27:52'),
(21, 5, 75, 5, 3, '2022-08-16 13:29:43'),
(22, 2, 49, 4, 3, '2022-08-16 13:29:43'),
(23, 5, 75, 5, 3, '2022-08-16 13:35:15'),
(24, 2, 49, 4, 3, '2022-08-16 13:35:15'),
(25, 1, 15, 5, 3, '2022-08-16 13:45:51'),
(26, 1, 25, 4, 3, '2022-08-16 13:45:51');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `status` enum('user','adm','ban') DEFAULT 'user',
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `date_of_birth`, `email`, `address`, `picture`, `status`, `phone_number`) VALUES
(1, 'mona', 'johne', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '0000-00-00', 'mona@gmail.com', 'test', 'picuser.png', 'user', '+4351468423'),
(2, 'mona', 'mona', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2008-05-27', 'mo@gmail.com', 'testtttt', 'picuser.png', 'adm', '215864864153'),
(3, 'Mona', 'Fahham', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-08-11', 'mona@yahoo.com', 'Scheugasse 4/11', '62f69f3172093.jpg', 'user', '067763086245'),
(4, 'Sara', 'Fahham', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-08-05', 'sara@gmail.com', 'Scheugasse 4/11', 'picuser.png', 'user', '067763086245');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products` (`fk_products`),
  ADD KEY `fk_categories` (`fk_categories`);

--
-- Indizes für die Tabelle `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `fk_product` (`fk_product`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indizes für die Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products` (`fk_products`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT für Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`fk_products`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`fk_categories`) REFERENCES `categories` (`id`);

--
-- Constraints der Tabelle `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`fk_products`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
