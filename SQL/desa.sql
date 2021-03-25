-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 02:34 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `desa`
--

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `nik` varchar(16) NOT NULL,
  `no_kk` varchar(16) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `tempat_lahir` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(12) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `pekerjaan` varchar(25) NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`nik`, `no_kk`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `agama`, `gol_darah`, `status`, `pekerjaan`, `no_hp`) VALUES
('1234567890123456', '7202221234560002', 'Arafat', 'Poso', '2000-03-03', 'Laki-laki', 'Poso', 'Islam', 'O', 'Belum Menikah', 'Polisi', '08123456789'),
('7202220602410002', '1234567890123456', 'Aco', 'Palu', '2002-03-21', 'Laki-laki', 'Yos Sudarso', 'Katolik', 'AB', 'Belum Menikah', 'Software Engineer', '085394933612'),
('7202221234560000', '7202221234560003', 'Foto', 'Poso', '2021-03-18', 'Perempuan', 'Patimura', 'Kristen', 'O', 'Menikah', 'Fottoo', '123456789'),
('7202221234560001', '7202221234560002', 'Coba Laki', 'Palu', '2019-09-02', 'Laki-laki', 'Palu', 'Islam', 'B', 'Menikah', 'PNS', '085212345678'),
('7202221906010002', '7202220812070004', 'Mohammad Arafat Maku', 'Palu', '2001-07-12', 'Laki-laki', 'Jln. Pattimura', 'Islam', 'O', 'Belum Menikah', 'Mahasiswa', '085394933612');

-- --------------------------------------------------------

--
-- Table structure for table `struktur`
--

CREATE TABLE `struktur` (
  `jabatan` varchar(30) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `nip` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `struktur`
--

INSERT INTO `struktur` (`jabatan`, `nama`, `nip`) VALUES
('Kasi Ekonomi', 'Nama Ekonomi', '12345678 123456 1 123'),
('Kasi Pemerintah dan Umum', 'Nama Kasi Pem dan Umum', '12345678 123456 1 123'),
('Kasi Trantib', 'Nama Kasi Trantib', '12345678 123456 1 123'),
('Lurah', 'Ruslan', '12345'),
('Sekertaris', 'Nama Sekertaris', '12345678 123456 1 123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `struktur`
--
ALTER TABLE `struktur`
  ADD PRIMARY KEY (`jabatan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
