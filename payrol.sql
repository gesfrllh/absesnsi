-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2023 at 03:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payrol`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `nip`, `waktu`, `keterangan`) VALUES
(1, '123', '2021-01-14 15:44:29', 'masuk'),
(2, '123', '2021-01-14 15:44:33', 'pulang'),
(3, '123', '2021-01-14 17:28:13', 'masuk'),
(4, '123', '2021-01-14 17:28:34', 'pulang'),
(5, '123', '2022-04-09 07:44:59', 'masuk'),
(6, '122', '2022-04-20 08:00:06', 'masuk'),
(7, '1123', '2022-04-20 08:05:24', 'masuk'),
(8, '123', '2022-04-20 08:31:02', 'masuk'),
(9, '001', '2022-04-26 09:19:18', 'masuk'),
(10, '002', '2022-04-26 09:19:41', 'masuk'),
(11, '003', '2022-04-26 09:19:54', 'masuk'),
(12, '004', '2022-04-26 09:20:08', 'masuk'),
(13, '005', '2022-04-26 09:20:21', 'masuk'),
(14, '001', '2022-04-26 09:22:17', 'pulang'),
(15, '001', '2022-04-27 15:42:21', 'masuk');

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id_cuti` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `jenis_cuti` enum('cuti','izin','sakit') NOT NULL,
  `bukti` varchar(254) DEFAULT NULL,
  `alasan` text NOT NULL,
  `status` enum('diajukan','diterima','ditolak') NOT NULL,
  `waktu_pengajuan` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cuti`
--

INSERT INTO `cuti` (`id_cuti`, `nip`, `jenis_cuti`, `bukti`, `alasan`, `status`, `waktu_pengajuan`) VALUES
(1, '123', 'sakit', 'nihiwatu.jpg', 'testing', 'diterima', '2021-01-14 17:14:54'),
(2, '123', 'sakit', 'Photo.jpg', 'sakit', 'diterima', '2022-04-09 07:46:28'),
(3, '122', 'sakit', 'KTP_Hasan_Basri.jpg', 'sakit', 'diterima', '2022-04-20 08:00:47'),
(4, '1123', 'izin', NULL, 'pergi', 'ditolak', '2022-04-20 08:05:53'),
(5, '001', 'sakit', 'Photo.jpg', 'sakit bos', 'diterima', '2022-04-26 09:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `departemen_id` int(11) NOT NULL,
  `departemen` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`departemen_id`, `departemen`) VALUES
(1, 'Operasional'),
(2, 'Produksi'),
(6, 'Alih Media');

-- --------------------------------------------------------

--
-- Table structure for table `detailcuti`
--

CREATE TABLE `detailcuti` (
  `id_detail` int(11) NOT NULL,
  `id_cuti` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailcuti`
--

INSERT INTO `detailcuti` (`id_detail`, `id_cuti`, `tanggal`) VALUES
(1, 1, '2021-01-15'),
(2, 1, '2021-01-16'),
(3, 2, '2022-04-09'),
(4, 2, '2022-04-10'),
(5, 2, '2022-04-11'),
(6, 2, '2022-04-12'),
(7, 3, '2022-04-21'),
(8, 3, '2022-04-22'),
(9, 4, '2022-04-21'),
(10, 4, '2022-04-22'),
(11, 5, '2022-04-27'),
(12, 5, '2022-04-28');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `waktu_masuk` date NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `gaji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `jenis_kelamin`, `waktu_masuk`, `id_departemen`, `gaji`) VALUES
('001', 'L', '2021-12-01', 6, 150000),
('002', 'L', '2021-12-01', 6, 100000),
('003', 'L', '2021-12-01', 2, 80000),
('004', 'L', '2021-12-01', 2, 80000),
('005', 'L', '2021-12-01', 1, 60000),
('1123', 'L', '2022-04-19', 6, 100000),
('1141', 'P', '2020-12-01', 2, 100000),
('122', 'L', '2022-04-19', 6, 50000),
('123', 'L', '2020-12-01', 1, 90000),
('13424', 'L', '2021-01-01', 2, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(254) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `level` enum('admin','pegawai') NOT NULL,
  `nip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `nama`, `email`, `password`, `level`, `nip`) VALUES
(1, 'Administrator', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', NULL),
(10, 'Danang', 'danang@gmail.com', 'dc5c7986daef50c1e02ab09b442ee34f', 'pegawai', '001'),
(11, 'Restu', 'restu@gmail.com', '93dd4de5cddba2c733c65f233097f05a', 'pegawai', '002'),
(12, 'Arya', 'arya@gmail.com', 'e88a49bccde359f0cabb40db83ba6080', 'pegawai', '003'),
(14, 'Reza', 'reza@gmail.com', '11364907cf269dd2183b64287156072a', 'pegawai', '004'),
(15, 'Muchtar', 'muchtar@gmail.com', 'ce08becc73195df12d99d761bfbba68d', 'pegawai', '005');

-- --------------------------------------------------------

--
-- Table structure for table `web`
--

CREATE TABLE `web` (
  `id_web` int(11) NOT NULL,
  `logo` varchar(254) NOT NULL,
  `nama` varchar(254) NOT NULL,
  `author` varchar(254) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web`
--

INSERT INTO `web` (`id_web`, `logo`, `nama`, `author`, `alamat`, `nohp`, `email`) VALUES
(1, 'fingerprint.png', 'E - Absensi', 'Restu Satria Purnama | PT Aslamindo Mitra Lestari', 'Jl. Rawajati Timur 1 No. 9 Kalibata Jakarta Selatan.', '081267789400', 'restu@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`departemen_id`);

--
-- Indexes for table `detailcuti`
--
ALTER TABLE `detailcuti`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `web`
--
ALTER TABLE `web`
  ADD PRIMARY KEY (`id_web`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cuti`
--
ALTER TABLE `cuti`
  MODIFY `id_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `departemen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detailcuti`
--
ALTER TABLE `detailcuti`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `web`
--
ALTER TABLE `web`
  MODIFY `id_web` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
