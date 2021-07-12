-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jul 2021 pada 04.14
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id` int(30) NOT NULL,
  `id_toko` int(30) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id`, `id_toko`, `Nama`) VALUES
(1, 1, 'YOG/1/Unit1'),
(2, 1, 'YOG/1/Unit2'),
(3, 2, 'YOG/2/Unit1'),
(4, 2, 'YOG/2/Unit2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(255) NOT NULL,
  `nama-kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
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
-- Struktur dari tabel `manajer`
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
-- Dumping data untuk tabel `manajer`
--

INSERT INTO `manajer` (`id`, `username`, `password`, `nama`, `id_toko`, `email`) VALUES
(1, 'muffron', '123456', 'Muhammad Fachri Ramadhan', 1, 'fahri279@gmail.com'),
(2, 'adabra', '123456', 'Adam Abraham', 2, 'adam@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
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
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `username`, `password`, `nama`, `shift`, `id_toko`, `manajer_id`, `email`) VALUES
(5, 'wahyukck', '123456', 'Wahyu Kirana', 'Pagi', 1, 1, 'Wahyu@gmail.com'),
(6, 'begeniro', '123456', 'Bambang P.', 'Siang', 1, 1, 'bambang@gmail.com'),
(7, 'keep-in', '123456', 'Kevin P.', 'Pagi', 2, 2, 'kevin@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(255) NOT NULL,
  `nama_produk` text NOT NULL,
  `kategori_id` int(255) NOT NULL,
  `harga_satuan` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `kategori_id`, `harga_satuan`) VALUES
(2, 'Aqua', 11, 2000),
(3, 'Sapu Rumah', 2, 25000),
(4, 'Lays', 8, 10000),
(5, 'Dairy Milk', 8, 28000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift_kasir`
--

CREATE TABLE `shift_kasir` (
  `id_pegawai` int(255) NOT NULL,
  `id_kasir` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shift_kasir`
--

INSERT INTO `shift_kasir` (`id_pegawai`, `id_kasir`) VALUES
(5, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id` int(255) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `lokasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id`, `nama`, `lokasi`) VALUES
(1, 'YOG/1', 'yogyakarta'),
(2, 'YOG/2', 'yogyakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(255) NOT NULL,
  `total_harga` int(30) NOT NULL,
  `jumlah` int(30) NOT NULL,
  `rating` int(30) NOT NULL,
  `metode` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_produk`
--

CREATE TABLE `transaksi_produk` (
  `id_produk` int(20) NOT NULL,
  `id_transaksi` int(20) NOT NULL,
  `jumlah_produk` int(20) NOT NULL,
  `subtotal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `manajer`
--
ALTER TABLE `manajer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_toko` (`id_toko`),
  ADD KEY `manajer_id` (`manajer_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`kategori_id`);

--
-- Indeks untuk tabel `shift_kasir`
--
ALTER TABLE `shift_kasir`
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `manajer`
--
ALTER TABLE `manajer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`);

--
-- Ketidakleluasaan untuk tabel `manajer`
--
ALTER TABLE `manajer`
  ADD CONSTRAINT `manajer_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`);

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`),
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`manajer_id`) REFERENCES `manajer` (`id`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);

--
-- Ketidakleluasaan untuk tabel `shift_kasir`
--
ALTER TABLE `shift_kasir`
  ADD CONSTRAINT `shift_kasir_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`),
  ADD CONSTRAINT `shift_kasir_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  ADD CONSTRAINT `transaksi_produk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `transaksi_produk_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
