-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 03, 2024 lúc 07:26 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `exercise03`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` binary(16) NOT NULL,
  `attribute_id` binary(16) DEFAULT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` binary(16) NOT NULL,
  `customer_id` binary(16) DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `staff_account_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `product_id`, `quantity`, `staff_account_id`) VALUES
(0x00c3ae825b7f4f188330528d843bf80f, NULL, 0x546a50da70ee4a8689bcb2040ff28684, 4, 0x89a4ad6f4c6b41de9cf46df10821e453),
(0x1454389d44574139838eb067b36af7c5, NULL, 0x59366e2f426b44a181c1ed2c322c7cf0, 5, 0xc649362609fb43a0867d6fb5a453a440),
(0x270ca98452384cb28cef9d6e85439373, NULL, 0x34c393a10dae46ee92322dc97c9f4641, 2, 0x933bcb07264c4029b38a223ea243ffbe),
(0xc48d50978ecd4d959fba53e562e9f47c, NULL, 0x2aed84b3b21b4dfebda18070c40b9951, 2, 0x89a4ad6f4c6b41de9cf46df10821e453),
(0xc7e0c2a86907413a85975746e70bdf46, NULL, 0xf82c06740b5241d197347b7e335e5bcb, 2, 0xc649362609fb43a0867d6fb5a453a440),
(0xc93aa21426674fc7a56ef926c3abc710, NULL, 0xe4e456021afd4285a749bbf198394c23, 2, 0xc649362609fb43a0867d6fb5a453a440);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_categories`
--

