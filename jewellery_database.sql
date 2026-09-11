-- ============================================================
--  JEWELLERY STORE DATABASE
--  Database: jewellery
--  Host: localhost
--  Import via phpMyAdmin: Import tab -> Choose file -> Go
-- ============================================================

CREATE DATABASE IF NOT EXISTS `jewellery`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE `jewellery`;

-- ============================================================
--  TABLE 1: categories
-- ============================================================
CREATE TABLE IF NOT EXISTS `categories` (
    `category_id`   INT          NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(100) NOT NULL,
    `slug`          VARCHAR(100) NOT NULL UNIQUE,
    `description`   TEXT,
    `page_url`      VARCHAR(200),
    `created_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`name`, `slug`, `description`, `page_url`) VALUES
('Rings',        'rings',        'Solitaire, diamond, gold rings for every occasion.', 'rings.html'),
('Pendant',      'pendant',      'Gold and diamond pendants, lockets, and statement pieces.', 'pendant.html'),
('Mangalsutra',  'mangalsutra',  'Traditional and modern diamond mangalsutras.', 'mangalsutra.html'),
('Earring',      'earring',      'Studs, jhumkas, chandbalis, hoops, and drop earrings.', 'earring.html'),
('Chains',       'chains',       'Italian curb, rope, box, singapore gold chains.', 'chain.html'),
('Bracelets',    'bracelets',    'Gold and diamond bracelets and stacks.', 'jewellery.html'),
('Baju Band',    'baju-band',    'Traditional antique gold baju bands.', 'jewellery.html'),
('Necklace',     'necklace',     'Diamond collar necklaces and riviera sets.', 'jewellery.html');


-- ============================================================
--  TABLE 2: products
-- ============================================================
CREATE TABLE IF NOT EXISTS `products` (
    `product_id`      INT             NOT NULL AUTO_INCREMENT,
    `category_id`     INT             NOT NULL,
    `name`            VARCHAR(255)    NOT NULL,
    `slug`            VARCHAR(255)    NOT NULL UNIQUE,
    `description`     TEXT,
    `price`           DECIMAL(12, 2)  NOT NULL,
    `mrp`             DECIMAL(12, 2)  NOT NULL,
    `discount_pct`    TINYINT         NOT NULL DEFAULT 0,
    `gold_purity`     VARCHAR(50),
    `gold_weight_g`   DECIMAL(6, 2),
    `stone_details`   VARCHAR(255),
    `making_charges`  DECIMAL(10, 2),
    `gst_amount`      DECIMAL(10, 2),
    `total_price`     DECIMAL(12, 2),
    `hero_image`      VARCHAR(300),
    `detail_page_url` VARCHAR(300),
    `in_stock`        TINYINT(1)      NOT NULL DEFAULT 1,
    `is_trending`     TINYINT(1)      NOT NULL DEFAULT 0,
    `created_at`      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`product_id`),
    FOREIGN KEY (`category_id`) REFERENCES `categories`(`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- RINGS
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(1,'The Royale Solitaire Diamond Crown Ring','royale-solitaire-crown-ring','0.75 Ct solitaire in 6-prong crown setting 18KT yellow gold.',36500.00,52000.00,30,'18KT Yellow Gold',3.80,'0.75 Ct FG-VS1 Solitaire Diamond',4200.00,1785.00,61285.00,'.vscode/Screenshot 2026-07-27 124155.png','product-ring.html',1,1),
(1,'The Rebecca Minimal Gold Diamond Ring','rebecca-minimal-gold-ring','Stackable minimal solitaire everyday diamond ring.',7359.00,14146.00,48,'18KT Yellow Gold',1.20,'0.05 Ct Diamond',800.00,215.00,8374.00,'.vscode/Screenshot 2026-08-06 101909.png','inner.html',1,0);

-- PENDANTS
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(2,'The Floral Bloom 22KT Gold Diamond Pendant','floral-bloom-pendant','Intricate floral pendant with sparkling diamonds in 22KT gold.',16500.00,24000.00,31,'22KT Yellow Gold',2.40,'0.15 Ct GH-SI Diamonds',1220.00,480.00,16500.00,'.vscode/Screenshot 2026-07-28 114127.png','pendant-gold.html',1,1),
(2,'The Heritage Filigree Gold Statement Pendant','heritage-filigree-pendant','Heritage filigree gold pendant with natural ruby accents.',21800.00,31000.00,30,'22KT Yellow Gold',3.20,'Natural Ruby Cabochons',1965.00,635.00,21800.00,'.vscode/Screenshot 2026-07-28 114140.png','pendant-collection.html',1,1),
(2,'The Casting Geometric Teardrop Pendant','casting-teardrop-pendant','Precision cast teardrop pendant with 0.18 Ct diamonds.',19200.00,27500.00,30,'18KT Yellow Gold',2.80,'0.18 Ct Round Cut Diamonds',1540.00,560.00,19200.00,'.vscode/Screenshot 2026-07-28 114215.png','pendant-casting.html',1,0),
(2,'The Modern Infinity Dual-Tone Diamond Pendant','infinity-dual-tone-pendant','Sleek infinity pendant in dual rose and white gold.',14900.00,21000.00,29,'18KT Dual Rose & White Gold',2.10,'0.12 Ct EF-VVS Diamonds',1365.00,435.00,14900.00,'.vscode/Screenshot 2026-07-28 114205.png','pendant-newage.html',1,1),
(2,'The Peacock Motif Enamel & Ruby Gold Pendant','peacock-ruby-pendant','Peacock motif with meenakari enamel and natural ruby.',26500.00,38000.00,30,'22KT Yellow Gold',3.80,'Meenakari & Natural Ruby Cabochon',2228.00,772.00,26500.00,'.vscode/Screenshot 2026-07-28 114237.png','pendant-unique.html',1,1),
(2,'The Regal Vintage Photo Opening Gold Locket','vintage-photo-locket','Heirloom opening locket in 22KT solid gold.',34200.00,48000.00,29,'22KT Yellow Gold',5.10,'Vintage Intaglio Engraving',2903.00,997.00,34200.00,'.vscode/Screenshot 2026-07-28 114250.png','pendant-locket.html',1,0),
(2,'The Slender Radiant Solitaire Halo Pendant','slender-solitaire-halo-pendant','Slender profile with center solitaire and micro-halo setting.',18750.00,26500.00,29,'18KT Yellow Gold',2.50,'0.25 Ct Certified Solitaire & Halo',1504.00,546.00,18750.00,'.vscode/Screenshot 2026-07-28 114305.png','pendant-slender.html',1,0),
(2,'The Modern Sublime Oval Cluster Diamond Pendant','sublime-oval-cluster-pendant','Oval cluster pendant with 0.45 Ct total diamond weight.',29800.00,42000.00,29,'18KT White Gold',3.60,'0.45 Ct Multi-Cluster EF-VVS Diamonds',2732.00,868.00,29800.00,'.vscode/Screenshot 2026-07-28 114324.png','pendant-sublime.html',1,1);

-- MANGALSUTRA
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(3,'The Traditional Wati Classic 22KT Gold Mangalsutra','traditional-wati-mangalsutra','Classic double-strand wati mangalsutra in 22KT hallmarked gold.',38500.00,54000.00,29,'22KT Yellow Gold',6.20,'Hand-strung Black Onyx Beads',3880.00,1120.00,38500.00,'.vscode/Screenshot 2026-07-28 115726.png','mangalsutra-gold.html',1,1),
(3,'The Apsara Floral Diamond Tandav Mangalsutra','apsara-floral-mangalsutra','Contemporary floral diamond mangalsutra in 18KT gold.',45900.00,64000.00,28,'18KT Yellow Gold',5.50,'0.40 Ct EF-VVS Sparkling Diamonds',5263.00,1337.00,45900.00,'.vscode/Screenshot 2026-07-28 115739.png','mangalsutra-collection.html',1,1),
(3,'The Precision Cast Contemporary Diamond Mangalsutra','precision-cast-mangalsutra','Modern precision cast mangalsutra with 0.22 Ct diamonds.',32400.00,46000.00,30,'18KT Yellow Gold',4.20,'0.22 Ct Micro-Prong Diamonds',3656.00,944.00,32400.00,'.vscode/Screenshot 2026-07-28 115752.png','mangalsutra-casting.html',1,0),
(3,'The Minimalist Daily Wear Infinity Diamond Mangalsutra','minimalist-infinity-mangalsutra','Dainty infinity pendant mangalsutra for everyday elegance.',24600.00,35000.00,30,'18KT Rose Gold',3.40,'0.16 Ct EF-VVS Diamonds',2683.00,717.00,24600.00,'.vscode/Screenshot 2026-07-28 115805.png','mangalsutra-newage.html',1,1),
(3,'The Royal Navratna Antique Temple Mangalsutra','royal-navratna-mangalsutra','Grand temple-style with authentic Navratna 9 gemstones.',68500.00,95000.00,28,'22KT Antique Matte Gold',10.50,'Certified Navratna & Polki',5505.00,1995.00,68500.00,'.vscode/Screenshot 2026-07-28 115830.png','mangalsutra-unique.html',1,1),
(3,'The Grand Heritage Filigree Medallion Mangalsutra','heritage-filigree-medallion-mangalsutra','Heirloom filigree medallion with natural ruby center.',56200.00,78000.00,28,'22KT Yellow Gold',8.80,'Natural Center Ruby Accent',5363.00,1637.00,56200.00,'.vscode/Screenshot 2026-07-28 115843.png','mangalsutra-locket.html',1,0),
(3,'The Slender Solitaire Drop Diamond Mangalsutra','slender-solitaire-mangalsutra','Modern slender mangalsutra with 0.30 Ct certified solitaire drop.',29800.00,42000.00,29,'18KT Yellow Gold',3.80,'0.30 Ct Certified Solitaire Diamond',3132.00,868.00,29800.00,'.vscode/Screenshot 2026-07-28 115901.png','mangalsutra-slender.html',1,0),
(3,'The Modern Sublime Curved Chevron Diamond Mangalsutra','sublime-chevron-mangalsutra','Geometric chevron design with 0.35 Ct graduated diamonds.',41300.00,58000.00,29,'18KT Yellow Gold',4.80,'0.35 Ct Graduated Diamonds',5597.00,1203.00,41300.00,'.vscode/Screenshot 2026-07-28 115920.png','mangalsutra-sublime.html',1,1);

-- EARRINGS
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(4,'The Rebecca Minimalist Gold Diamond Stud Earrings','rebecca-minimalist-studs','Petite daily-wear diamond studs in 18KT gold.',12400.00,18000.00,31,'18KT Yellow Gold',1.80,'0.10 Ct Certified Diamonds',1239.00,361.00,12400.00,'.vscode/Screenshot 2026-07-28 111403.png','earring-minimal.html',1,1),
(4,'The Daily Grace Floral Cluster Gold Studs','daily-grace-floral-studs','7-diamond floral cluster studs for everyday elegance.',16800.00,24000.00,30,'22KT Yellow Gold',2.50,'0.18 Ct 7-Diamond Floral Cluster',1210.00,490.00,16800.00,'.vscode/Screenshot 2026-07-28 111415.png','earring-women.html',1,1),
(4,'The Grand Festive Chandbali Gold Drop Earrings','grand-chandbali-drop-earrings','Grand chandbali with Kundan polki and freshwater pearls.',46500.00,65000.00,28,'22KT Yellow Gold',7.50,'Kundan Polki & Basra Pearls',3845.00,1355.00,46500.00,'.vscode/Screenshot 2026-07-28 111427.png','earring-festive.html',1,1),
(4,'The Geometric Hexagon Diamond Huggie Hoops','hexagon-huggie-hoops','Modern hexagon huggie hoops with channel-set diamonds.',22900.00,32000.00,28,'18KT Rose Gold',3.20,'0.20 Ct Channel-Set Diamonds',2033.00,667.00,22900.00,'.vscode/Screenshot 2026-07-28 111440.png','earring-newage.html',1,0),
(4,'The Artisan Enamel & Emerald Peacock Earrings','artisan-peacock-earrings','Handcrafted peacock earrings with meenakari enamel and emeralds.',38700.00,54000.00,28,'22KT Yellow Gold',5.80,'Natural Emerald & Meenakari Enamel',3773.00,1127.00,38700.00,'.vscode/Screenshot 2026-07-28 111452.png','earring-unique.html',1,1),
(4,'The Royal Bridal 22KT Gold Jhumka Earrings','royal-bridal-jhumka','Grand bridal jhumka with ruby and pearl accents.',52000.00,74000.00,30,'22KT Yellow Gold',8.50,'Natural Ruby Studs & Pearls',4786.00,1514.00,52000.00,'.vscode/Screenshot 2026-07-28 111507.png','earring-bride.html',1,1),
(4,'The Slender Radiant Dangling Chain Earrings','slender-dangling-chain-earrings','Elegant dangling chain earrings with graduated diamonds.',27400.00,39000.00,30,'18KT Yellow Gold',3.80,'0.26 Ct Certified Diamonds',2802.00,798.00,27400.00,'.vscode/Screenshot 2026-07-28 111521.png','earring-slender.html',1,0),
(4,'The Modern Sublime Diamond Teardrop Earrings','sublime-teardrop-earrings','Statement teardrop earrings with pear and round brilliant diamonds.',35800.00,50000.00,28,'18KT White Gold',4.50,'0.42 Ct Certified Pear & Round Diamonds',3757.00,1043.00,35800.00,'.vscode/Screenshot 2026-07-28 111543.png','earring-sublime.html',1,1);

-- CHAINS
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(5,'The Classic Italian Curb 22KT Gold Chain','classic-italian-curb-chain','Diamond-cut Italian curb chain in pure 22KT gold.',28900.00,41000.00,30,'22KT Yellow Gold',4.80,'Diamond-Cut High Reflection Finish',2858.00,842.00,28900.00,'.vscode/Screenshot 2026-07-28 105438.png','chain-minimal.html',1,1),
(5,'The Elegant Delicate Cable Link Layering Chain','delicate-cable-layering-chain','Fine cable link chain perfect for layering in 18KT gold.',18500.00,26000.00,29,'18KT Yellow Gold',3.10,'Plain High-Polish Solid Links',2461.00,539.00,18500.00,'.vscode/Screenshot 2026-07-28 105336.png','chain-women.html',1,0),
(5,'The Royal Festive Rope Textured Gold Chain','festive-rope-chain','Heavy diamond-cut rope chain in 22KT gold for festive wear.',42700.00,60000.00,29,'22KT Yellow Gold',6.80,'Spiral Diamond-Cut Facets',5256.00,1244.00,42700.00,'.vscode/Screenshot 2026-07-28 105322.png','chain-festive.html',1,1),
(5,'The Modern Dual-Link Paperclip Gold Chain','modern-paperclip-chain','Trendy oversized paperclip chain in 18KT gold.',31200.00,44000.00,29,'18KT Yellow Gold',5.20,'High-Gloss Paperclip Links',4291.00,909.00,31200.00,'.vscode/Screenshot 2026-07-27 124603.png','chain-newage.html',1,1),
(5,'The Byzantine Heavy Intricate Gold Chain','byzantine-heavy-chain','Hand-woven Byzantine chain in heavy 22KT gold.',74500.00,105000.00,29,'22KT Yellow Gold',12.20,'Handmade Byzantine Woven Gold',8830.00,2170.00,74500.00,'.vscode/Screenshot 2026-07-28 105249.png','chain-unique.html',1,0),
(5,'The Heritage Temple Gold Bridal Choker Chain','heritage-bridal-choker-chain','Grand temple-carved gold bridal choker with rubies and emeralds.',89000.00,125000.00,29,'22KT Yellow Gold',14.50,'Certified Rubies, Emeralds & Pearls',8109.00,2591.00,89000.00,'.vscode/Screenshot 2026-07-28 105054.png','chain-bride.html',1,1),
(5,'The Slender Singapore Sparkle Gold Chain','singapore-sparkle-chain','Twinkle-twist Singapore chain in 22KT gold.',22600.00,32000.00,29,'22KT Yellow Gold',3.70,'Singapore Wave Reflection',2342.00,658.00,22600.00,'.vscode/Screenshot 2026-07-28 105021.png','chain-slender.html',1,0),
(5,'The Modern Sublime Box Link Heavy Gold Chain','sublime-box-link-chain','Geometric precision box link chain in 22KT gold.',48300.00,68000.00,29,'22KT Yellow Gold',7.80,'Mirror Precision Cut Links',6393.00,1407.00,48300.00,'.vscode/Screenshot 2026-07-28 105010.png','chain-sublime.html',1,1);

-- BRACELETS
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(6,'The Luxury Chic 4-Piece Gold Diamond Bracelet Stack','luxury-chic-bracelet-stack','4-piece stacking bracelet set in 18KT gold with diamonds.',58900.00,79000.00,25,'18KT Yellow Gold',8.20,'0.50 Ct Total Diamond Weight',5430.00,1720.00,58900.00,'.vscode/Screenshot 2026-07-27 124703.png','product-bracelet.html',1,1);

-- BAJU BAND
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(7,'The Temple Goddess Lakshmi Antique Gold Baju Band','temple-goddess-baju-band','Grand antique-finish temple baju band with Goddess Lakshmi carvings.',82400.00,110000.00,25,'22KT Antique Gold',13.50,'Rubies, Emeralds & Gold Carvings',7800.00,2400.00,82400.00,'.vscode/Screenshot 2026-07-27 124643.png','product-bajuband.html',1,1);

-- NECKLACES
INSERT INTO `products` (`category_id`,`name`,`slug`,`description`,`price`,`mrp`,`discount_pct`,`gold_purity`,`gold_weight_g`,`stone_details`,`making_charges`,`gst_amount`,`total_price`,`hero_image`,`detail_page_url`,`in_stock`,`is_trending`) VALUES
(8,'The Grand Riviera Diamond Collar Necklace','grand-riviera-collar-necklace','Riviera collar with 2.50 Ct graduated diamonds in 18KT white gold.',125000.00,175000.00,28,'18KT White Gold',16.50,'2.50 Ct EF-VVS Graduated Round Diamonds',14800.00,5289.00,181589.00,'.vscode/Screenshot 2026-07-27 124115.png','product-necklace.html',1,1),
(8,'The Celestial Circular Diamond Pendant Set','celestial-circular-pendant-set','Circular diamond pendant and earrings set in 18KT gold.',28500.00,39000.00,27,'18KT Yellow Gold',4.20,'0.30 Ct EF-VVS Diamonds',2700.00,830.00,28500.00,'.vscode/Screenshot 2026-07-27 124603.png','product-pendant-set.html',1,1),
(8,'The Empress Bespoke Art Deco Diamond Statement Piece','empress-art-deco-statement','Unique Art Deco inspired diamond statement jewellery.',145000.00,195000.00,26,'18KT White Gold',18.20,'3.50 Ct Art Deco Diamonds',18500.00,4200.00,145000.00,'.vscode/Screenshot 2026-07-27 124320.png','product-unique.html',1,1),
(8,'The Starlight Cascading Diamond Drop Earrings','starlight-diamond-drop-earrings','Cascading diamond drop earrings in 18KT gold.',48200.00,65000.00,26,'18KT Yellow Gold',6.80,'1.20 Ct Cascading Diamonds',4800.00,1400.00,48200.00,'.vscode/Screenshot 2026-07-27 124252.png','product-diamond-earrings.html',1,1);


-- ============================================================
--  TABLE 3: product_images
-- ============================================================
CREATE TABLE IF NOT EXISTS `product_images` (
    `image_id`    INT          NOT NULL AUTO_INCREMENT,
    `product_id`  INT          NOT NULL,
    `image_url`   VARCHAR(300) NOT NULL,
    `alt_text`    VARCHAR(200),
    `sort_order`  TINYINT      NOT NULL DEFAULT 0,
    PRIMARY KEY (`image_id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product_images` (`product_id`,`image_url`,`alt_text`,`sort_order`) VALUES
(1,'.vscode/Screenshot 2026-07-27 124155.png','Crown Ring Main View',0),
(1,'.vscode/Screenshot 2026-08-06 101909.png','Crown Ring Side View',1),
(1,'.vscode/Screenshot 2026-07-28 112705.png','Crown Ring Angle 3',2),
(1,'.vscode/Screenshot 2026-07-28 112740.png','Crown Ring Angle 4',3),
(3,'.vscode/Screenshot 2026-07-28 114127.png','Floral Bloom Pendant Main',0),
(3,'.vscode/Screenshot 2026-07-28 114140.png','Floral Bloom Pendant Side',1);


-- ============================================================
--  TABLE 4: customers
-- ============================================================
CREATE TABLE IF NOT EXISTS `customers` (
    `customer_id`   INT           NOT NULL AUTO_INCREMENT,
    `full_name`     VARCHAR(150)  NOT NULL,
    `email`         VARCHAR(200)  NOT NULL UNIQUE,
    `phone`         VARCHAR(15),
    `password_hash` VARCHAR(255)  NOT NULL,
    `address`       TEXT,
    `city`          VARCHAR(100),
    `state`         VARCHAR(100),
    `pincode`       VARCHAR(10),
    `created_at`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `customers` (`full_name`,`email`,`phone`,`password_hash`,`address`,`city`,`state`,`pincode`) VALUES
('Priya Sharma',  'priya.sharma@email.com', '9876543210', SHA2('priya@123',256),  'B-12, Malviya Nagar','Jaipur',    'Rajasthan',   '302017'),
('Anjali Mehta',  'anjali.mehta@email.com', '9765432109', SHA2('anjali@123',256), 'A-5, Lajpat Nagar',  'New Delhi', 'Delhi',       '110024'),
('Kavya Reddy',   'kavya.reddy@email.com',  '9654321098', SHA2('kavya@123',256),  '14, Banjara Hills',  'Hyderabad', 'Telangana',   '500034'),
('Sneha Patel',   'sneha.patel@email.com',  '9543210987', SHA2('sneha@123',256),  '22, CG Road',        'Ahmedabad', 'Gujarat',     '380009'),
('Ritu Agarwal',  'ritu.agarwal@email.com', '9432109876', SHA2('ritu@123',256),   '7, MG Road',         'Pune',      'Maharashtra', '411001');


-- ============================================================
--  TABLE 5: orders
-- ============================================================
CREATE TABLE IF NOT EXISTS `orders` (
    `order_id`        INT            NOT NULL AUTO_INCREMENT,
    `customer_id`     INT            NOT NULL,
    `order_date`      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `status`          ENUM('pending','confirmed','processing','shipped','delivered','cancelled','returned') NOT NULL DEFAULT 'pending',
    `total_amount`    DECIMAL(12,2)  NOT NULL,
    `shipping_name`   VARCHAR(150),
    `shipping_phone`  VARCHAR(15),
    `shipping_address`TEXT,
    `shipping_city`   VARCHAR(100),
    `shipping_state`  VARCHAR(100),
    `shipping_pincode`VARCHAR(10),
    `payment_method`  ENUM('cod','upi','card','netbanking','emi') NOT NULL DEFAULT 'cod',
    `payment_status`  ENUM('pending','paid','failed','refunded')  NOT NULL DEFAULT 'pending',
    `tracking_id`     VARCHAR(100),
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `orders` (`customer_id`,`status`,`total_amount`,`shipping_name`,`shipping_phone`,`shipping_address`,`shipping_city`,`shipping_state`,`shipping_pincode`,`payment_method`,`payment_status`,`tracking_id`) VALUES
(1,'delivered', 36500.00, 'Priya Sharma','9876543210','B-12, Malviya Nagar','Jaipur',    'Rajasthan',  '302017','upi',        'paid',   'TRK20261001001'),
(2,'shipped',  125000.00, 'Anjali Mehta','9765432109','A-5, Lajpat Nagar',  'New Delhi', 'Delhi',      '110024','card',       'paid',   'TRK20261001002'),
(3,'confirmed', 46500.00, 'Kavya Reddy', '9654321098','14, Banjara Hills',  'Hyderabad', 'Telangana',  '500034','upi',        'paid',   NULL),
(4,'processing',28900.00, 'Sneha Patel', '9543210987','22, CG Road',        'Ahmedabad', 'Gujarat',    '380009','netbanking', 'paid',   NULL),
(5,'pending',   16500.00, 'Ritu Agarwal','9432109876','7, MG Road',         'Pune',      'Maharashtra','411001','cod',        'pending',NULL);


-- ============================================================
--  TABLE 6: order_items
-- ============================================================
CREATE TABLE IF NOT EXISTS `order_items` (
    `item_id`      INT           NOT NULL AUTO_INCREMENT,
    `order_id`     INT           NOT NULL,
    `product_id`   INT           NOT NULL,
    `quantity`     TINYINT       NOT NULL DEFAULT 1,
    `unit_price`   DECIMAL(12,2) NOT NULL,
    `gold_tone`    VARCHAR(100),
    `size_option`  VARCHAR(100),
    PRIMARY KEY (`item_id`),
    FOREIGN KEY (`order_id`)   REFERENCES `orders`(`order_id`)    ON DELETE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `order_items` (`order_id`,`product_id`,`quantity`,`unit_price`,`gold_tone`,`size_option`) VALUES
(1,1, 1, 36500.00, '18KT Yellow Gold','Size 7 (17.3 mm)'),
(2,39,1,125000.00, '18KT White Gold', '18 Inches'),
(3,27,1, 46500.00, '22KT Yellow Gold','Medium 45mm Drop'),
(4,29,1, 28900.00, '22KT Yellow Gold','20 Inches'),
(5,3, 1, 16500.00, '22KT Yellow Gold','Standard Loop');


-- ============================================================
--  TABLE 7: wishlist
-- ============================================================
CREATE TABLE IF NOT EXISTS `wishlist` (
    `wishlist_id` INT       NOT NULL AUTO_INCREMENT,
    `customer_id` INT       NOT NULL,
    `product_id`  INT       NOT NULL,
    `added_at`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`wishlist_id`),
    UNIQUE KEY `uq_customer_product` (`customer_id`,`product_id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE,
    FOREIGN KEY (`product_id`)  REFERENCES `products`(`product_id`)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `wishlist` (`customer_id`,`product_id`) VALUES
(1,3),(1,5),(2,1),(2,39),(3,27),(4,11),(5,19);


-- ============================================================
--  TABLE 8: cart
-- ============================================================
CREATE TABLE IF NOT EXISTS `cart` (
    `cart_id`     INT           NOT NULL AUTO_INCREMENT,
    `customer_id` INT           NOT NULL,
    `product_id`  INT           NOT NULL,
    `quantity`    TINYINT       NOT NULL DEFAULT 1,
    `gold_tone`   VARCHAR(100),
    `size_option` VARCHAR(100),
    `added_at`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`cart_id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE,
    FOREIGN KEY (`product_id`)  REFERENCES `products`(`product_id`)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cart` (`customer_id`,`product_id`,`quantity`,`gold_tone`,`size_option`) VALUES
(1,5, 1,'18KT White Gold', '20 Inches'),
(2,11,1,'22KT Yellow Gold','24 Inches'),
(3,1, 1,'18KT Yellow Gold','Size 8 (18.1 mm)');


-- ============================================================
--  TABLE 9: reviews
-- ============================================================
CREATE TABLE IF NOT EXISTS `reviews` (
    `review_id`   INT        NOT NULL AUTO_INCREMENT,
    `product_id`  INT        NOT NULL,
    `customer_id` INT        NOT NULL,
    `rating`      TINYINT    NOT NULL CHECK (`rating` BETWEEN 1 AND 5),
    `title`       VARCHAR(200),
    `body`        TEXT,
    `is_verified` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`review_id`),
    FOREIGN KEY (`product_id`)  REFERENCES `products`(`product_id`)   ON DELETE CASCADE,
    FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `reviews` (`product_id`,`customer_id`,`rating`,`title`,`body`,`is_verified`) VALUES
(1, 1,5,'Absolutely Stunning!',   'The crown ring is exactly as pictured. The solitaire sparkles brilliantly. Worth every rupee!',1),
(39,2,5,'A Dream Come True',      'The necklace arrived in a beautiful velvet box. The diamonds are breathtaking.',1),
(27,3,4,'Great Quality Chandbali','Loved the chandbali design. Very well crafted. Perfect for festive occasions.',1),
(3, 5,5,'Perfect Gift for Mom',   'Ordered the floral pendant for my mom. She loves it!',1),
(11,4,4,'Traditional Beauty',     'The mangalsutra is traditionally crafted. Gold quality is excellent.',1);


-- ============================================================
--  TABLE 10: coupons
-- ============================================================
CREATE TABLE IF NOT EXISTS `coupons` (
    `coupon_id`     INT            NOT NULL AUTO_INCREMENT,
    `code`          VARCHAR(50)    NOT NULL UNIQUE,
    `description`   VARCHAR(255),
    `discount_type` ENUM('flat','percent') NOT NULL DEFAULT 'percent',
    `discount_value`DECIMAL(10,2)  NOT NULL,
    `min_order_amt` DECIMAL(10,2)  NOT NULL DEFAULT 0,
    `max_uses`      INT            NOT NULL DEFAULT 100,
    `used_count`    INT            NOT NULL DEFAULT 0,
    `valid_from`    DATE           NOT NULL,
    `valid_to`      DATE           NOT NULL,
    `is_active`     TINYINT(1)     NOT NULL DEFAULT 1,
    PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `coupons` (`code`,`description`,`discount_type`,`discount_value`,`min_order_amt`,`max_uses`,`valid_from`,`valid_to`) VALUES
('WELCOME10', 'Welcome: 10% off on first order',              'percent',10.00, 5000.00,  500,'2026-01-01','2026-12-31'),
('FLAT2000',  'Flat Rs.2000 off on orders above Rs.25000',    'flat',  2000.00,25000.00, 200,'2026-09-01','2026-09-30'),
('FESTIVE15', 'Festive Season: 15% off on all jewellery',     'percent',15.00,10000.00,  300,'2026-10-01','2026-10-31'),
('BRIDAL20',  'Bridal: 20% off on orders above Rs.50000',     'percent',20.00,50000.00,  100,'2026-09-01','2026-12-31'),
('NEWUSER5',  'New user signup: 5% extra off',                 'percent', 5.00, 2000.00, 1000,'2026-01-01','2026-12-31');


-- ============================================================
--  TABLE 11: newsletter_subscribers
-- ============================================================
CREATE TABLE IF NOT EXISTS `newsletter_subscribers` (
    `sub_id`        INT          NOT NULL AUTO_INCREMENT,
    `email`         VARCHAR(200) NOT NULL UNIQUE,
    `subscribed_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `is_active`     TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `newsletter_subscribers` (`email`) VALUES
('priya.sharma@email.com'),
('anjali.mehta@email.com'),
('kavya.reddy@email.com'),
('jewellery.lover@gmail.com'),
('bridal.fashion@yahoo.com');


-- ============================================================
--  VIEWS
-- ============================================================

CREATE OR REPLACE VIEW `v_trending_products` AS
SELECT p.product_id, c.name AS category_name, p.name AS product_name,
       p.price, p.mrp, p.discount_pct, p.hero_image, p.detail_page_url
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.is_trending = 1 AND p.in_stock = 1
ORDER BY p.category_id, p.price;

CREATE OR REPLACE VIEW `v_order_summary` AS
SELECT o.order_id, cu.full_name AS customer_name, cu.email,
       o.order_date, o.status, o.total_amount, o.payment_method, o.payment_status
FROM orders o
JOIN customers cu ON o.customer_id = cu.customer_id
ORDER BY o.order_date DESC;

CREATE OR REPLACE VIEW `v_product_ratings` AS
SELECT p.product_id, p.name AS product_name,
       COUNT(r.review_id) AS total_reviews,
       ROUND(AVG(r.rating),1) AS avg_rating
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.name;

-- ============================================================
--  VERIFICATION
-- ============================================================
SELECT 'DATABASE jewellery CREATED SUCCESSFULLY!' AS status;
SHOW TABLES;
SELECT COUNT(*) AS total_products   FROM products;
SELECT COUNT(*) AS total_customers  FROM customers;
SELECT COUNT(*) AS total_orders     FROM orders;
