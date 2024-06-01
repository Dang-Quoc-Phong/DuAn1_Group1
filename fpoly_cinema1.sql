-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 01, 2024 lúc 06:17 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fpoly_cinema1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `name`, `email`, `phone`, `role`) VALUES
(1, 'dangphong', '12345', 'Đặng Quốc Phong', 'phong@gmail.com', '000000000', 2),
(3, 'dangquocphong', '12345', 'Đặng Quốc Phong', 'phong@gmail.com', '0379797881', 0),
(11, 'admin', '12345', 'admin', 'admin@gmail.com', '', 0),
(12, 'nhanvien', '12345', 'Nhân Viên 1', 'nhanvien@fpt.edu.vn', '567894545', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cinema`
--

CREATE TABLE `cinema` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cinema`
--

INSERT INTO `cinema` (`id`, `name`) VALUES
(1, 'FPOLY Cinema');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date_comment` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `id_account`, `id_film`, `content`, `date_comment`) VALUES
(1, 3, 1, 'Phim ngắn thường được đánh giá cao khi truyền tải được những thông điệp sâu sắc, ý nghĩa về cuộc sống, tình yêu, gia đình, hay xã hội. ', '2023-11-10'),
(21, 3, 1, 'Diễn xuất của các diễn viên, dù trong thời lượng ngắn, cũng cần phải chân thật và thuyết phục.', '2023-11-28'),
(22, 3, 2, 'Các nhân vật cần được xây dựng rõ nét và có sự phát triển nhất định, giúp khán giả đồng cảm và kết nối với họ.', '2023-11-28'),
(23, 3, 2, 'Phim ngắn với hình ảnh đẹp, góc quay sáng tạo, và âm thanh sống động sẽ tạo được ấn tượng mạnh với khán giả. ', '2023-11-28'),
(24, 3, 1, 'Sự kết hợp hài hòa giữa âm thanh và hình ảnh giúp tăng cường cảm xúc và tạo ra những khoảnh khắc đáng nhớ.', '2023-11-28'),
(25, 3, 2, 'Một phim ngắn thành công thường có cốt truyện sáng tạo, cuốn hút khán giả ngay từ đầu và giữ được sự căng thẳng, hồi hộp cho đến cuối phim. Những phim này thường kết hợp các yếu tố bất ngờ và xoay chuyển tình tiết một cách thông minh.', '2023-11-28'),
(26, 3, 26, 'Nhiều phim ngắn được đánh giá cao nhờ tính sáng tạo và sự tự do trong cách thể hiện.', '2023-11-29'),
(27, 3, 26, 'Các nhà làm phim thường không bị ràng buộc bởi những quy tắc cố định, từ đó tạo ra những tác phẩm mới lạ và độc đáo.', '2023-11-29'),
(28, 3, 18, 'Một phim ngắn thành công phải biết cách tối ưu hóa thời gian, truyền tải câu chuyện một cách cô đọng nhưng vẫn đầy đủ ý nghĩa. ', '2023-12-04'),
(29, 3, 19, ' Thời lượng ngắn giúp phim giữ được nhịp độ nhanh và tránh được sự dàn trải, nhàm chán.', '2023-12-06'),
(30, 3, 26, 'Những phim này thường kết hợp các yếu tố bất ngờ và xoay chuyển tình tiết một cách thông minh.', '2023-12-11'),
(31, 3, 1, 'Một phim ngắn thành công thường có cốt truyện sáng tạo, cuốn hút khán giả ngay từ đầu và giữ được sự căng thẳng, hồi hộp cho đến cuối phim.', '2023-12-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL COMMENT 'mã phim',
  `name` varchar(255) NOT NULL COMMENT 'tên phim',
  `rel_date` date NOT NULL COMMENT 'ngày khởi chiếu',
  `id_genre` int(11) NOT NULL COMMENT 'thể loại phim',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `film`
--

INSERT INTO `film` (`id`, `name`, `rel_date`, `id_genre`, `image`) VALUES
(1, 'Doreamon: Vùng Đất Lý Tưởng Trên Bầu Trời', '2023-11-09', 1, '../uploads/doreamon.jpg'),
(2, 'Yêu Lại Vợ Ngầu', '2023-11-09', 2, '../uploads/yeulaivongau.jpg'),
(3, 'Transformers: Quái thú trỗi dậy', '2023-11-09', 5, '../uploads/transfomer.jpg'),
(4, 'The Conjuring', '2023-11-09', 3, '../uploads/conjuring.jpg'),
(15, 'Bỗng Dưng Trúng Số', '2023-11-09', 4, '../uploads/bongdungtrungso.jpg'),
(16, 'WOLFOO VÀ HÒN ĐẢO KỲ BÍ', '2023-11-09', 1, '../uploads/wolfoo.jpg'),
(17, 'NHÂN DUYÊN TIỀN ĐÌNH', '2023-11-09', 4, '../uploads/nhanduyentiendinh.jpg'),
(18, 'KỴ SĨ BÓNG ĐÊM TRỖI DẬY', '2023-11-09', 5, '../uploads/kysibongdemtroiday.jpg'),
(19, 'PAW PATROL: PHIM SIÊU ĐẲNG', '2023-11-09', 1, '../uploads/paw.jpg'),
(20, 'KẺ KIẾN TẠO', '2023-11-09', 4, '../uploads/kekientao.jpg'),
(21, 'THE MARVELS: BIỆT ĐỘI MARVEL', '2023-11-09', 5, '../uploads/themarvel.jpg'),
(22, 'QUỶ MÔN QUAN GỌI HỒN', '2023-11-09', 3, '../uploads/quymonquangoihon.jpg'),
(23, 'ÂM HỒN ĐÔ THỊ', '2023-11-09', 3, '../uploads/amhondothi.jpg'),
(24, 'ĐẤT RỪNG PHƯƠNG NAM', '2023-11-09', 2, '../uploads/datrungphuongnam.jpg'),
(25, 'MUÔN KIẾP NHÂN DUYÊN', '2023-11-09', 2, '../uploads/muonkiepnhanduyen.jpg'),
(26, 'Conan: Tàu Ngầm Sắt Màu Đen', '2023-11-09', 1, '../uploads/conan_taungausatmauden.jpg'),
(27, 'Thám Tử Pikachu', '2023-11-09', 1, '../uploads/thamtupikachu.jpg'),
(28, 'Tom&Jerry Quậy Tung New York', '2023-11-09', 1, '../uploads/tomandjerry.jpg'),
(29, 'Bố Già', '2023-11-09', 4, '../uploads/bogia.jpg'),
(30, 'Cô Giáo Em Là Số 1', '2023-11-09', 4, '../uploads/cogiaoemlaso1.jpg'),
(32, 'SIÊU LỪA GẶP SIÊU LẦY', '2023-11-09', 4, '../uploads/sieuluagapsieulay.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Phim hoạt hình'),
(2, 'Lãng Mạn'),
(3, 'Kinh dị'),
(4, 'Hài'),
(5, 'Bom tấn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_ticket`
--

CREATE TABLE `order_ticket` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_showTimeFrame` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `id_cinema` int(11) NOT NULL,
  `show_date` date NOT NULL,
  `seat_order` text NOT NULL,
  `price` float NOT NULL,
  `order_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `qr_code` text NOT NULL,
  `order_id` int(20) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_ticket`
--

INSERT INTO `order_ticket` (`id`, `id_account`, `id_showTimeFrame`, `id_film`, `id_room`, `id_cinema`, `show_date`, `seat_order`, `price`, `order_date`, `quantity`, `qr_code`, `order_id`, `status`) VALUES
(128, 1, 2, 1, 1, 1, '2023-11-09', 'A5, A6', 160000, '2023-11-29', 2, '', 0, 'Vé đã được in'),
(129, 1, 2, 1, 1, 1, '2023-11-09', 'B4, B5', 160000, '2023-11-29', 2, '', 0, 'Chờ thanh toán'),
(130, 1, 2, 1, 1, 1, '2023-11-09', 'C4, C5', 160000, '2023-11-29', 2, '', 0, 'Vé đã được in'),
(131, 1, 2, 3, 3, 1, '2023-11-09', 'A4, A5', 120000, '2023-11-29', 2, '', 0, 'Vé đã được in'),
(132, 1, 1, 2, 1, 1, '2023-11-09', 'C3, C4', 80000, '2023-11-29', 2, '', 0, 'Vé đã được in'),
(133, 1, 1, 26, 1, 1, '2023-11-09', 'A4, A5', 160000, '2023-11-29', 2, '', 0, 'Chờ thanh toán'),
(134, 1, 1, 26, 1, 1, '2023-11-09', 'C2, C3', 160000, '2023-11-29', 2, '', 0, 'Chờ thanh toán'),
(135, 13, 1, 26, 1, 1, '2023-11-09', 'B4, B5, B6, B7', 320000, '2023-11-29', 4, '', 0, 'Vé đã được in'),
(136, 12, 1, 26, 1, 1, '2023-11-09', 'A7, A8', 160000, '2023-11-29', 2, '', 0, 'Chờ thanh toán'),
(138, 13, 1, 19, 1, 1, '2023-11-09', 'A4, A5', 60000, '2023-11-29', 2, '', 0, 'Chờ thanh toán'),
(139, 13, 1, 19, 1, 1, '2023-11-09', 'B4, B5', 60000, '2023-11-29', 3, '', 0, 'Vé đã được in'),
(140, 1, 1, 1, 1, 1, '2023-11-09', 'A4, A5', 160000, '2023-11-29', 2, '', 0, 'Chờ thanh toán'),
(141, 1, 1, 26, 3, 1, '2023-11-09', 'B5, B6', 160000, '2023-11-30', 2, '', 0, 'Chờ thanh toán'),
(142, 1, 2, 1, 1, 1, '2023-11-09', 'C6, B6', 160000, '2023-12-01', 2, '', 0, 'Vé đã được in'),
(143, 1, 2, 1, 1, 1, '2023-11-09', 'C6, B6', 160000, '2023-12-01', 2, '', 0, 'Vé đã được in'),
(144, 1, 2, 1, 1, 1, '2023-11-09', 'C6, B6', 160000, '2023-12-01', 2, '', 0, 'Vé đã được in'),
(145, 1, 2, 1, 1, 1, '2023-11-09', 'C6, B6', 160000, '2023-12-01', 2, '', 0, 'Vé đã được in'),
(146, 1, 2, 1, 1, 1, '2023-11-09', 'C6, B6', 160000, '2023-12-01', 2, '', 1242352, 'Vé đã được in'),
(147, 1, 2, 26, 1, 1, '2023-11-09', 'B5, B6', 160000, '2023-12-02', 2, './images_qrcode/1701407799.png', 0, 'Vé đã được in'),
(148, 1, 1, 19, 1, 1, '2023-11-09', 'C6, C7', 60000, '2023-12-01', 2, './images_qrcode/1701415920.png', 0, 'Vé đã được in'),
(149, 1, 2, 3, 1, 1, '2023-11-09', 'B5, B6', 120000, '2023-12-03', 3, './images_qrcode/1701575890.png', 0, 'Vé đã được in'),
(150, 1, 2, 3, 1, 1, '2023-11-09', 'B3, B4', 120000, '2023-12-03', 2, './images_qrcode/1701576311.png', 0, 'Vé đã được in'),
(151, 1, 2, 3, 1, 1, '2023-11-09', 'B7, B8', 120000, '2023-12-03', 2, './images_qrcode/1701576486.png', 0, 'Vé đã được in'),
(152, 1, 1, 19, 1, 1, '2023-11-09', 'C3, C4', 60000, '2023-12-04', 2, './images_qrcode/1701676167.png', 63452313, 'Vé đã được in'),
(153, 1, 2, 21, 1, 1, '2023-11-09', 'A4, A5, A6, A7', 480000, '2023-12-04', 4, './images_qrcode/1701676999.png', 5658324, 'Vé đã được in'),
(154, 14, 2, 21, 1, 1, '2023-11-09', 'B3, B4', 240000, '2023-12-05', 2, '', 867832424, 'Chờ thanh toán'),
(163, 1, 3, 19, 3, 1, '2023-11-10', 'A5, A6', 60000, '2023-12-10', 2, './images_qrcode/1702261245.png', 1702261245, 'Chờ thanh toán'),
(165, 1, 2, 21, 1, 1, '2023-11-09', 'A4, A5, A6, A7', 480000, '2023-12-11', 4, './images_qrcode/1702262442.png', 1702262406, 'Vé đã được in'),
(166, 1, 3, 18, 3, 1, '2023-11-09', 'B4, B5, B6', 195000, '2023-12-11', 3, './images_qrcode/1702262500.png', 1702262500, 'Chờ thanh toán'),
(167, 1, 1, 29, 1, 1, '2023-11-09', 'A1', 120000, '2023-12-11', 1, './images_qrcode/1702271370.png', 1702271339, 'Đã thanh toán'),
(168, 1, 2, 4, 1, 1, '2023-11-09', 'A4, A5', 200000, '2023-12-11', 2, './images_qrcode/1702271502.png', 1702271502, 'Vé đã được in'),
(169, 14, 2, 21, 1, 1, '2023-11-09', 'B5, B6', 240000, '2023-12-11', 2, './images_qrcode/1702276492.png', 1702276446, 'Vé đã được in'),
(170, 14, 1, 1, 2, 1, '2023-11-10', 'A5, A6', 160000, '2023-12-11', 2, './images_qrcode/1702277074.png', 1702277074, 'Chờ thanh toán'),
(171, 1, 1, 1, 1, 1, '2023-11-09', 'A6, A7', 160000, '2023-12-11', 2, './images_qrcode/1702279134.png', 1702279134, 'Chờ thanh toán'),
(172, 14, 1, 1, 1, 1, '2023-11-09', 'A6, A7', 160000, '2023-12-11', 2, './images_qrcode/1702279149.png', 1702279149, 'Chờ thanh toán'),
(173, 14, 1, 19, 1, 1, '2023-11-09', 'B6, B7', 60000, '2023-12-11', 2, './images_qrcode/1702310406.png', 1702310354, 'Đã thanh toán'),
(174, 1, 1, 1, 1, 1, '2023-11-09', 'D4, D5, D6, D7', 320000, '2024-01-05', 4, './images_qrcode/1704473635.png', 1704473598, 'Vé đã được in'),
(175, 1, 1, 1, 1, 1, '2023-11-09', 'B4, B5, B3, B2', 320000, '2024-01-05', 6, './images_qrcode/1704473940.png', 1704473902, 'Đã thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_momo`
--

CREATE TABLE `payment_momo` (
  `id_momo` int(11) NOT NULL,
  `partner_code` varchar(50) NOT NULL,
  `order_id` int(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `order_info` varchar(100) NOT NULL,
  `order_type` varchar(50) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `pay_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_momo`
--

INSERT INTO `payment_momo` (`id_momo`, `partner_code`, `order_id`, `amount`, `order_info`, `order_type`, `trans_id`, `pay_type`) VALUES
(5, 'MOMOBKUN20180529', 1700907339, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(6, 'MOMOBKUN20180529', 1701235455, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(7, 'MOMOBKUN20180529', 1701243518, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(8, 'MOMOBKUN20180529', 1701244785, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(9, 'MOMOBKUN20180529', 1701406084, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(10, 'MOMOBKUN20180529', 1701406084, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(11, 'MOMOBKUN20180529', 1701406084, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(12, 'MOMOBKUN20180529', 1701406539, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(13, 'MOMOBKUN20180529', 1701406716, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(14, 'MOMOBKUN20180529', 1701407764, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(15, 'MOMOBKUN20180529', 1701415887, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(16, 'MOMOBKUN20180529', 1701575840, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(17, 'MOMOBKUN20180529', 1701576265, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(18, 'MOMOBKUN20180529', 1701576453, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(19, 'MOMOBKUN20180529', 1701676131, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(20, 'MOMOBKUN20180529', 1701676764, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(21, 'MOMOBKUN20180529', 1701912859, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(22, 'MOMOBKUN20180529', 1701912859, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(23, 'MOMOBKUN20180529', 1701912859, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(24, 'MOMOBKUN20180529', 1701912859, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(25, 'MOMOBKUN20180529', 1701912859, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(26, 'MOMOBKUN20180529', 1701924813, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(27, 'MOMOBKUN20180529', 1701927227, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(28, 'MOMOBKUN20180529', 1702261353, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(29, 'MOMOBKUN20180529', 1702262406, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(30, 'MOMOBKUN20180529', 1702271339, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(31, 'MOMOBKUN20180529', 1702276446, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(32, 'MOMOBKUN20180529', 1702310354, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(33, 'MOMOBKUN20180529', 1704473598, '10000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas'),
(34, 'MOMOBKUN20180529', 1704473902, '320000', 'Thanh toán qua MoMo', 'momo_wallet', 2147483647, 'napas');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room`
--

INSERT INTO `room` (`id`, `name`, `id_seat`) VALUES
(1, 'Phòng Chiếu 1', 1),
(2, 'Phòng Chiếu 2', 2),
(3, 'Phòng Chiếu 3\r\n', 3),
(4, 'Phòng Chiếu 4\r\n', 4),
(5, 'Phòng Chiếu 5\r\n', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `show_film`
--

CREATE TABLE `show_film` (
  `id` int(11) NOT NULL,
  `show_date` date DEFAULT NULL,
  `id_film` int(11) NOT NULL,
  `id_showTimeFrame` int(11) NOT NULL,
  `id_cinema` int(11) NOT NULL,
  `id_room` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `show_film`
--

INSERT INTO `show_film` (`id`, `show_date`, `id_film`, `id_showTimeFrame`, `id_cinema`, `id_room`) VALUES
(28, '2023-11-09', 1, 1, 1, 1),
(29, '2023-11-09', 1, 2, 1, 1),
(30, '2023-11-09', 1, 3, 1, 1),
(32, '2023-11-09', 1, 4, 1, 1),
(33, '2023-11-09', 1, 5, 1, 1),
(34, '2023-11-09', 1, 1, 1, 2),
(36, '2023-11-09', 1, 2, 1, 2),
(37, '2023-11-09', 1, 3, 1, 2),
(38, '2023-11-09', 1, 1, 0, 4),
(40, '2023-11-09', 1, 3, 1, 5),
(41, '2023-11-09', 2, 1, 1, 1),
(42, '2023-11-09', 2, 2, 1, 1),
(43, '2023-11-09', 2, 3, 1, 2),
(44, '2023-11-09', 2, 4, 1, 2),
(45, '2023-11-09', 2, 5, 1, 2),
(46, '2023-11-09', 2, 2, 1, 3),
(47, '2023-11-09', 2, 3, 1, 3),
(48, '2023-11-09', 2, 1, 1, 3),
(49, '2023-11-09', 2, 2, 1, 4),
(50, '2023-11-09', 2, 3, 1, 5),
(51, '2023-11-09', 3, 1, 1, 1),
(52, '2023-11-09', 3, 2, 1, 1),
(53, '2023-11-09', 3, 3, 1, 1),
(55, '2023-11-09', 3, 4, 1, 2),
(56, '2023-11-09', 3, 4, 1, 3),
(57, '2023-11-09', 3, 4, 1, 2),
(59, '2023-11-09', 3, 2, 1, 3),
(60, '2023-11-09', 3, 4, 1, 5),
(61, '2023-11-09', 3, 5, 1, 5),
(62, '2023-11-09', 3, 2, 1, 2),
(63, '2023-11-09', 3, 2, 1, 3),
(64, '2023-11-09', 3, 4, 1, 3),
(65, '2023-11-09', 3, 1, 1, 4),
(66, '2023-11-09', 3, 2, 1, 5),
(67, '2023-11-09', 4, 1, 1, 1),
(68, '2023-11-09', 4, 2, 1, 1),
(69, '2023-11-09', 4, 3, 1, 2),
(70, '2023-11-09', 4, 5, 1, 2),
(71, '2023-11-10', 26, 1, 1, 1),
(72, '2023-11-10', 26, 2, 0, 1),
(73, '2023-11-10', 26, 3, 1, 3),
(74, '2023-11-10', 26, 1, 1, 2),
(75, '2023-11-10', 26, 3, 1, 4),
(76, '2023-11-10', 19, 1, 1, 1),
(77, '2023-11-10', 19, 2, 0, 1),
(78, '2023-11-10', 19, 3, 1, 1),
(79, '2023-11-10', 19, 1, 1, 2),
(80, '2023-11-10', 19, 2, 1, 2),
(81, '2023-11-10', 19, 5, 1, 2),
(82, '2023-11-10', 19, 1, 1, 4),
(83, '2023-11-10', 1, 2, 1, 4),
(84, '2023-11-10', 19, 5, 1, 4),
(85, '2023-11-10', 19, 2, 1, 5),
(86, '2023-11-10', 19, 3, 1, 5),
(87, '2023-11-11', 18, 1, 1, 1),
(88, '2023-11-11', 18, 2, 1, 1),
(89, '2023-11-11', 18, 1, 1, 2),
(90, '2023-11-11', 18, 5, 1, 2),
(91, '2023-11-11', 18, 5, 1, 1),
(92, '2023-11-11', 18, 2, 1, 4),
(93, '2023-11-10', 26, 3, 1, 4),
(94, '2023-11-11', 18, 3, 1, 3),
(95, '2023-11-11', 18, 4, 1, 3),
(96, '2023-11-11', 18, 5, 1, 4),
(97, '2023-11-11', 18, 1, 0, 5),
(98, '2023-11-11', 18, 5, 1, 5),
(99, '2023-11-12', 21, 1, 1, 1),
(100, '2023-11-12', 21, 2, 1, 1),
(101, '2023-11-12', 21, 4, 1, 1),
(102, '2023-11-12', 21, 1, 1, 2),
(103, '2023-11-12', 21, 3, 1, 2),
(104, '2023-11-12', 21, 4, 1, 2),
(105, '2023-11-12', 21, 1, 1, 3),
(106, '2023-11-12', 21, 2, 1, 3),
(107, '2023-11-12', 21, 2, 1, 4),
(108, '2023-11-12', 21, 3, 1, 4),
(109, '2023-11-12', 21, 4, 1, 4),
(110, '2023-11-12', 21, 2, 1, 5),
(111, '2023-11-12', 21, 3, 1, 5),
(112, '2023-11-12', 21, 4, 1, 5),
(113, '2023-11-12', 21, 5, 1, 5),
(114, '2023-11-09', 3, 5, 1, 4),
(115, '2023-11-09', 24, 2, 1, 4),
(116, '2023-11-09', 2, 1, 1, 1),
(117, '2023-11-09', 2, 2, 1, 1),
(118, '2023-11-09', 2, 4, 1, 2),
(119, '2023-11-09', 2, 3, 1, 2),
(120, '2023-11-09', 2, 5, 1, 3),
(121, '2023-11-09', 2, 2, 1, 3),
(122, '2023-11-09', 2, 3, 1, 4),
(123, '2023-11-09', 2, 2, 1, 4),
(124, '2023-11-09', 2, 3, 1, 4),
(125, '2023-11-09', 2, 2, 1, 5),
(126, '2023-11-09', 2, 4, 1, 5),
(127, '2023-11-09', 2, 3, 1, 5),
(128, '2023-11-09', 2, 3, 1, 5),
(129, '2023-11-09', 3, 1, 1, 1),
(130, '2023-11-09', 3, 2, 1, 1),
(131, '2023-11-09', 3, 2, 1, 1),
(132, '2023-11-09', 3, 2, 1, 2),
(133, '2023-11-09', 3, 3, 1, 2),
(134, '2023-11-09', 3, 3, 1, 3),
(135, '2023-11-09', 3, 5, 1, 3),
(136, '2023-11-09', 3, 2, 1, 4),
(137, '2023-11-09', 3, 1, 1, 2),
(138, '2023-11-09', 3, 3, 1, 4),
(139, '2023-11-09', 3, 5, 1, 5),
(140, '2023-11-09', 3, 1, 1, 5),
(141, '2023-11-09', 4, 1, 1, 1),
(142, '2023-11-09', 4, 2, 1, 1),
(143, '2023-11-09', 4, 3, 1, 1),
(144, '2023-11-09', 3, 5, 1, 1),
(145, '2023-11-09', 3, 1, 1, 2),
(146, '2023-11-09', 4, 3, 1, 2),
(147, '2023-11-09', 4, 5, 1, 2),
(148, '2023-11-09', 4, 3, 1, 3),
(149, '2023-11-09', 4, 1, 1, 3),
(150, '2023-11-09', 4, 2, 1, 3),
(151, '2023-11-09', 4, 5, 1, 3),
(152, '2023-11-09', 4, 3, 1, 4),
(153, '2023-11-09', 4, 1, 1, 4),
(154, '2023-11-09', 4, 5, 1, 4),
(155, '2023-11-09', 4, 5, 1, 5),
(156, '2023-11-09', 4, 3, 1, 5),
(157, '2023-11-09', 4, 2, 1, 5),
(158, '2023-11-09', 15, 1, 1, 1),
(159, '2023-11-09', 15, 2, 1, 1),
(160, '2023-11-09', 15, 3, 1, 1),
(161, '2023-11-09', 15, 1, 1, 2),
(162, '2023-11-09', 15, 3, 1, 2),
(163, '2023-11-09', 15, 1, 1, 3),
(164, '2023-11-09', 15, 5, 1, 3),
(165, '2023-11-09', 15, 4, 1, 3),
(166, '2023-11-09', 15, 1, 1, 4),
(167, '2023-11-09', 15, 2, 1, 4),
(168, '2023-11-09', 15, 3, 1, 4),
(169, '2023-11-09', 15, 1, 1, 5),
(170, '2023-11-09', 15, 2, 1, 4),
(171, '2023-11-09', 15, 3, 1, 5),
(172, '2023-11-09', 15, 4, 1, 5),
(173, '2023-11-09', 17, 1, 1, 1),
(174, '2023-11-09', 17, 2, 1, 1),
(175, '2023-11-09', 17, 3, 1, 1),
(176, '2023-11-09', 17, 2, 1, 2),
(177, '2023-11-09', 17, 1, 1, 2),
(178, '2023-11-09', 17, 1, 1, 3),
(179, '2023-11-09', 17, 2, 1, 3),
(180, '2023-11-09', 17, 2, 1, 3),
(181, '2023-11-09', 17, 1, 1, 4),
(182, '2023-11-09', 17, 5, 1, 4),
(183, '2023-11-09', 17, 5, 1, 4),
(184, '2023-11-09', 17, 1, 1, 5),
(185, '2023-11-09', 17, 2, 1, 5),
(186, '2023-11-09', 17, 3, 1, 5),
(187, '2023-11-09', 17, 3, 1, 5),
(188, '2023-11-09', 17, 5, 1, 5),
(189, '2023-11-09', 20, 5, 1, 5),
(190, '2023-11-09', 26, 1, 1, 1),
(191, '2023-11-09', 26, 3, 1, 4),
(192, '2023-11-09', 1, 4, 1, 4),
(193, '2023-11-09', 1, 2, 1, 4),
(194, '2023-11-09', 26, 1, 1, 1),
(195, '2023-11-09', 26, 2, 1, 1),
(196, '2023-11-09', 26, 3, 1, 2),
(197, '2023-11-09', 26, 5, 1, 2),
(198, '2023-11-09', 26, 1, 1, 3),
(199, '2023-11-09', 26, 2, 1, 3),
(200, '2023-11-09', 26, 4, 1, 4),
(201, '2023-11-09', 26, 4, 1, 5),
(202, '2023-11-10', 26, 2, 1, 5),
(203, '2023-11-09', 19, 1, 1, 1),
(204, '2023-11-09', 19, 2, 1, 2),
(205, '2023-11-09', 19, 3, 1, 3),
(206, '2023-11-09', 19, 4, 1, 4),
(207, '2023-11-09', 19, 5, 1, 5),
(208, '2023-11-10', 19, 3, 1, 3),
(209, '2023-11-10', 1, 2, 1, 1),
(210, '2023-11-10', 1, 1, 1, 2),
(211, '2023-11-10', 1, 1, 1, 2),
(212, '2023-11-10', 1, 3, 1, 5),
(213, '2023-11-10', 1, 1, 1, 3),
(214, '2023-11-09', 18, 3, 1, 1),
(215, '2023-11-09', 18, 2, 1, 2),
(216, '2023-11-09', 18, 3, 1, 3),
(217, '2023-11-09', 18, 5, 1, 4),
(218, '2023-11-09', 18, 4, 1, 5),
(219, '2023-11-09', 21, 1, 1, 1),
(220, '2023-11-09', 21, 2, 1, 1),
(221, '2023-11-09', 21, 3, 1, 2),
(222, '2023-11-09', 21, 4, 1, 2),
(223, '2023-11-09', 21, 3, 1, 3),
(224, '2023-11-09', 21, 4, 1, 3),
(225, '2023-11-09', 21, 5, 1, 4),
(226, '2023-11-09', 21, 4, 1, 5),
(227, '2023-11-09', 25, 1, 1, 1),
(228, '2023-11-09', 25, 2, 1, 1),
(229, '2023-11-09', 25, 3, 1, 2),
(230, '2023-11-09', 25, 4, 1, 3),
(231, '2023-11-09', 25, 5, 1, 3),
(232, '2023-11-09', 25, 2, 1, 5),
(233, '2023-11-09', 25, 2, 1, 4),
(234, '2023-11-09', 23, 1, 1, 1),
(235, '2023-11-09', 23, 2, 1, 2),
(236, '2023-11-09', 23, 4, 1, 3),
(237, '2023-11-09', 23, 4, 1, 4),
(238, '2023-11-09', 23, 2, 1, 5),
(239, '2023-11-09', 29, 1, 1, 1),
(240, '2023-11-09', 29, 2, 1, 2),
(241, '2023-11-09', 29, 3, 1, 3),
(242, '2023-11-09', 29, 4, 1, 4),
(243, '2023-11-09', 29, 5, 1, 5),
(244, '2023-11-09', 30, 1, 1, 1),
(245, '2023-11-09', 30, 2, 1, 2),
(246, '2023-11-09', 30, 3, 1, 3),
(247, '2023-11-09', 30, 4, 1, 4),
(248, '2023-11-09', 30, 5, 1, 5),
(249, '2023-11-09', 32, 1, 1, 1),
(250, '2023-11-09', 32, 2, 1, 2),
(251, '2023-11-09', 32, 3, 1, 3),
(252, '2023-11-09', 32, 4, 1, 4),
(253, '2023-11-09', 32, 5, 1, 5),
(254, '2023-11-09', 22, 1, 1, 1),
(255, '2023-11-09', 22, 2, 1, 2),
(256, '2023-11-09', 22, 3, 1, 3),
(257, '2023-11-09', 22, 4, 1, 4),
(258, '2023-11-09', 22, 5, 1, 5),
(259, '2023-12-11', 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `show_time_frame`
--

CREATE TABLE `show_time_frame` (
  `id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `show_time_frame`
--

INSERT INTO `show_time_frame` (`id`, `start_time`, `end_time`) VALUES
(1, '14:00:00', '16:00:00'),
(2, '16:00:00', '18:00:00'),
(3, '18:00:00', '20:00:00'),
(4, '20:00:00', '22:00:00'),
(5, '22:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`id`, `price`, `id_film`) VALUES
(1, 80000, 1),
(2, 40000, 2),
(9, 60000, 3),
(10, 100000, 4),
(11, 50000, 15),
(12, 60000, 16),
(13, 80000, 17),
(14, 65000, 18),
(15, 30000, 19),
(16, 100000, 20),
(17, 120000, 21),
(18, 50000, 22),
(21, 70000, 24),
(22, 70000, 25),
(23, 80000, 26),
(24, 90000, 27),
(25, 100000, 28),
(26, 120000, 29),
(27, 150000, 30),
(28, 50000, 32);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_ticket`
--
ALTER TABLE `order_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_momo`
--
ALTER TABLE `payment_momo`
  ADD PRIMARY KEY (`id_momo`);

--
-- Chỉ mục cho bảng `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `show_film`
--
ALTER TABLE `show_film`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `show_time_frame`
--
ALTER TABLE `show_time_frame`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã phim', AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order_ticket`
--
ALTER TABLE `order_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT cho bảng `payment_momo`
--
ALTER TABLE `payment_momo`
  MODIFY `id_momo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `show_film`
--
ALTER TABLE `show_film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT cho bảng `show_time_frame`
--
ALTER TABLE `show_time_frame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