CREATE TABLE `cart_categories` (
  `cart_id` binary(16) NOT NULL,
  `category_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` binary(16) NOT NULL,
  `cart_id` binary(16) DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_tags`
--

CREATE TABLE `cart_tags` (
  `cart_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `parent_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `active`, `category_description`, `category_name`, `icon`, `image_path`, `parent_id`) VALUES
(0x6badf9c7fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Clothes', 'Clothes', NULL, NULL, NULL),
(0x6badfe78fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Footwear', 'Footwear', NULL, NULL, NULL),
(0x6badff61fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Jewelry', 'Jewelry', NULL, NULL, NULL),
(0x6badffeafb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Perfume', 'Perfume', NULL, NULL, NULL),
(0x6bae0068fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Cosmetics', 'Cosmetics', NULL, NULL, NULL),
(0x6bae011efb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Glasses', 'Glasses', NULL, NULL, NULL),
(0x6bae0198fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Bags', 'Bags', NULL, NULL, NULL),
(0x6bae021cfb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Shirt', 'Shirt', NULL, NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae0293fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'shorts & jeans', 'shorts & jeans', NULL, NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae0314fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'jacket', 'jacket', NULL, NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae0390fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'dress & frock', 'dress & frock', NULL, NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae044dfb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Sports', 'Sports', NULL, NULL, 0x6badfe78fb2011eebd53edc308de43b3),
(0x6bae04c3fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Formal', 'Formal', NULL, NULL, 0x6badfe78fb2011eebd53edc308de43b3),
(0x6bae053efb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Casual', 'Casual', NULL, NULL, 0x6badfe78fb2011eebd53edc308de43b3),
(0x6bae0613fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Safety Shoes', 'Safety Shoes', NULL, NULL, 0x6badfe78fb2011eebd53edc308de43b3),
(0x6bae067ffb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Earrings', 'Earrings', NULL, NULL, 0x6badff61fb2011eebd53edc308de43b3),
(0x6bae06e4fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Couple Rings', 'Couple Rings', NULL, NULL, 0x6badff61fb2011eebd53edc308de43b3),
(0x6bae0805fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Necklace', 'Necklace', NULL, NULL, 0x6badff61fb2011eebd53edc308de43b3),
(0x6bae0886fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Clothes Perfume', 'Clothes Perfume', NULL, NULL, 0x6badffeafb2011eebd53edc308de43b3),
(0x6bae0905fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Deodorant', 'Deodorant', NULL, NULL, 0x6badffeafb2011eebd53edc308de43b3),
(0x6bae09c5fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'jacket', 'jacket', NULL, NULL, 0x6badffeafb2011eebd53edc308de43b3),
(0x6bae0a43fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'dress & frock', 'dress & frock', NULL, NULL, 0x6badffeafb2011eebd53edc308de43b3),
(0x6bae0b99fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Shampoo', 'Shampoo', NULL, NULL, 0x6bae0068fb2011eebd53edc308de43b3),
(0x6bae0beefb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Sunscreen', 'Sunscreen', NULL, NULL, 0x6bae0068fb2011eebd53edc308de43b3),
(0x6bae0c39fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Body Wash', 'Body Wash', NULL, NULL, 0x6bae0068fb2011eebd53edc308de43b3),
(0x6bae0c86fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Makeup Kit', 'Makeup Kit', NULL, NULL, 0x6bae0068fb2011eebd53edc308de43b3),
(0x6bae0f2afb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Sunglasses', 'Sunglasses', NULL, NULL, 0x6bae011efb2011eebd53edc308de43b3),
(0x6bae0fcbfb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Lenses', 'Lenses', NULL, NULL, 0x6bae011efb2011eebd53edc308de43b3),
(0x6bae1067fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Shopping Bag', 'Shopping Bag', NULL, NULL, 0x6bae0198fb2011eebd53edc308de43b3),
(0x6bae10edfb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Gym Backpack', 'Gym Backpack', NULL, NULL, 0x6bae0198fb2011eebd53edc308de43b3),
(0x6bae1154fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Purse', 'Purse', NULL, NULL, 0x6bae0198fb2011eebd53edc308de43b3),
(0x6bae11b2fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Wallet', 'Wallet', NULL, NULL, 0x6bae0198fb2011eebd53edc308de43b3),
(0x6bae1204fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'party wear', 'party wear', 'party wear', NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae1258fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'watches', 'watches', 'watches', NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae12a8fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'skirt', 'skirt', 'skirt', NULL, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x6bae1301fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'Belt', 'Belt', 'Belt', NULL, 0x6bae0886fb2011eebd53edc308de43b3),
(0x6bae1353fb2011eebd53edc308de43b3, NULL, NULL, NULL, 'boots', 'boots', 'boots', NULL, 0x6badfe78fb2011eebd53edc308de43b3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL,
  `iso` varchar(2) NOT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `num_code` smallint(6) DEFAULT NULL,
  `phone_code` int(11) NOT NULL,
  `upper_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `coupon_end_date` date DEFAULT NULL,
  `coupon_start_date` date DEFAULT NULL,
  `discount_type` varchar(50) DEFAULT NULL,
  `discount_value` decimal(10,0) DEFAULT NULL,
  `max_usage` int(11) DEFAULT NULL,
  `times_used` int(11) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `registered_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `customer_id` binary(16) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `galleries`
--

CREATE TABLE `galleries` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `galleries`
--

INSERT INTO `galleries` (`id`, `created_at`, `updated_at`, `image_path`, `product_id`) VALUES
(0x0e16e9f1bc084c2995338c25b00b0698, '2024-04-16 11:16:56.383859', NULL, '189ba2df4-1c0f-441e-a538-725079c4131d.jpg', 0x794e9e23856f4689b446ae3b9f4b5075),
(0x0e1c27ade33243bf84e8701b1750f167, '2024-04-16 11:16:56.378855', NULL, '091da64c9-8a7c-4164-a896-66d4ce7bba23.jpg', 0x794e9e23856f4689b446ae3b9f4b5075),
(0x148c6297d2ca45ab93eee7459cdb056e, '2024-04-16 11:18:01.433595', NULL, '0e7094a52-9755-4cce-9e48-a6fad5c188f1.jpg', 0xf82c06740b5241d197347b7e335e5bcb),
(0x14d527f3dda649fcbb719c1f9f31647a, '2024-04-16 11:10:13.714483', NULL, '0ad1a199e-75c9-41da-9bed-16f664342a72.jpg', 0xb4afb6c02aeb4d61b6de53c9703f8408),
(0x1612662b4b754395bf9d65becd793ec4, '2024-04-16 11:11:40.807764', NULL, '1f6f591c2-0257-40fd-8416-1cd2b313341a.jpg', 0x59366e2f426b44a181c1ed2c322c7cf0),
(0x16cdfe44e6a849e28c3b9baa23903519, '2024-04-16 11:22:07.772388', NULL, '01b22cb05-2287-45f3-b2a7-6db3a236b9cf.jpg', 0x2aed84b3b21b4dfebda18070c40b9951),
(0x1aa99848458d406bb0cef8f7774afe2f, '2024-04-16 11:29:58.515685', NULL, '012174cef-a6a4-4dca-b1ac-99391a5a1cef.jpg', 0x8f7323c3320b4ce79897f5fd16513379),
(0x1eb489acce33492b95b1c32d53308d7d, '2024-04-16 11:22:07.780143', NULL, '1918b82c3-eea5-44e9-acca-8612b7428dad.jpg', 0x2aed84b3b21b4dfebda18070c40b9951),
(0x2393fccb6cb9402291b1d335245be93e, '2024-04-16 11:23:03.886751', NULL, '0ac62ac31-5c26-4ac2-8fb2-c73cf80339ef.jpg', 0xe4e456021afd4285a749bbf198394c23),
(0x2b37024d314342468d1b80eb87948c4a, '2024-04-16 11:15:05.375198', NULL, '1a016a6d2-7e20-4f90-93f0-2eef2775f268.jpg', 0x1d491dcdae1a4f1c851d85345ace62c5),
(0x2cdf7598bab64117a0e384c273d96c30, '2024-04-16 11:25:38.529925', NULL, '0e9bc8b1e-ab11-419e-adc7-0e1c28b1e9e6.jpg', 0x48ddef6269a8409b95a5d563042c0441),
(0x33a522cd94df46b9a6d336929019c90d, '2024-04-16 11:28:59.437174', NULL, '0e51be484-3373-48c6-850a-387893d20ecc.jpg', 0x7e8fab0bd34549e7b1333a230feafc35),
(0x35eb2e3680834f56bf72202b5ba269b2, '2024-04-16 11:15:05.362823', NULL, '0f3e75fbf-5cad-4424-9cbb-801d520ee40b.jpg', 0x1d491dcdae1a4f1c851d85345ace62c5),
(0x406d69da88434c45938d80de145a0c87, '2024-04-16 11:20:31.560880', NULL, '1c78f3a28-16cb-4df3-9ca0-5831bf173cc1.jpg', 0xddf41ea7d3954c32a9eb345aa213189b),
(0x419492616f1d45f7968782b12155c0d0, '2024-04-16 11:14:11.390706', NULL, '0d85e0b36-6db7-40a5-8238-535139575748.jpg', 0xd9c0af0f834547be8d809546a8f3eb56),
(0x4537fb9a36fc4d1784aa05b9860a1cd9, '2024-05-02 19:57:08.000000', NULL, '1d2c45059-5e42-4e5c-867b-2f9712f3a310.jpg', 0x546a50da70ee4a8689bcb2040ff28684),
(0x4e029630778442e8bbb6c337027e53ae, '2024-04-16 11:30:57.055834', NULL, '06292981e-9cda-4d2b-97f1-1caa5f9e90cf.jpg', 0x0aea92fe1db1406abea5927f2bbcad9f),
(0x59c99251a0ee47d3b8ccc97ff42bd4cb, '2024-04-16 11:30:36.955845', NULL, '01ffc3bbd-b86e-4289-a583-8d1f364616bd.jpg', 0xf394dc97575a4b3dbcf7a53c7dfdffb5),
(0x5ea883b9be6743578c5cb51a7fc783ce, '2024-04-16 11:26:43.011411', NULL, '0be1661cb-11e0-4d92-9f9f-ef36214960b1.jpg', 0x9dd2036cdc894ce6be4b21070d84e2a6),
(0x60914f7061be41aab26c160d00f3bd75, '2024-04-16 11:32:43.160702', NULL, '00a0f0249-eda7-47f4-89f5-f994c7b9fd87.jpg', 0xbc7fd1aa1b34452ca0a05cf863447e05),
(0x6287a0bdcdef48d38860b2af849a3619, '2024-04-16 11:32:15.233833', NULL, '03aae3406-d7e1-4190-bd05-9249dff32544.jpg', 0x34c393a10dae46ee92322dc97c9f4641),
(0x6be5136f84f843b8a05192b533230fae, '2024-05-02 20:08:59.000000', NULL, '1ba289eae-a208-4204-bf85-8ddaee485af9.jpg', 0x37e36fd45ee742cb8309721af72aca3d),
(0x6ee1d1dca5ea4d6aabe0f5afa163f284, '2024-05-02 20:08:59.000000', NULL, '0be9c36f5-eebc-413c-ace3-00c460bb4502.jpg', 0x37e36fd45ee742cb8309721af72aca3d),
(0x77a77e0547944ea59c2d5bb2505bfcd1, '2024-04-16 11:29:27.247075', NULL, '044b1a314-bef9-451f-a170-347b52e2c9da.jpg', 0xe6871aca4ca74d3680442b9e63cd1e16),
(0x7c760808805f4fa3bd3f25adeba9e934, '2024-04-16 11:33:05.413144', NULL, '015edc08c-fb3a-4de9-b2d6-6126a7f6889b.jpg', 0x259368be1c27461a8eb3fcf4b8e78d87),
(0x7d3d14e7c37141e583e7dcf461efc913, '2024-04-16 11:12:48.052208', NULL, '06d4a0bd6-79c4-44b6-bbc6-aa05b310b2d0.jpg', 0xd8b40463a835409aa72c9893bd458b42),
(0x7d93cd3d1d9741a19108585b3dd6f401, '2024-04-16 11:11:40.798629', NULL, '0912e7ad9-4284-4b10-a150-38d916d137a6.jpg', 0x59366e2f426b44a181c1ed2c322c7cf0),
(0x970ed579b9c14479bbdde47ab5bd955e, '2024-04-16 11:23:03.890516', NULL, '164a058a7-3711-4e59-8fce-1d292af507c6.jpg', 0xe4e456021afd4285a749bbf198394c23),
(0x9a60cc27e32c488f8b2bb2a13624d7b7, '2024-04-16 11:16:13.809119', NULL, '1e9e3379f-5939-490e-803a-d1c537c48e6d.jpg', 0x3338e327cc14467297a0304216c65f32),
(0xaa661acfb8e44a51bd985880333e47df, '2024-05-02 20:08:59.000000', NULL, '26cd49f1d-bd62-422f-ac9e-4637122f1f2d.jpg', 0x37e36fd45ee742cb8309721af72aca3d),
(0xab1195ac57a44054bc957cfc138bb959, '2024-04-16 11:27:17.669600', NULL, '0871967e9-c5c6-4c51-a6db-e5b508237f0a.jpg', 0xdf30a5d22898404b82c25be887091c76),
(0xb8183da2ead4421d88831d6ebed87592, '2024-04-16 11:33:21.618620', NULL, '059cca4c3-19a9-45dd-b93a-4d89e6960156.jpg', 0x9311f85222c2412ebe6d65a2cce2fb85),
(0xbbfc9dc6ed3a4945b35053a746b1cbc5, '2024-04-16 11:26:10.640356', NULL, '079049a3e-4e85-4e9e-be0c-9be90878d659.jpg', 0xed566ae6f2494396a8a20b3fe71fce43),
(0xcb5b578527e9463c97e16cd290ce9c2c, '2024-04-16 11:28:27.668266', NULL, '0b4242b7e-abb8-4914-9528-89fd47797c0c.jpg', 0xd5968a2b395a4e62b7bd014e825f7358),
(0xcc604626208042309b3a57c13dc9e9ad, '2024-04-16 11:20:31.552820', NULL, '08ddb2952-969c-4f47-a042-20ea5246d20e.jpg', 0xddf41ea7d3954c32a9eb345aa213189b),
(0xcf23a4a9672a4ec98b113c5046e9a586, '2024-04-16 11:21:16.456337', NULL, '1d60883bd-2b83-4909-ad30-6e1c8c370e7e.jpg', 0xa088316dc9a742d1ac1d76b028344776),
(0xd45c5ed4fafc43d285cdc79dacb330e3, '2024-04-16 11:27:43.546788', NULL, '0e8683a16-c811-4e0b-857e-0ed859d44255.jpg', 0x5fc6523fa8594ac7a0260659ca7c26be),
(0xd641aa9a1cce4754870dbecc612be9cf, '2024-04-16 11:21:16.439824', NULL, '08f90ca1e-bd7b-4481-8bf9-ea141e73da59.jpg', 0xa088316dc9a742d1ac1d76b028344776),
(0xd64cd1db47f44c71b3111969e7765519, '2024-04-16 11:12:48.063331', NULL, '151ff45f6-9641-4dc5-bd8f-98426d726c44.jpg', 0xd8b40463a835409aa72c9893bd458b42),
(0xdcd71052a5f54f0f93d040da942837c5, '2024-04-16 11:24:40.543381', NULL, '00d02d9ff-a9f5-4133-8923-032af33c69a6.jpg', 0xecfe25dbaecd495d9ee37cb41b589fab),
(0xe842fc5312c54a8b8269b15940b4e0aa, '2024-04-16 11:10:13.721465', NULL, '1aabd2448-ca2c-46f8-8572-2e107af0599e.jpg', 0xb4afb6c02aeb4d61b6de53c9703f8408),
(0xec8a0e6a75af4f388d8cac4494b103c2, '2024-04-16 11:18:01.442791', NULL, '1324bd06e-779b-4217-b5dd-e6935cc9d8f5.jpg', 0xf82c06740b5241d197347b7e335e5bcb),
(0xef045441630841d2b106722d735ef02b, '2024-05-02 19:57:08.000000', NULL, '090df3539-f5bb-4c06-a733-6874bde382c0.jpg', 0x546a50da70ee4a8689bcb2040ff28684),
(0xf1086be2f81a49b7aa71ec44e5383d5f, '2024-04-16 11:16:13.801588', NULL, '05f9d6940-5eed-4cee-9507-6541002c3373.jpg', 0x3338e327cc14467297a0304216c65f32),
(0xf77303a925824b75bb13637d5c765b6a, '2024-04-16 11:14:11.399604', NULL, '1730486e3-a39e-4b08-8a0a-37470866987c.jpg', 0xd9c0af0f834547be8d809546a8f3eb56);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` binary(16) NOT NULL,
  `account_id` binary(16) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `notification_expiry_date` datetime(6) DEFAULT NULL,
  `receive_time` datetime(6) DEFAULT NULL,
  `seen` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` binary(16) NOT NULL,
  `order_approved_at` datetime(6) DEFAULT NULL,
  `coupon_id` binary(16) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `customer_id` binary(16) DEFAULT NULL,
  `order_delivered_carrier_date` datetime(6) DEFAULT NULL,
  `order_delivered_customer_date` datetime(6) DEFAULT NULL,
  `order_status_id` binary(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `staff_account_id` binary(16) DEFAULT NULL,
  `total_discount` float NOT NULL,
  `total_price` float NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_approved_at`, `coupon_id`, `created_at`, `customer_id`, `order_delivered_carrier_date`, `order_delivered_customer_date`, `order_status_id`, `address`, `staff_account_id`, `total_discount`, `total_price`, `user_name`, `email`, `first_name`, `last_name`, `phone`) VALUES
