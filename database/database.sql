-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 07, 2025 at 01:23 AM
-- Server version: 9.3.0
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `service_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Accepted','In Progress','Completed','Cancelled') DEFAULT 'Accepted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `user_id`, `name`, `email`, `phone`, `service_id`, `staff_id`, `appointment_date`, `appointment_time`, `status`, `created_at`) VALUES
(1, 6, 'Customer One', 'customer1@example.com', '0712000001', 1, 3, '2024-10-10', '10:00:00', 'Accepted', '2025-05-07 01:18:08'),
(2, 7, 'Customer Two', 'customer2@example.com', '0712000002', 8, 4, '2024-10-12', '14:00:00', 'Accepted', '2025-05-07 01:18:08'),
(3, 8, 'Customer Three', 'customer3@example.com', '0712000003', 29, 5, '2024-10-15', '16:00:00', 'Accepted', '2025-05-07 01:18:08'),
(4, 6, 'Customer One', 'customer1@example.com', '0712000001', 7, 3, '2024-10-18', '11:00:00', 'Accepted', '2025-05-07 01:18:08'),
(5, 7, 'Customer Two', 'customer2@example.com', '0712000002', 10, 4, '2024-10-22', '13:00:00', 'Cancelled', '2025-05-07 01:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `content`, `image`, `post_date`, `category`, `tags`) VALUES
(1, 'The Ultimate Guide to Hair Straighteners: Choosing the Best for Your Hair', 'In this article, we explore the best hair straighteners on the market, how to choose one based on your hair type, and some expert tips on how to use them effectively without causing damage.', 'images/blog/1.jpg', '2023-09-15', 'Hair Straightener', 'hair care,heat styling,tips'),
(2, 'Top 5 Hair Dryer Mistakes You Should Avoid', 'Hair dryers are essential for daily grooming, but are you using them correctly? This article discusses the common mistakes people make when using hair dryers and how to avoid damaging your hair.', 'images/blog/2.jpg', '2023-09-20', 'Hair Dryer', 'hair care,blow-drying,tips'),
(3, 'Beard Grooming 101: Maintaining a Healthy Beard', 'Whether you are growing a short beard or a long, majestic one, maintaining it is essential. This article outlines the best beard grooming techniques, products you should use, and trimming tips.', 'images/blog/3.jpg', '2023-09-25', 'Beard Trimmer', 'beard care,trimming,tips'),
(4, 'Hair Wax vs Gel: Which is Best for Styling Your Hair?', 'Are you confused about whether to use wax or gel for styling your hair? In this article, we compare the two, including their benefits and which hair types they work best for.', 'images/blog/4.jpg', '2023-10-01', 'Hair Wax', 'styling,products,hair wax,gel');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `blog_id` int NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `blog_id`, `author`, `email`, `content`, `created_at`) VALUES
(1, 1, 'Alice Johnson', 'alice@hiruna.dev', 'This guide was super helpful! I finally found the right straightener for my hair.', '2025-05-07 01:18:09'),
(2, 1, 'Emily Brown', 'emily@hiruna.dev', 'Great tips! Thanks for explaining how to avoid heat damage.', '2025-05-07 01:18:09'),
(3, 2, 'Chris Evans', 'chris@hiruna.dev', 'I never realized I was making so many mistakes with my hair dryer. Thanks for the info!', '2025-05-07 01:18:09'),
(4, 2, 'Sophia Miller', 'sophia@hiruna.dev', 'This was exactly what I needed to read. My hair is much healthier now.', '2025-05-07 01:18:09'),
(5, 3, 'Mark Wilson', 'mark@hiruna.dev', 'Great advice! I’ve been struggling to find the right products for my beard.', '2025-05-07 01:18:09'),
(6, 3, 'Jake Davis', 'jake@hiruna.dev', 'Very informative. I’m trying the trimming tips this weekend.', '2025-05-07 01:18:09'),
(7, 4, 'Laura Green', 'laura@hiruna.dev', 'I’ve always wondered about the differences between these two. Thanks for clearing that up!', '2025-05-07 01:18:09'),
(8, 4, 'Michael Adams', 'michael@hiruna.dev', 'I used wax for the first time after reading this and it works great for my hair.', '2025-05-07 01:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `category`, `file_path`) VALUES
(1, 'Classic Hair Style 1', 'hair styles', 'images/gallery/1.jpg'),
(2, 'Makeup Look 1', 'makeup', 'images/gallery/2.jpg'),
(3, 'Classic Hair Style 2', 'hair styles', 'images/gallery/3.jpg'),
(4, 'Nail Art Design 1', 'nail art', 'images/gallery/4.jpg'),
(5, 'Classic Hair Style 3', 'hair styles', 'images/gallery/5.jpg'),
(6, 'Makeup Look 2', 'makeup', 'images/gallery/6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int NOT NULL,
  `email` varchar(225) NOT NULL,
  `subscribed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_method` enum('online_payment','cod') NOT NULL DEFAULT 'online_payment',
  `status` enum('unpaid','pending','paid','packed','shipped','delivered','cancelled') DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `first_name`, `last_name`, `email`, `telephone`, `address`, `city`, `postal_code`, `country`, `total`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'Customer', 'One', 'customer1@example.com', '0712000001', '123 Main Street', 'Colombo', '00100', 'Sri Lanka', 5760.00, 'online_payment', 'paid', '2025-05-07 01:18:09', '2025-05-07 01:18:09'),
(2, 7, 'Customer', 'Two', 'customer2@example.com', '0712000002', '456 Elm Street', 'Kandy', '20000', 'Sri Lanka', 12800.00, 'online_payment', 'packed', '2025-05-07 01:18:09', '2025-05-07 01:18:09'),
(3, 8, 'Customer', 'Three', 'customer3@example.com', '0712000003', '789 Pine Avenue', 'Galle', '80000', 'Sri Lanka', 16000.00, 'online_payment', 'shipped', '2025-05-07 01:18:09', '2025-05-07 01:18:09'),
(4, 6, 'Customer', 'One', 'customer1@example.com', '0712000001', '123 Main Street', 'Colombo', '00100', 'Sri Lanka', 22400.00, 'online_payment', 'delivered', '2025-05-07 01:18:09', '2025-05-07 01:18:09'),
(5, 7, 'Customer', 'Two', 'customer2@example.com', '0712000002', '456 Elm Street', 'Kandy', '20000', 'Sri Lanka', 20800.00, 'online_payment', 'cancelled', '2025-05-07 01:18:09', '2025-05-07 01:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS ((`quantity` * `price`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES
(1, 1, 15, 'Hair Gel', 1, 5760.00),
(2, 2, 2, 'Beard Trimmer', 1, 12800.00),
(3, 3, 1, 'Hair Shampoo', 1, 16000.00),
(4, 4, 3, 'Hair Straightener', 1, 22400.00),
(5, 5, 4, 'Hair Dryer', 1, 20800.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `stock_status` enum('in_stock','out_of_stock') DEFAULT 'in_stock',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `category`, `price`, `image_url`, `stock_status`, `created_at`, `updated_at`) VALUES
(1, 'Hair Shampoo', 'A nourishing shampoo for all hair types.', 'Hair Care', 16000.00, 'images/shop/1.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(2, 'Beard Trimmer', 'Precision beard trimmer for all styles.', 'Beard Care', 12800.00, 'images/shop/2.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(3, 'Hair Straightener', 'High-quality hair straightener with ceramic plates.', 'Hair Tools', 22400.00, 'images/shop/3.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(4, 'Hair Dryer', 'Powerful hair dryer for fast drying.', 'Hair Tools', 20800.00, 'images/shop/4.jpg', 'out_of_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(5, 'Hair Spray', 'Volumizing hair spray with extra hold.', 'Hair Care', 9600.00, 'images/shop/5.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(6, 'Beard Wax', 'Beard wax to style and shape facial hair.', 'Beard Care', 6400.00, 'images/shop/6.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(7, 'Hair Serum', 'Shine-enhancing serum for smooth hair.', 'Hair Care', 14400.00, 'images/shop/7.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(8, 'Hair Mask', 'Deep conditioning hair mask for damaged hair.', 'Hair Care', 11200.00, 'images/shop/8.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(9, 'Beard Oil', 'Nourishing beard oil to soften and condition.', 'Beard Care', 8000.00, 'images/shop/9.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(10, 'Hair Shining Oil', 'Adds shine and smoothness to hair.', 'Hair Care', 12800.00, 'images/shop/10.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(11, 'Electric Shaver', 'High-performance electric shaver for clean cuts.', 'Beard Tools', 27200.00, 'images/shop/11.jpg', 'out_of_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(12, 'Hair Mousse', 'Lightweight mousse for volume and texture.', 'Hair Care', 8960.00, 'images/shop/12.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(13, 'Beard Comb', 'Wooden comb designed specifically for beards.', 'Beard Tools', 4800.00, 'images/shop/13.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(14, 'Hair Clippers', 'Professional hair clippers for salon-quality cuts.', 'Hair Tools', 28800.00, 'images/shop/14.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(15, 'Hair Gel', 'Strong hold hair gel for all-day control.', 'Hair Care', 5760.00, 'images/shop/15.jpg', 'in_stock', '2025-05-07 01:18:08', '2025-05-07 01:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `member_price` decimal(10,2) NOT NULL,
  `duration` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `name`, `category`, `description`, `price`, `member_price`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Classic Haircut', 'Haircuts', 'A traditional haircut that suits any style, done by our expert stylists.', 2500.00, 2300.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(2, 'Layered Haircut', 'Haircuts', 'Add texture and volume with a layered cut, perfect for all hair lengths.', 3500.00, 3200.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(3, 'Pixie Cut', 'Haircuts', 'A chic and stylish short cut, perfect for a modern look.', 3000.00, 2800.00, 40, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(4, 'Bob Cut', 'Haircuts', 'The classic bob cut, ideal for a sleek and sophisticated style.', 3200.00, 3000.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(5, 'Fringe Trim', 'Haircuts', 'A quick and simple trim for your bangs or fringe.', 1500.00, 1300.00, 15, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(6, 'Men’s Haircut', 'Haircuts', 'A clean and sharp men’s cut for a modern look.', 2200.00, 2000.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(7, 'Kid’s Haircut', 'Haircuts', 'A fun and stylish haircut for children.', 1800.00, 1600.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(8, 'Blowout', 'Styling', 'A professional blowout for smooth and voluminous hair.', 2000.00, 1800.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(9, 'Updo Hairstyling', 'Styling', 'Perfect for special occasions, get your hair styled into a classic updo.', 4500.00, 4200.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(10, 'Beach Waves', 'Styling', 'Soft, loose waves for a natural, effortless look.', 3500.00, 3300.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(11, 'Braiding', 'Styling', 'Intricate braids for a polished and elegant look.', 4000.00, 3800.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(12, 'Straightening', 'Styling', 'Professional hair straightening for a sleek, smooth finish.', 6000.00, 5700.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(13, 'Curls and Waves', 'Styling', 'Beautiful curls or waves for a voluminous hairstyle.', 3000.00, 2800.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(14, 'Flat Iron Styling', 'Styling', 'Flat iron styling for a smooth and sleek look.', 2800.00, 2600.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(15, 'Keratin Treatment', 'Treatments', 'A deep conditioning treatment to smooth and strengthen your hair.', 12000.00, 11000.00, 120, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(16, 'Hot Oil Treatment', 'Treatments', 'Nourish and revitalize dry or damaged hair with our hot oil treatment.', 4000.00, 3800.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(17, 'Scalp Treatment', 'Treatments', 'A soothing treatment to cleanse and rejuvenate your scalp.', 3000.00, 2800.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(18, 'Deep Conditioning', 'Treatments', 'Intensive treatment to restore moisture and shine to your hair.', 5000.00, 4700.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(19, 'Olaplex Treatment', 'Treatments', 'Rebuild broken hair bonds with an Olaplex treatment.', 6500.00, 6000.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(20, 'Protein Hair Mask', 'Treatments', 'A protein-rich mask to strengthen weak and damaged hair.', 5500.00, 5300.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(21, 'Moisturizing Hair Treatment', 'Treatments', 'Restore moisture to dry and brittle hair with this intensive treatment.', 5000.00, 4800.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(22, 'Full Hair Coloring', 'Hair Coloring', 'Transform your look with a full head of vibrant color.', 7000.00, 6700.00, 90, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(23, 'Highlights', 'Hair Coloring', 'Add dimension and brightness with strategically placed highlights.', 9000.00, 8500.00, 120, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(24, 'Balayage', 'Hair Coloring', 'A freehand technique to create natural, sun-kissed highlights.', 12000.00, 11500.00, 150, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(25, 'Root Touch-Up', 'Hair Coloring', 'Refresh your look with a root touch-up to cover regrowth.', 4000.00, 3800.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(26, 'Ombre Coloring', 'Hair Coloring', 'A beautiful gradient from darker roots to lighter ends.', 8500.00, 8000.00, 120, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(27, 'Partial Highlights', 'Hair Coloring', 'Strategically placed highlights for a more subtle look.', 7000.00, 6700.00, 90, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(28, 'Toner Application', 'Hair Coloring', 'A toner to neutralize brassiness and enhance your color.', 2500.00, 2300.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(29, 'Full Makeup Application', 'Makeup', 'A complete makeup look for any occasion, using high-quality products.', 6000.00, 5700.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(30, 'Bridal Makeup', 'Makeup', 'Specialized bridal makeup to make you glow on your big day.', 15000.00, 14500.00, 120, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(31, 'Party Makeup', 'Makeup', 'Fun and glamorous makeup for any celebration.', 5000.00, 4800.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(32, 'Natural Makeup Look', 'Makeup', 'A subtle and natural makeup look for daytime events.', 4000.00, 3800.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(33, 'Smoky Eye Makeup', 'Makeup', 'Bold and dramatic smoky eyes for a glamorous look.', 5000.00, 4700.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(34, 'Airbrush Makeup', 'Makeup', 'Flawless airbrush makeup for a smooth, camera-ready finish.', 7000.00, 6700.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(35, 'Glam Makeup', 'Makeup', 'High-glamour makeup with bold colors and contouring.', 6000.00, 5800.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(36, 'Basic Manicure', 'Nails', 'A simple manicure for clean and polished nails.', 2000.00, 1800.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(37, 'Basic Pedicure', 'Nails', 'A refreshing pedicure to clean and beautify your feet.', 2500.00, 2200.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(38, 'Gel Manicure', 'Nails', 'Long-lasting gel polish with a high-shine finish.', 4000.00, 3700.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(39, 'Acrylic Nail Extensions', 'Nails', 'Enhance your nails with acrylic extensions and your choice of color.', 5000.00, 4700.00, 90, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(40, 'Spa Pedicure', 'Nails', 'A luxurious pedicure with exfoliation and massage.', 3500.00, 3200.00, 75, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(41, 'Nail Art', 'Nails', 'Custom nail art designs for a unique and personalized look.', 3000.00, 2800.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(42, 'French Manicure', 'Nails', 'A classic French manicure with a pink base and white tips.', 3500.00, 3300.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(43, 'Eyebrow Threading', 'Waxing & Threading', 'Shape and define your eyebrows with precision threading.', 1500.00, 1300.00, 20, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(44, 'Full Face Threading', 'Waxing & Threading', 'Remove unwanted facial hair with gentle threading.', 3500.00, 3200.00, 40, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(45, 'Underarm Waxing', 'Waxing & Threading', 'Smooth and hair-free underarms with gentle waxing.', 2000.00, 1800.00, 30, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(46, 'Full Leg Waxing', 'Waxing & Threading', 'Get silky smooth legs with full-leg waxing.', 4500.00, 4200.00, 60, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(47, 'Bikini Waxing', 'Waxing & Threading', 'Gentle bikini waxing for clean and smooth results.', 4000.00, 3700.00, 45, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(48, 'Full Body Waxing', 'Waxing & Threading', 'Comprehensive waxing for the entire body.', 10000.00, 9500.00, 120, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(49, 'Upper Lip Waxing', 'Waxing & Threading', 'Quick and easy waxing for upper lip hair removal.', 1000.00, 800.00, 15, '2025-05-07 01:18:08', '2025-05-07 01:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `role` enum('user','admin','staff') DEFAULT 'user',
  `specialization` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `telephone`, `fax`, `address`, `city`, `country`, `postal_code`, `role`, `specialization`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'User1', 'admin1@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0711000001', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(2, 'Admin', 'User2', 'admin2@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0711000002', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(3, 'Staff', 'One', 'staff1@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0711234567', NULL, NULL, NULL, NULL, NULL, 'staff', 'Barber', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(4, 'Staff', 'Two', 'staff2@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0717654321', NULL, NULL, NULL, NULL, NULL, 'staff', 'Hair Stylist', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(5, 'Staff', 'Three', 'staff3@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0719876543', NULL, NULL, NULL, NULL, NULL, 'staff', 'Makeup Artist', '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(6, 'Customer', 'One', 'customer1@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0712000001', NULL, NULL, NULL, NULL, NULL, 'user', NULL, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(7, 'Customer', 'Two', 'customer2@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0712000002', NULL, NULL, NULL, NULL, NULL, 'user', NULL, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(8, 'Customer', 'Three', 'customer3@example.com', '$2y$10$eImiTXuWVxfM37uY4JANjQ==', '0712000003', NULL, NULL, NULL, NULL, NULL, 'user', NULL, '2025-05-07 01:18:08', '2025-05-07 01:18:08'),
(9, 'Rejie', 'Gardonia', 'gardonia10@gmail.com', '$2y$10$moBiln1qU05pQpyob5IJH.S4gPHwQsRFwoMbfQig4NsLSSRZXQQbG', '09158851510', NULL, NULL, NULL, NULL, NULL, 'user', NULL, '2025-05-07 01:19:00', '2025-05-07 01:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_otp`
--

CREATE TABLE `user_otp` (
  `user_otp_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `otp_code` int NOT NULL,
  `otp_expiry` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_otp`
--
ALTER TABLE `user_otp`
  ADD PRIMARY KEY (`user_otp_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_otp`
--
ALTER TABLE `user_otp`
  MODIFY `user_otp_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
