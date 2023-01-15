-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jan 2023 pada 09.42
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbinventarisaset`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris_barang_keluar`
--

CREATE TABLE `inventaris_barang_keluar` (
  `kd_barang` int(10) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kondisi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `inventaris_barang_keluar`
--

INSERT INTO `inventaris_barang_keluar` (`kd_barang`, `nama_barang`, `tanggal_masuk`, `tanggal_keluar`, `jumlah`, `kondisi`) VALUES
(1150, 'Kursi Plastik', '2020-10-25', '2021-01-18', 6, 'Baik'),
(1312, 'Lemari Kayu', '2016-07-13', '2020-05-18', 3, 'Rusak Berat'),
(1325, 'lemari Besi', '2023-01-14', '2023-01-20', 55, 'Baik');

--
-- Trigger `inventaris_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `keluar` AFTER INSERT ON `inventaris_barang_keluar` FOR EACH ROW BEGIN
UPDATE inventaris_barang_masuk set jumlah=jumlah-NEW.jumlah
WHERE kd_barang=NEW.kd_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris_barang_masuk`
--

CREATE TABLE `inventaris_barang_masuk` (
  `kd_barang` int(10) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jumlah` int(15) NOT NULL,
  `kondisi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `inventaris_barang_masuk`
--

INSERT INTO `inventaris_barang_masuk` (`kd_barang`, `nama_barang`, `tanggal_masuk`, `jumlah`, `kondisi`) VALUES
(1101, 'Laptop Acer', '2022-03-20', 25, 'Baik'),
(1103, 'Printer Epson L210', '2021-05-13', 15, 'Baik'),
(1109, 'Meja Kerja kantor', '2021-06-09', 10, 'Rusak Ringan'),
(1121, 'Kipas Angin', '2023-01-14', 25, 'Baik');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `inventaris_barang_keluar`
--
ALTER TABLE `inventaris_barang_keluar`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `inventaris_barang_masuk`
--
ALTER TABLE `inventaris_barang_masuk`
  ADD PRIMARY KEY (`kd_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
