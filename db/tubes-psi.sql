-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 05:20 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes-psi`
--

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id` int(30) NOT NULL,
  `id_toko` int(30) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id`, `id_toko`, `Nama`) VALUES
(1, 1, 'YOG/1/Unit1'),
(2, 1, 'YOG/1/Unit2'),
(3, 2, 'YOG/2/Unit1'),
(4, 2, 'YOG/2/Unit2');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(255) NOT NULL,
  `nama-kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama-kategori`) VALUES
(1, 'Kitchen Utensil'),
(2, 'Household Ware'),
(3, 'Milk and Baby Foods'),
(4, 'Baby Need'),
(5, 'Toileties'),
(6, 'Cosmetic'),
(7, 'Medicine'),
(8, 'Snack'),
(9, 'Cooking Needs'),
(10, 'Meats and Fish'),
(11, 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `manajer`
--

CREATE TABLE `manajer` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_toko` int(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manajer`
--

INSERT INTO `manajer` (`id`, `username`, `password`, `nama`, `id_toko`, `email`) VALUES
(1, 'muffron', '123456', 'Muhammad Fachri Ramadhan', 1, 'fahri279@gmail.com'),
(2, 'adabra', '123456', 'Adam Abraham', 2, 'adam@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` text NOT NULL,
  `shift` text NOT NULL,
  `id_toko` int(255) NOT NULL,
  `manajer_id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `username`, `password`, `nama`, `shift`, `id_toko`, `manajer_id`, `email`) VALUES
(5, 'wahyukck', '123456', 'Wahyu Kirana', 'Pagi', 1, 1, 'Wahyu@gmail.com'),
(6, 'begeniro', '123456', 'Bambang P.', 'Siang', 1, 1, 'bambang@gmail.com'),
(7, 'keep-in', '123456', 'Kevin P.', 'Pagi', 2, 2, 'kevin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(255) NOT NULL,
  `nama_produk` text NOT NULL,
  `kategori_id` int(255) NOT NULL,
  `harga_satuan` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `kategori_id`, `harga_satuan`) VALUES
(2, 'Aqua', 11, 2000),
(3, 'Sapu Rumah', 2, 25000),
(4, 'Lays', 8, 10000),
(5, 'Dairy Milk', 8, 28000),
(6, 'Paracetamol', 7, 5000),
(7, 'Daging Sapi 1kg', 10, 50000),
(10, 'Sendok Selusin', 1, 20000),
(11, 'Dancow', 3, 35000),
(12, 'Pampers Popok', 4, 40000),
(13, 'Tisu Toilet', 5, 10000),
(14, 'Maybelline Lipstick', 6, 90000),
(15, 'Sania 1L', 9, 15000),
(16, 'Bimoli 1L', 9, 15500);

-- --------------------------------------------------------

--
-- Table structure for table `shift_kasir`
--

CREATE TABLE `shift_kasir` (
  `id_pegawai` int(255) NOT NULL,
  `id_kasir` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift_kasir`
--

INSERT INTO `shift_kasir` (`id_pegawai`, `id_kasir`) VALUES
(5, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` int(255) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `lokasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `nama`, `lokasi`) VALUES
(1, 'YOG/1', 'yogyakarta'),
(2, 'YOG/2', 'yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(255) NOT NULL,
  `total_harga` int(30) NOT NULL,
  `jumlah` int(30) NOT NULL,
  `rating` int(30) NOT NULL,
  `metode` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `total_harga`, `jumlah`, `rating`, `metode`, `tanggal`) VALUES
(1, 10000, 5, 0, 'Cash', '2021-01-01'),
(2, 45000, 3, 0, 'Cash', '2021-02-01'),
(3, 0, 0, 0, 'Cash', '2021-03-01'),
(4, 0, 0, 0, 'Cash', '2021-04-01'),
(5, 0, 0, 0, 'E-Money', '2021-05-01'),
(6, 0, 0, 0, 'Kartu', '2021-06-01'),
(7, 0, 0, 0, 'E-Money', '2021-07-01'),
(8, 0, 0, 0, 'Cash', '2021-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_produk`
--

CREATE TABLE `transaksi_produk` (
  `id_produk` int(20) NOT NULL,
  `id_transaksi` int(20) NOT NULL,
  `jumlah_produk` int(20) NOT NULL,
  `subtotal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_produk`
--

INSERT INTO `transaksi_produk` (`id_produk`, `id_transaksi`, `jumlah_produk`, `subtotal`) VALUES
(2, 1, 5, 10000),
(3, 2, 1, 25000),
(4, 2, 2, 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manajer`
--
ALTER TABLE `manajer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_toko` (`id_toko`),
  ADD KEY `manajer_id` (`manajer_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`kategori_id`);

--
-- Indexes for table `shift_kasir`
--
ALTER TABLE `shift_kasir`
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `manajer`
--
ALTER TABLE `manajer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`);

--
-- Constraints for table `manajer`
--
ALTER TABLE `manajer`
  ADD CONSTRAINT `manajer_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`),
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`manajer_id`) REFERENCES `manajer` (`id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);

--
-- Constraints for table `shift_kasir`
--
ALTER TABLE `shift_kasir`
  ADD CONSTRAINT `shift_kasir_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`),
  ADD CONSTRAINT `shift_kasir_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id`);

--
-- Constraints for table `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  ADD CONSTRAINT `transaksi_produk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `transaksi_produk_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