(0x1517887430e046158995e209e8cde8e4, '2024-05-03 00:00:00.000000', NULL, '2024-05-03 00:00:00.000000', NULL, '2024-05-03 00:00:00.000000', '2024-05-03 00:00:00.000000', NULL, 'Tiền giang city', 0x8114f89653b6423c874e37d19a9f0539, 0, 4264, 'vothanhtrong', 'trong123@gmail.com', NULL, 'trongIT', '0908751497'),
(0x64508a3f91774ba4a3623fda8ba5ee83, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', NULL, 'Sài Gòn City', 0x8114f89653b6423c874e37d19a9f0539, 0, 148, 'tieuphu', 'trung14@gmail.com', NULL, NULL, '(+84) 703 796 485'),
(0x7c0430b1e77f4ea98f22176e5d694316, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', NULL, 'Phan Thiet City', 0x8114f89653b6423c874e37d19a9f0539, 0, 100, 'ngominhtri', 'tri@gmail.com', NULL, 'triLagi', '0896479963'),
(0x82fda8e2f20b41a7b9a60475cfb150d3, '2024-04-29 12:30:45.000000', NULL, '2024-04-29 10:15:00.000000', NULL, '2024-05-01 08:00:00.000000', '2024-05-02 10:30:00.000000', NULL, 'Sài gòn ', 0x933bcb07264c4029b38a223ea243ffbe, 5, 30000, 'hiếu', NULL, NULL, NULL, NULL),
(0x85de7f8481044e1fb3e6d09259529805, '2024-04-29 12:30:45.000000', NULL, '2024-04-29 10:15:00.000000', NULL, '2024-05-01 08:00:00.000000', '2024-05-02 10:30:00.000000', NULL, 'ha noi ', 0x933bcb07264c4029b38a223ea243ffbe, 5, 30000, 'trungdua', NULL, NULL, NULL, NULL),
(0xaf849f88ba144471a719dd4c4aa52361, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', NULL, 'saigon city', 0xc649362609fb43a0867d6fb5a453a440, 0, 30, 'trong123', NULL, NULL, NULL, NULL),
(0xc61e82c5f45b4c178e3ceb9248357caf, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', NULL, '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', NULL, 'Binh Thuan City', 0x8114f89653b6423c874e37d19a9f0539, 0, 20000, 'huyLagi', 'huy123@gmail.com', 'Huy', 'nguyen', '0896400349');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_cart_items`
--

CREATE TABLE `order_cart_items` (
  `order_id` binary(16) NOT NULL,
  `cart_item_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_cart_items`
--

INSERT INTO `order_cart_items` (`order_id`, `cart_item_id`) VALUES
(0x82fda8e2f20b41a7b9a60475cfb150d3, 0x270ca98452384cb28cef9d6e85439373);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` binary(16) NOT NULL,
  `order_id` binary(16) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `price`, `product_id`, `quantity`, `shipping_id`) VALUES
(0x0d22802aee734430b8e71795147433f0, 0x1517887430e046158995e209e8cde8e4, 65, 0x59366e2f426b44a181c1ed2c322c7cf0, 2, NULL),
(0x156ee02e7ea045be95168fe6fca98a46, 0x64508a3f91774ba4a3623fda8ba5ee83, 65, 0x59366e2f426b44a181c1ed2c322c7cf0, 2, NULL),
(0x22455c56048c46aebacf413918eb2243, 0xaf849f88ba144471a719dd4c4aa52361, 15, 0x34c393a10dae46ee92322dc97c9f4641, 2, NULL),
(0x274aaa3f550b4514877ea135eee02164, 0x7c0430b1e77f4ea98f22176e5d694316, 45, 0xd9c0af0f834547be8d809546a8f3eb56, 2, NULL),
(0x2953a72736df4c2c8c69ee0ca3ae801a, 0x1517887430e046158995e209e8cde8e4, 12, 0x0aea92fe1db1406abea5927f2bbcad9f, 2, NULL),
(0x43ccda1bb00d4acfb1a38cc47ad0b481, 0x82fda8e2f20b41a7b9a60475cfb150d3, 50000, 0x34c393a10dae46ee92322dc97c9f4641, 2, NULL),
(0x4c54c2c40bf54bbf976d3272dc0dad3a, 0xc61e82c5f45b4c178e3ceb9248357caf, 2000, 0x546a50da70ee4a8689bcb2040ff28684, 10, NULL),
(0x6eadcbada55e43ff828a41632730603b, 0x7c0430b1e77f4ea98f22176e5d694316, 10, 0x37e36fd45ee742cb8309721af72aca3d, 1, NULL),
(0xacb3bc2627b848f59c7702232be2aa53, 0x1517887430e046158995e209e8cde8e4, 55, 0x7e8fab0bd34549e7b1333a230feafc35, 2, NULL),
(0xc8872486db0a466e8d48b8fd013a9c20, 0x85de7f8481044e1fb3e6d09259529805, 5000, 0x9311f85222c2412ebe6d65a2cce2fb85, 3, NULL),
(0xd27e8604cf4a4347ba7c1809a38f5e90, 0x1517887430e046158995e209e8cde8e4, 2000, 0x546a50da70ee4a8689bcb2040ff28684, 2, NULL),
(0xd34285459f2848fd99304305987db848, 0x64508a3f91774ba4a3623fda8ba5ee83, 9, 0xf394dc97575a4b3dbcf7a53c7dfdffb5, 2, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `privacy` text DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `discount_price` decimal(10,0) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_note` varchar(255) DEFAULT NULL,
  `product_weight` decimal(10,0) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `regular_price` decimal(10,0) DEFAULT NULL,
  `short_description` varchar(165) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `sku`, `discount_price`, `product_description`, `product_name`, `product_note`, `product_weight`, `published`, `quantity`, `regular_price`, `short_description`) VALUES
(0x0aea92fe1db1406abea5927f2bbcad9f, '2024-04-16 11:30:57.037327', NULL, NULL, 12, 'Relaxed Short full Sleeve T-Shirt', 'Relaxed Short full Sleeve T-Shirt', NULL, NULL, NULL, 0, 45, NULL),
(0x1d491dcdae1a4f1c851d85345ace62c5, '2024-04-16 11:15:05.345675', NULL, NULL, 30, 'Womens Party Wear Shoes', 'Womens Party Wear Shoes', NULL, NULL, NULL, 0, 25, NULL),
(0x259368be1c27461a8eb3fcf4b8e78d87, '2024-04-16 11:33:05.000000', '2024-05-02 20:12:56.000000', NULL, 17, 'men\'s hoodies t-shirt', 'men\'s hoodies t-shirt', 'men\'s hoodies t-shirt', 20, NULL, 0, 7, 'men\'s hoodies t-shirt'),
(0x2aed84b3b21b4dfebda18070c40b9951, '2024-04-16 11:22:07.752126', NULL, NULL, 56, 'Pure Garment Dyed Cotton Shirt', 'Pure Garment Dyed Cotton Shirt', NULL, NULL, NULL, 0, 45, NULL),
(0x3338e327cc14467297a0304216c65f32, '2024-04-16 11:16:13.778906', NULL, NULL, 120, 'Smart watche Vital Plus', 'Smart watche Vital Plus', NULL, NULL, NULL, 0, 100, NULL),
(0x34c393a10dae46ee92322dc97c9f4641, '2024-04-16 11:32:15.000000', '2024-05-02 20:03:42.000000', NULL, 15, 'woolen hat for men', 'woolen hat for men', 'woolen hat for men', 20, NULL, 0, 12, 'woolen hat for men'),
(0x37e36fd45ee742cb8309721af72aca3d, '2024-05-02 20:08:59.000000', '2024-05-02 20:10:38.000000', NULL, 10, 'I\'m the onefour', 'helloae', 'I\'m the onefour', 65, b'0', 1, 5000, 'I\'m the onefour'),
(0x48ddef6269a8409b95a5d563042c0441, '2024-04-16 11:25:38.509924', NULL, NULL, 30, 'Rose Gold Peacock Earrings', 'Rose Gold Peacock Earrings', NULL, NULL, NULL, 0, 20, NULL),
(0x546a50da70ee4a8689bcb2040ff28684, '2024-04-16 11:46:19.000000', '2024-05-02 19:57:08.000000', NULL, 2000, '\n                      Lorem ipsum dolor sit amet consectetur Lorem ipsum\n                      dolor dolor sit amet consectetur Lorem ipsum dolor\n                    ', 'Rose Gold diamonds Earring', 'abcd', 20, NULL, 10, 1990, 'asasas'),
(0x59366e2f426b44a181c1ed2c322c7cf0, '2024-04-16 11:11:40.777005', NULL, NULL, 65, 'Men\'s Leather Formal Wear shoes', 'Men\'s Leather Formal Wear shoes', NULL, NULL, NULL, 0, 50, NULL),
(0x5fc6523fa8594ac7a0260659ca7c26be, '2024-04-16 11:27:43.527421', NULL, NULL, 30, 'Silver Deer Heart Necklace', 'Silver Deer Heart Necklace', NULL, NULL, NULL, 0, 84, NULL),
(0x794e9e23856f4689b446ae3b9f4b5075, '2024-04-16 11:16:56.355085', NULL, NULL, 170, 'Pocket Watch Leather Pouch', 'Pocket Watch Leather Pouch', NULL, NULL, NULL, 0, 150, NULL),
(0x7e8fab0bd34549e7b1333a230feafc35, '2024-04-16 11:28:59.421394', NULL, NULL, 55, 'Air Trekking Shoes - white', 'Air Trekking Shoes - white', NULL, NULL, NULL, 0, 52, NULL),
(0x8f7323c3320b4ce79897f5fd16513379, '2024-04-16 11:29:58.499414', NULL, NULL, 15, 'Running & Trekking Shoes - White', 'Running & Trekking Shoes - White', NULL, NULL, NULL, 0, 49, NULL),
(0x9311f85222c2412ebe6d65a2cce2fb85, '2024-04-16 11:33:21.000000', '2024-05-02 20:05:57.000000', NULL, 5, 'baby fabric shoes', 'baby fabric shoes', 'baby fabric shoes', 20, NULL, 0, 4, 'baby fabric shoes'),
(0x9dd2036cdc894ce6be4b21070d84e2a6, '2024-04-16 11:26:42.990698', NULL, NULL, 10, 'Men\'s Leather Reversible Belt', 'Men\'s Leather Reversible Belt', NULL, NULL, NULL, 0, 24, NULL),
(0xa088316dc9a742d1ac1d76b028344776, '2024-04-16 11:21:16.267959', NULL, NULL, 65, 'MEN Yarn Fleece Full-Zip Jacket', 'MEN Yarn Fleece Full-Zip Jacket', NULL, NULL, NULL, 0, 58, NULL),
(0xb4afb6c02aeb4d61b6de53c9703f8408, '2024-04-16 11:10:13.690430', NULL, NULL, 85, 'Better Basics French Terry Sweatshorts', 'Better Basics French Terry Sweatshorts', NULL, NULL, NULL, 0, 78, NULL),
(0xbc7fd1aa1b34452ca0a05cf863447e05, '2024-04-16 11:32:43.000000', '2024-05-02 20:03:28.000000', NULL, 5, 'girls t-shirt', 'girls t-shirt', 'girls t-shirt', 20, NULL, 0, 3, 'girls t-shirt'),
(0xd5968a2b395a4e62b7bd014e825f7358, '2024-04-16 11:28:27.649716', NULL, NULL, 30, 'Boot With Suede Detail', 'Boot With Suede Detail', NULL, NULL, NULL, 0, 20, NULL),
(0xd8b40463a835409aa72c9893bd458b42, '2024-04-16 11:12:48.032317', NULL, NULL, 64, 'Trekking & Running Shoes - black', 'Trekking & Running Shoes - black', NULL, NULL, NULL, 0, 58, NULL),
(0xd9c0af0f834547be8d809546a8f3eb56, '2024-04-16 11:14:11.369941', NULL, NULL, 45, 'Mens Winter Leathers Jackets', 'Mens Winter Leathers Jackets', NULL, NULL, NULL, 0, 32, NULL),
(0xddf41ea7d3954c32a9eb345aa213189b, '2024-04-16 11:20:31.529365', NULL, NULL, 35, 'Black Floral Wrap Midi Skirt', 'Black Floral Wrap Midi Skirt', NULL, NULL, NULL, 0, 25, NULL),
(0xdf30a5d22898404b82c25be887091c76, '2024-04-16 11:27:17.651240', NULL, NULL, 10, 'Titan 100 Ml Womens Perfume', 'Titan 100 Ml Womens Perfume', NULL, NULL, NULL, 0, 42, NULL),
(0xe4e456021afd4285a749bbf198394c23, '2024-04-16 11:23:03.865197', NULL, NULL, 75, 'Mens Winter Leathers Jackets', 'Mens Winter Leathers Jackets', NULL, NULL, NULL, 0, 48, NULL),
(0xe6871aca4ca74d3680442b9e63cd1e16, '2024-04-16 11:29:27.227016', NULL, NULL, 65, 'Sports Claw Women\'s Shoes', 'Sports Claw Women\'s Shoes', NULL, NULL, NULL, 0, 54, NULL),
(0xecfe25dbaecd495d9ee37cb41b589fab, '2024-04-16 11:24:40.429013', NULL, NULL, 200, '\n                      Lorem ipsum dolor sit amet consectetur Lorem ipsum\n                      dolor dolor sit amet consectetur Lorem ipsum dolor\n                    ', 'shampoo, conditioner & facewash packs', NULL, NULL, NULL, 0, 150, NULL),
(0xed566ae6f2494396a8a20b3fe71fce43, '2024-04-16 11:26:10.617585', NULL, NULL, 65, 'platinum Zircon Classic Ring', 'platinum Zircon Classic Ring', NULL, NULL, NULL, 0, 62, NULL),
(0xf394dc97575a4b3dbcf7a53c7dfdffb5, '2024-04-16 11:30:36.949837', NULL, NULL, 9, 'Girls pnk Embro design Top', 'Girls pnk Embro design Top', NULL, NULL, NULL, 0, 61, NULL),
(0xf82c06740b5241d197347b7e335e5bcb, '2024-04-16 11:18:01.407355', NULL, NULL, 105, 'Casual Men\'s Brown shoes', 'Casual Men\'s Brown shoes', NULL, NULL, NULL, 0, 99, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `product_id` binary(16) NOT NULL,
  `attribute_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` binary(16) NOT NULL,
  `category_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(0x0aea92fe1db1406abea5927f2bbcad9f, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x1d491dcdae1a4f1c851d85345ace62c5, 0x6bae1204fb2011eebd53edc308de43b3),
(0x259368be1c27461a8eb3fcf4b8e78d87, 0x6bae011efb2011eebd53edc308de43b3),
(0x2aed84b3b21b4dfebda18070c40b9951, 0x6bae021cfb2011eebd53edc308de43b3),
(0x3338e327cc14467297a0304216c65f32, 0x6bae1258fb2011eebd53edc308de43b3),
(0x34c393a10dae46ee92322dc97c9f4641, 0x6badf9c7fb2011eebd53edc308de43b3),
(0x37e36fd45ee742cb8309721af72aca3d, 0x6badfe78fb2011eebd53edc308de43b3),
(0x37e36fd45ee742cb8309721af72aca3d, 0x6bae021cfb2011eebd53edc308de43b3),
(0x37e36fd45ee742cb8309721af72aca3d, 0x6bae0293fb2011eebd53edc308de43b3),
(0x48ddef6269a8409b95a5d563042c0441, 0x6badff61fb2011eebd53edc308de43b3),
(0x546a50da70ee4a8689bcb2040ff28684, 0x6badff61fb2011eebd53edc308de43b3),
(0x546a50da70ee4a8689bcb2040ff28684, 0x6badffeafb2011eebd53edc308de43b3),
(0x546a50da70ee4a8689bcb2040ff28684, 0x6bae0068fb2011eebd53edc308de43b3),
(0x59366e2f426b44a181c1ed2c322c7cf0, 0x6bae04c3fb2011eebd53edc308de43b3),
(0x5fc6523fa8594ac7a0260659ca7c26be, 0x6badff61fb2011eebd53edc308de43b3),
(0x794e9e23856f4689b446ae3b9f4b5075, 0x6bae1258fb2011eebd53edc308de43b3),
(0x7e8fab0bd34549e7b1333a230feafc35, 0x6bae044dfb2011eebd53edc308de43b3),
(0x8f7323c3320b4ce79897f5fd16513379, 0x6bae044dfb2011eebd53edc308de43b3),
(0x9311f85222c2412ebe6d65a2cce2fb85, 0x6badfe78fb2011eebd53edc308de43b3),
(0x9311f85222c2412ebe6d65a2cce2fb85, 0x6bae0293fb2011eebd53edc308de43b3),
(0x9dd2036cdc894ce6be4b21070d84e2a6, 0x6bae1301fb2011eebd53edc308de43b3),
(0xa088316dc9a742d1ac1d76b028344776, 0x6bae0314fb2011eebd53edc308de43b3),
(0xb4afb6c02aeb4d61b6de53c9703f8408, 0x6bae0293fb2011eebd53edc308de43b3),
(0xbc7fd1aa1b34452ca0a05cf863447e05, 0x6badf9c7fb2011eebd53edc308de43b3),
(0xd5968a2b395a4e62b7bd014e825f7358, 0x6bae1353fb2011eebd53edc308de43b3),
(0xd8b40463a835409aa72c9893bd458b42, 0x6bae044dfb2011eebd53edc308de43b3),
(0xd9c0af0f834547be8d809546a8f3eb56, 0x6bae0314fb2011eebd53edc308de43b3),
(0xddf41ea7d3954c32a9eb345aa213189b, 0x6bae12a8fb2011eebd53edc308de43b3),
(0xdf30a5d22898404b82c25be887091c76, 0x6badffeafb2011eebd53edc308de43b3),
(0xe4e456021afd4285a749bbf198394c23, 0x6bae0314fb2011eebd53edc308de43b3),
(0xe6871aca4ca74d3680442b9e63cd1e16, 0x6bae044dfb2011eebd53edc308de43b3),
(0xecfe25dbaecd495d9ee37cb41b589fab, 0x6bae0068fb2011eebd53edc308de43b3),
(0xed566ae6f2494396a8a20b3fe71fce43, 0x6badff61fb2011eebd53edc308de43b3),
(0xf394dc97575a4b3dbcf7a53c7dfdffb5, 0x6badf9c7fb2011eebd53edc308de43b3),
(0xf82c06740b5241d197347b7e335e5bcb, 0x6bae053efb2011eebd53edc308de43b3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_coupons`
--

CREATE TABLE `product_coupons` (
  `product_id` binary(16) NOT NULL,
  `coupon_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_shipping_info`
--

CREATE TABLE `product_shipping_info` (
  `product_id` binary(16) NOT NULL,
  `shipping_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `product_id` binary(16) NOT NULL,
  `supplier_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tags`
--

CREATE TABLE `product_tags` (
  `product_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tags`
--

INSERT INTO `product_tags` (`product_id`, `tag_id`) VALUES
(0x0aea92fe1db1406abea5927f2bbcad9f, 0x89f44123fb2111eebd53edc308de43b3),
(0x1d491dcdae1a4f1c851d85345ace62c5, 0x89f4419efb2111eebd53edc308de43b3),
(0x1d491dcdae1a4f1c851d85345ace62c5, 0x89f441dbfb2111eebd53edc308de43b3),
(0x259368be1c27461a8eb3fcf4b8e78d87, 0x89f43c8dfb2111eebd53edc308de43b3),
(0x259368be1c27461a8eb3fcf4b8e78d87, 0x89f441dbfb2111eebd53edc308de43b3),
(0x2aed84b3b21b4dfebda18070c40b9951, 0x89f44123fb2111eebd53edc308de43b3),
(0x2aed84b3b21b4dfebda18070c40b9951, 0x89f441dbfb2111eebd53edc308de43b3),
(0x3338e327cc14467297a0304216c65f32, 0x89f440a0fb2111eebd53edc308de43b3),
(0x3338e327cc14467297a0304216c65f32, 0x89f441dbfb2111eebd53edc308de43b3),
(0x34c393a10dae46ee92322dc97c9f4641, 0x89f43c8dfb2111eebd53edc308de43b3),
(0x37e36fd45ee742cb8309721af72aca3d, 0x89f441dbfb2111eebd53edc308de43b3),
(0x48ddef6269a8409b95a5d563042c0441, 0x89f440a0fb2111eebd53edc308de43b3),
(0x546a50da70ee4a8689bcb2040ff28684, 0x89f440a0fb2111eebd53edc308de43b3),
(0x546a50da70ee4a8689bcb2040ff28684, 0x89f44123fb2111eebd53edc308de43b3),
(0x546a50da70ee4a8689bcb2040ff28684, 0x89f44160fb2111eebd53edc308de43b3),
(0x59366e2f426b44a181c1ed2c322c7cf0, 0x89f4419efb2111eebd53edc308de43b3),
(0x59366e2f426b44a181c1ed2c322c7cf0, 0x89f441dbfb2111eebd53edc308de43b3),
(0x5fc6523fa8594ac7a0260659ca7c26be, 0x89f440a0fb2111eebd53edc308de43b3),
(0x794e9e23856f4689b446ae3b9f4b5075, 0x89f440a0fb2111eebd53edc308de43b3),
(0x794e9e23856f4689b446ae3b9f4b5075, 0x89f441dbfb2111eebd53edc308de43b3),
(0x7e8fab0bd34549e7b1333a230feafc35, 0x89f4419efb2111eebd53edc308de43b3),
(0x8f7323c3320b4ce79897f5fd16513379, 0x89f4419efb2111eebd53edc308de43b3),
(0x9311f85222c2412ebe6d65a2cce2fb85, 0x89f43c8dfb2111eebd53edc308de43b3),
(0x9311f85222c2412ebe6d65a2cce2fb85, 0x89f44160fb2111eebd53edc308de43b3),
(0x9dd2036cdc894ce6be4b21070d84e2a6, 0x89f440a0fb2111eebd53edc308de43b3),
(0xa088316dc9a742d1ac1d76b028344776, 0x89f44123fb2111eebd53edc308de43b3),
(0xa088316dc9a742d1ac1d76b028344776, 0x89f441dbfb2111eebd53edc308de43b3),
(0xb4afb6c02aeb4d61b6de53c9703f8408, 0x89f44123fb2111eebd53edc308de43b3),
(0xb4afb6c02aeb4d61b6de53c9703f8408, 0x89f441dbfb2111eebd53edc308de43b3),
(0xbc7fd1aa1b34452ca0a05cf863447e05, 0x89f43c8dfb2111eebd53edc308de43b3),
(0xd5968a2b395a4e62b7bd014e825f7358, 0x89f4419efb2111eebd53edc308de43b3),
(0xd8b40463a835409aa72c9893bd458b42, 0x89f4419efb2111eebd53edc308de43b3),
(0xd8b40463a835409aa72c9893bd458b42, 0x89f441dbfb2111eebd53edc308de43b3),
(0xd9c0af0f834547be8d809546a8f3eb56, 0x89f44123fb2111eebd53edc308de43b3),
(0xd9c0af0f834547be8d809546a8f3eb56, 0x89f441dbfb2111eebd53edc308de43b3),
(0xddf41ea7d3954c32a9eb345aa213189b, 0x89f44123fb2111eebd53edc308de43b3),
(0xddf41ea7d3954c32a9eb345aa213189b, 0x89f441dbfb2111eebd53edc308de43b3),
(0xdf30a5d22898404b82c25be887091c76, 0x89f440a0fb2111eebd53edc308de43b3),
(0xe4e456021afd4285a749bbf198394c23, 0x89f44123fb2111eebd53edc308de43b3),
(0xe4e456021afd4285a749bbf198394c23, 0x89f441dbfb2111eebd53edc308de43b3),
(0xe6871aca4ca74d3680442b9e63cd1e16, 0x89f4419efb2111eebd53edc308de43b3),
(0xecfe25dbaecd495d9ee37cb41b589fab, 0x89f440a0fb2111eebd53edc308de43b3),
(0xecfe25dbaecd495d9ee37cb41b589fab, 0x89f44160fb2111eebd53edc308de43b3),
(0xed566ae6f2494396a8a20b3fe71fce43, 0x89f440a0fb2111eebd53edc308de43b3),
(0xf394dc97575a4b3dbcf7a53c7dfdffb5, 0x89f44123fb2111eebd53edc308de43b3),
(0xf82c06740b5241d197347b7e335e5bcb, 0x89f4419efb2111eebd53edc308de43b3),
(0xf82c06740b5241d197347b7e335e5bcb, 0x89f441dbfb2111eebd53edc308de43b3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sells`
--

CREATE TABLE `sells` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `icon_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_country_zones`
--

CREATE TABLE `shipping_country_zones` (
  `shipping_zone_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_rates`
--

CREATE TABLE `shipping_rates` (
  `id` binary(16) NOT NULL,
  `max_value` decimal(38,2) DEFAULT NULL,
  `min_value` decimal(38,2) NOT NULL,
  `no_max` bit(1) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `weight_unit` varchar(255) NOT NULL,
  `shipping_zone_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_zones`
--

CREATE TABLE `shipping_zones` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `free_shipping` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate_type` varchar(255) NOT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slideshows`
--

CREATE TABLE `slideshows` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `description_url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff_accounts`
--

CREATE TABLE `staff_accounts` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `registered_at` datetime(6) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `staff_accounts`
--

INSERT INTO `staff_accounts` (`id`, `created_at`, `updated_at`, `active`, `email`, `first_name`, `last_name`, `password_hash`, `phone_number`, `profile_img`, `registered_at`, `created_by`, `role_id`, `updated_by`, `fullname`) VALUES
(0x03e55e85512747a09b56dc6a0d6cc13a, '2024-05-02 15:20:58.000000', NULL, b'0', 'hieu@gmail.com', 'hieu', 'ha', 'hieu123', NULL, NULL, NULL, NULL, NULL, NULL, 'hahieu'),
(0x684fdab3081e4a848a772bb3016111fe, '2024-05-02 15:21:10.000000', NULL, b'0', 'hieu@gmail.com', 'hieu', 'ha', 'hieu123', NULL, NULL, NULL, NULL, NULL, NULL, 'hahieu'),
(0x8114f89653b6423c874e37d19a9f0539, '2024-05-02 19:01:39.000000', NULL, b'0', 'hoa@gmail.com', 'hoa', 'bao', 'hoa123', NULL, NULL, NULL, NULL, NULL, NULL, 'nguyenbaohoa'),
(0x89a4ad6f4c6b41de9cf46df10821e453, '2024-05-02 14:36:56.000000', NULL, b'0', 'trung@gmail.com', 'trung', 'ha', 'trung123', NULL, NULL, NULL, NULL, NULL, NULL, 'haminhtrung'),
(0x933bcb07264c4029b38a223ea243ffbe, '2024-05-01 07:46:53.000000', NULL, b'0', 'huy@gmail.com', 'huy', 'nguyễn', 'huy123', NULL, NULL, NULL, NULL, NULL, NULL, 'Nguyễn quốc huy'),
(0xc649362609fb43a0867d6fb5a453a440, '2024-05-02 15:30:09.000000', NULL, b'0', 'trong@gmail.com', 'trong', 'vo', 'trong123', NULL, NULL, NULL, NULL, NULL, NULL, 'vothanhtrong');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `created_at`, `updated_at`, `icon`, `tag_name`) VALUES
(0x89f43c8dfb2111eebd53edc308de43b3, NULL, NULL, 'best sellers', 'best sellers'),
(0x89f440a0fb2111eebd53edc308de43b3, NULL, NULL, 'Top Rated', 'Top Rated'),
(0x89f44123fb2111eebd53edc308de43b3, NULL, NULL, 'New Arrivals', 'New Arrivals'),
(0x89f44160fb2111eebd53edc308de43b3, NULL, NULL, 'Deal of the day', 'Deal of the day'),
(0x89f4419efb2111eebd53edc308de43b3, NULL, NULL, 'Trending', 'Trending'),
(0x89f441dbfb2111eebd53edc308de43b3, NULL, NULL, 'New Products', 'New Products');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variants`
--

CREATE TABLE `variants` (
  `id` binary(16) NOT NULL,
  `product_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_attribute_values`
--

CREATE TABLE `variant_attribute_values` (
  `variant_attribute_value_id` binary(16) NOT NULL,
  `attribute_value_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_options`
--

CREATE TABLE `variant_options` (
  `id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `buying_price` decimal(38,2) DEFAULT NULL,
  `compare_price` decimal(38,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_price` decimal(38,2) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image_id` binary(16) DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkagsu8uri85emo6x7lxpsvs9p` (`created_by`),
  ADD KEY `FKtgiw6t3448ahf7moes0v5jgsk` (`updated_by`);

--
-- Chỉ mục cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkaq0fvnivyrmqu857uy04xgmm` (`attribute_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8ba3sryid5k8a9kidpkvqipyt` (`customer_id`),
  ADD KEY `FKmd2ap4oxo3wvgkf4fnaye532i` (`product_id`);

--
-- Chỉ mục cho bảng `cart_categories`
--
ALTER TABLE `cart_categories`
  ADD PRIMARY KEY (`cart_id`,`category_id`),
  ADD KEY `FKsflcx72ow3xn8e5gttcj5jc78` (`category_id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`),
  ADD KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`);

--
-- Chỉ mục cho bảng `cart_tags`
--
ALTER TABLE `cart_tags`
  ADD PRIMARY KEY (`cart_id`,`tag_id`),
  ADD KEY `FKj77u566x3ofvdljabeo9gfpb3` (`tag_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9u002jqfpom1gxjld7jviqm21` (`created_by`),
  ADD KEY `FKeff5dawd2s1lbv8mx39e79mvv` (`updated_by`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrvr6wl9gll7u98cda18smugp4` (`customer_id`);

--
-- Chỉ mục cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn4fllmf69rio4pq2q5k4xfc9l` (`product_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5dsqjxt1wpoa8icawskqijsec` (`account_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn1d1gkxckw648m2n2d5gx0yx5` (`coupon_id`),
  ADD KEY `FKcbbqf26brulgfgvd0mf74rv4y` (`order_status_id`);

--
-- Chỉ mục cho bảng `order_cart_items`
--
ALTER TABLE `order_cart_items`
  ADD PRIMARY KEY (`order_id`,`cart_item_id`),
  ADD KEY `FKdyxwb1cp33fujmfh5jskwk9va` (`cart_item_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  ADD KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`);

--
-- Chỉ mục cho bảng `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe4b4y3muy8mopmamipe97nt5j` (`created_by`),
  ADD KEY `FKcg14f8n04d5xkfkpgnglots4n` (`updated_by`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`product_id`,`attribute_id`),
  ADD KEY `FK6ksuorb5567jpa08ihcumumy1` (`attribute_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `FKd112rx0alycddsms029iifrih` (`category_id`);

--
-- Chỉ mục cho bảng `product_coupons`
--
ALTER TABLE `product_coupons`
  ADD PRIMARY KEY (`product_id`,`coupon_id`),
  ADD KEY `FKm8d6v5e6fv8mjg3d0iifq6sw1` (`coupon_id`);

--
-- Chỉ mục cho bảng `product_shipping_info`
--
ALTER TABLE `product_shipping_info`
  ADD PRIMARY KEY (`product_id`,`shipping_id`),
  ADD KEY `FK1eigby89ytd74bdoe16wuxh9y` (`shipping_id`);

--
-- Chỉ mục cho bảng `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`product_id`,`supplier_id`),
  ADD KEY `FKmymnd7phgm081dt3iv276yl8a` (`supplier_id`);

--
-- Chỉ mục cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `FKpur2885qb9ae6fiquu77tcv1o` (`tag_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl6qdj5ibfhbde8c6opnf07ddi` (`created_by`),
  ADD KEY `FKko49a2ia8qm4l9rk4g7544t0i` (`updated_by`);

--
-- Chỉ mục cho bảng `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpq9fa53dfek6t3s1sjv4m0plc` (`created_by`),
  ADD KEY `FK4u17xl8ugefnahmg6xa23du0b` (`product_id`),
  ADD KEY `FKch8cwboto4rsv3ltyynvxrmvd` (`updated_by`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKevk09xnigyo8mvtgc59l1uc3b` (`created_by`),
  ADD KEY `FKhvq9xih03y656rmfmghfxym4w` (`updated_by`);

--
-- Chỉ mục cho bảng `shipping_country_zones`
--
ALTER TABLE `shipping_country_zones`
  ADD PRIMARY KEY (`shipping_zone_id`,`country_id`),
  ADD KEY `FKfq5og92pfcx14wpqimy6cm7f3` (`country_id`);

--
-- Chỉ mục cho bảng `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgh1qqt17uy7boc8f8dgyaenal` (`shipping_zone_id`);

--
-- Chỉ mục cho bảng `shipping_zones`
--
ALTER TABLE `shipping_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsryt5m2wxlmvqomukka58bakt` (`created_by`),
  ADD KEY `FKj9e73dbvm96clp0qrubh90sj1` (`updated_by`);

--
-- Chỉ mục cho bảng `slideshows`
--
ALTER TABLE `slideshows`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staff_accounts`
--
ALTER TABLE `staff_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2w05mq0lpmivr2519iuiowve3` (`created_by`),
  ADD KEY `FKicmmixb56mmd16stkenpifr2q` (`role_id`),
  ADD KEY `FK8kt1rbp9uqo3us42qekqu2bwx` (`updated_by`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjcuohexsi23vnpxi0t25kvwg7` (`country_id`),
  ADD KEY `FKfiw13lay8hy782gbnxojca2b8` (`created_by`),
  ADD KEY `FKf018rv4htmcbcn4wjrpymxbme` (`updated_by`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK95bued017vcya4rf4s7n31ew4` (`product_id`);

--
-- Chỉ mục cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  ADD PRIMARY KEY (`variant_attribute_value_id`,`attribute_value_id`),
  ADD KEY `FKn9smi9xs1bvsnqrn6knjvq9d9` (`attribute_value_id`);

--
-- Chỉ mục cho bảng `variant_options`
--
ALTER TABLE `variant_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqf4y59exjrgjqdl359joj02nv` (`image_id`),
  ADD KEY `FKp80xsi8rl51rtft29wsia24hq` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shipping_zones`
--
ALTER TABLE `shipping_zones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `FKkagsu8uri85emo6x7lxpsvs9p` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKtgiw6t3448ahf7moes0v5jgsk` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `FKkaq0fvnivyrmqu857uy04xgmm` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FK8ba3sryid5k8a9kidpkvqipyt` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `FKmd2ap4oxo3wvgkf4fnaye532i` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `cart_categories`
--
ALTER TABLE `cart_categories`
  ADD CONSTRAINT `FK4n4dqptx7feuqm05yaeiwd067` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `FKsflcx72ow3xn8e5gttcj5jc78` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Các ràng buộc cho bảng `cart_tags`
--
ALTER TABLE `cart_tags`
  ADD CONSTRAINT `FKj77u566x3ofvdljabeo9gfpb3` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `FKsmnypxm9ximo6f0w9myf9hwog` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `FK9u002jqfpom1gxjld7jviqm21` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKeff5dawd2s1lbv8mx39e79mvv` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `FKrvr6wl9gll7u98cda18smugp4` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `FKn4fllmf69rio4pq2q5k4xfc9l` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK5dsqjxt1wpoa8icawskqijsec` FOREIGN KEY (`account_id`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKcbbqf26brulgfgvd0mf74rv4y` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `FKn1d1gkxckw648m2n2d5gx0yx5` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Các ràng buộc cho bảng `order_cart_items`
--
ALTER TABLE `order_cart_items`
  ADD CONSTRAINT `FK43cgy9em7hy55stkecgw7nti9` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKdyxwb1cp33fujmfh5jskwk9va` FOREIGN KEY (`cart_item_id`) REFERENCES `carts` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD CONSTRAINT `FKcg14f8n04d5xkfkpgnglots4n` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKe4b4y3muy8mopmamipe97nt5j` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `FK6ksuorb5567jpa08ihcumumy1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `FKcex46yvx4g18b2pn09p79h1mc` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `FKd112rx0alycddsms029iifrih` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FKlda9rad6s180ha3dl1ncsp8n7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_coupons`
--
ALTER TABLE `product_coupons`
  ADD CONSTRAINT `FKiaiu1xxcnyw38cbcx4j80psij` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKm8d6v5e6fv8mjg3d0iifq6sw1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Các ràng buộc cho bảng `product_shipping_info`
--
ALTER TABLE `product_shipping_info`
  ADD CONSTRAINT `FK1eigby89ytd74bdoe16wuxh9y` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`),
  ADD CONSTRAINT `FK2661qi678nh0prih01pbo2or0` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD CONSTRAINT `FKj4tjiwcxs97lybw5vac1sjlbp` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKmymnd7phgm081dt3iv276yl8a` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Các ràng buộc cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `FK5rk6s19k3risy7q7wqdr41uss` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKpur2885qb9ae6fiquu77tcv1o` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Các ràng buộc cho bảng `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `FKko49a2ia8qm4l9rk4g7544t0i` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKl6qdj5ibfhbde8c6opnf07ddi` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `FK4u17xl8ugefnahmg6xa23du0b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKch8cwboto4rsv3ltyynvxrmvd` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKpq9fa53dfek6t3s1sjv4m0plc` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `FKevk09xnigyo8mvtgc59l1uc3b` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKhvq9xih03y656rmfmghfxym4w` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `shipping_country_zones`
--
ALTER TABLE `shipping_country_zones`
  ADD CONSTRAINT `FKfq5og92pfcx14wpqimy6cm7f3` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `FKs29uyy2abd9dt572p1u8ylb07` FOREIGN KEY (`shipping_zone_id`) REFERENCES `shipping_zones` (`id`);

--
-- Các ràng buộc cho bảng `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD CONSTRAINT `FKgh1qqt17uy7boc8f8dgyaenal` FOREIGN KEY (`shipping_zone_id`) REFERENCES `shipping_zones` (`id`);

--
-- Các ràng buộc cho bảng `shipping_zones`
--
ALTER TABLE `shipping_zones`
  ADD CONSTRAINT `FKj9e73dbvm96clp0qrubh90sj1` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKsryt5m2wxlmvqomukka58bakt` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `staff_accounts`
--
ALTER TABLE `staff_accounts`
  ADD CONSTRAINT `FK2w05mq0lpmivr2519iuiowve3` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FK8kt1rbp9uqo3us42qekqu2bwx` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKicmmixb56mmd16stkenpifr2q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `FKf018rv4htmcbcn4wjrpymxbme` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKfiw13lay8hy782gbnxojca2b8` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKjcuohexsi23vnpxi0t25kvwg7` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Các ràng buộc cho bảng `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `FK95bued017vcya4rf4s7n31ew4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  ADD CONSTRAINT `FKn6qk6crqtm5fuxuq8f5gsoggd` FOREIGN KEY (`variant_attribute_value_id`) REFERENCES `attribute_values` (`id`),
  ADD CONSTRAINT `FKn9smi9xs1bvsnqrn6knjvq9d9` FOREIGN KEY (`attribute_value_id`) REFERENCES `variants` (`id`);

--
-- Các ràng buộc cho bảng `variant_options`
--
ALTER TABLE `variant_options`
  ADD CONSTRAINT `FKp80xsi8rl51rtft29wsia24hq` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKqf4y59exjrgjqdl359joj02nv` FOREIGN KEY (`image_id`) REFERENCES `galleries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
