-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2024 at 12:13 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi1` ()   BEGIN
START TRANSACTION;
INSERT INTO pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin, penyakit, no_hp) VALUES (4, 'Malika', 'Jl. Merdeka No.11', 'P', 'Batuk', '081345678999');
SELECT * FROM pasien;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi2` ()   BEGIN
START TRANSACTION;
UPDATE pasien SET nama_pasien='Malika' WHERE id_pasien='4';
ROLLBACK;
COMMIT;
SELECT * FROM pasien;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` int(3) NOT NULL,
  `nama_admin` varchar(30) DEFAULT NULL,
  `waktu_jaga` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id_admin`, `nama_admin`, `waktu_jaga`) VALUES
(1, 'Budi', '2024-06-12 12:00:00'),
(2, 'Ahmad', '2024-06-04 12:00:00'),
(3, 'Budi', '2024-05-25 12:00:00'),
(4, 'Naufal', '2024-05-27 12:00:00'),
(5, 'Raihan', '2024-06-03 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `daftar`
--

CREATE TABLE `daftar` (
  `id_daftar` int(3) NOT NULL,
  `id_pasien` int(3) DEFAULT NULL,
  `id_admin` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar`
--

INSERT INTO `daftar` (`id_daftar`, `id_pasien`, `id_admin`) VALUES
(4, 1, 2),
(5, 3, 4),
(6, 3, 1),
(7, 2, 1),
(8, 1, 3),
(9, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(3) NOT NULL,
  `nama_dokter` varchar(30) DEFAULT NULL,
  `alamat_dokter` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `spesialis` varchar(15) DEFAULT NULL,
  `waktu_kerja` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `alamat_dokter`, `tanggal_lahir`, `no_hp`, `spesialis`, `waktu_kerja`) VALUES
(2, 'Andrian', 'Bekasi', '1978-06-28', '087865342146', 'dokter jantung', '9 jam'),
(3, 'Naufal', 'Bekasi', '1987-07-28', '087865342146', 'dokter umum', '9 jam'),
(4, 'Dhafin', 'Bandung', '1968-06-29', '087881923446', 'dokter kulit', '12 jam'),
(5, 'Shinta', 'Surabaya', '1986-03-12', '087678655676', 'dokter jiwa', '6 jam'),
(6, 'Bella', 'Karawang', '1989-04-23', '087845677653', 'dokter syaraf', '12 jam');

-- --------------------------------------------------------

--
-- Table structure for table `dokter_admin`
--

CREATE TABLE `dokter_admin` (
  `id_data` int(3) NOT NULL,
  `id_dokter` int(3) DEFAULT NULL,
  `id_admin` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter_admin`
--

INSERT INTO `dokter_admin` (`id_data`, `id_dokter`, `id_admin`) VALUES
(3, 6, 1),
(4, 4, 2),
(5, 6, 3),
(6, 4, 4),
(7, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(6) NOT NULL,
  `kode_obat` varchar(5) DEFAULT NULL,
  `nama_obat` varchar(30) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `stok` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `kode_obat`, `nama_obat`, `harga`, `stok`) VALUES
(1, 'A001', 'Amikacin', 20000, 8),
(2, 'A002', 'Amoxilin', 15000, NULL),
(3, 'A003', 'Betadine', 7000, 4),
(4, 'A004', 'Balsem', 8000, 20),
(5, 'A005', 'Redoxon', 12000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(3) NOT NULL,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `alamat_pasien` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL,
  `penyakit` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `alamat_pasien`, `jenis_kelamin`, `penyakit`, `no_hp`) VALUES
(1, 'Budi Santoso', 'Jl. Merdeka No.10', 'L', 'Demam', '081234567890'),
(2, 'Ani Suryani', 'Jl. Mawar No.5', 'P', 'Batuk', '082345678901'),
(3, 'Dewi Anggraini', 'Jl. Melati No.3', 'P', 'Radang', '083456789012'),
(4, 'Malika', 'Jl. Merdeka No.11', 'P', 'Batuk', '081345678999'),
(5, 'Naufal Abdullah', 'Jl. Merdeka No.16', 'L', 'Demam', '0812345678910');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_dokter`
--

CREATE TABLE `pasien_dokter` (
  `id` int(3) NOT NULL,
  `id_dokter` int(3) DEFAULT NULL,
  `id_pasien` int(3) DEFAULT NULL,
  `waktu_periksa` date DEFAULT NULL,
  `resep` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien_dokter`
--

INSERT INTO `pasien_dokter` (`id`, `id_dokter`, `id_pasien`, `waktu_periksa`, `resep`) VALUES
(1, 2, 1, '2024-04-28', 'butuh amoxilin ya'),
(2, 6, 2, '2024-04-29', 'butuh amoxilin ya'),
(3, 4, 3, '2024-04-30', 'butuh amikacin ya'),
(4, 3, 4, '2024-05-01', 'butuh redoxon ya'),
(5, 5, 5, '2024-05-02', 'butuh redoxon ya'),
(6, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_obat`
--

CREATE TABLE `transaksi_obat` (
  `id_transaksi` int(3) NOT NULL,
  `id_pasien` int(3) DEFAULT NULL,
  `id_obat` int(3) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `total_harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_obat`
--

INSERT INTO `transaksi_obat` (`id_transaksi`, `id_pasien`, `id_obat`, `jumlah`, `total_harga`) VALUES
(1, 2, 1, 2, 30000),
(2, 1, 2, 2, 30000),
(3, 3, 3, 1, 20000),
(4, 4, 4, 5, 60000),
(5, 5, 5, 5, 60000),
(6, 3, 2, NULL, NULL);

--
-- Triggers `transaksi_obat`
--
DELIMITER $$
CREATE TRIGGER `tgl_jual` AFTER INSERT ON `transaksi_obat` FOR EACH ROW UPDATE obat SET stok=stok-new.jumlah WHERE id_obat=new.id_obat
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `daftar`
--
ALTER TABLE `daftar`
  ADD PRIMARY KEY (`id_daftar`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `dokter_admin`
--
ALTER TABLE `dokter_admin`
  ADD PRIMARY KEY (`id_data`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `transaksi_obat`
--
ALTER TABLE `transaksi_obat`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_obat` (`id_obat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `daftar`
--
ALTER TABLE `daftar`
  MODIFY `id_daftar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dokter_admin`
--
ALTER TABLE `dokter_admin`
  MODIFY `id_data` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi_obat`
--
ALTER TABLE `transaksi_obat`
  MODIFY `id_transaksi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar`
--
ALTER TABLE `daftar`
  ADD CONSTRAINT `daftar_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `daftar_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokter_admin`
--
ALTER TABLE `dokter_admin`
  ADD CONSTRAINT `dokter_admin_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dokter_admin_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  ADD CONSTRAINT `pasien_dokter_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_dokter_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_obat`
--
ALTER TABLE `transaksi_obat`
  ADD CONSTRAINT `transaksi_obat_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_obat_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
