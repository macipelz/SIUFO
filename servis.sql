-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2017 at 12:33 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `servis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE IF NOT EXISTS `tb_barang` (
  `kode_barang` varchar(12) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `no_seri` varchar(25) NOT NULL,
  `kelengkapan` varchar(50) NOT NULL,
  `servis` varchar(50) NOT NULL,
  `kode_konsumen` char(12) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_barang`),
  KEY `kode_konsumen` (`kode_konsumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `no_seri`, `kelengkapan`, `servis`, `kode_konsumen`, `nama`, `tgl_masuk`, `keterangan`) VALUES
('BR-0001/17', '32LH500D', '704INZQ3E676', 'Buku Garansi', 'Penitipan Servis', 'KS-0002/17', 'ArulHosa', '2017-01-30', 'Belum Diservis'),
('BR-0002/17', '32LH510D', '703INYZ3Q145', 'Remote', 'Servis Langsung', 'KS-0002/17', 'ArulHosa', '2017-01-30', 'Belum Diservis'),
('BR-0003/17', 'TV', '705INGG7T637', 'Remote', 'Servis Langsung', 'KS-0003/17', 'Ari', '2017-01-30', 'Belum Diservis'),
('BR-0004/17', '32LJ500D', '705', 'Remote', 'Penitipan Servis', 'KS-0001/17', 'Hairullah', '2017-07-23', 'Belum Diservis'),
('BR-0005/17', 'LG 32LJ500D', '705', 'Remote', 'Penitipan Servis', 'KS-0004/17', 'Aulia', '2017-07-25', 'Sudah Diservis'),
('BR-0006/17', 'LG 43LJ500T', '705', 'Remote', 'Servis Langsung', 'KS-0005/17', 'Arulhosa', '2017-07-26', 'Belum Diservis'),
('BR-0007/17', 'GN-INV304SL', '705INZY4W322', 'Buku Garansi', 'Servis Langsung', 'KS-0006/17', 'Chandra', '2017-07-31', 'Sudah Diservis');

-- --------------------------------------------------------

--
-- Table structure for table `tb_konsumen`
--

CREATE TABLE IF NOT EXISTS `tb_konsumen` (
  `kode_konsumen` varchar(12) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nomor_hp` varchar(20) NOT NULL,
  PRIMARY KEY (`kode_konsumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_konsumen`
--

INSERT INTO `tb_konsumen` (`kode_konsumen`, `nama`, `alamat`, `nomor_hp`) VALUES
('KS-0001/17', 'Hairullah', 'Jalan Kelayan B Komplek 10 11/02 No 81', '08971170711'),
('KS-0002/17', 'ArulHosa', 'Jalan Kelayan A Gg Sempurna', '081248778899'),
('KS-0003/17', 'Ari', 'Kelayan', '08987466444'),
('KS-0004/17', 'Aulia', 'Kampung Gedang', '08784845566'),
('KS-0005/17', 'Arulhosa', 'Kelayan', '08971170711'),
('KS-0006/17', 'Chandra', 'Jl Kelayan B Komplek 10', '08980569589');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kwitansi`
--

CREATE TABLE IF NOT EXISTS `tb_kwitansi` (
  `no_kwitansi` varchar(12) NOT NULL,
  `tgl_kwitansi` date NOT NULL,
  `no_servis` varchar(12) NOT NULL,
  `biaya` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`no_kwitansi`),
  KEY `no_servis` (`no_servis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kwitansi`
--

INSERT INTO `tb_kwitansi` (`no_kwitansi`, `tgl_kwitansi`, `no_servis`, `biaya`, `total`) VALUES
('KW-0007/17', '2017-07-31', 'SV-0007/17', 150000, 450000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesansparepart`
--

CREATE TABLE IF NOT EXISTS `tb_pesansparepart` (
  `no_pesan` varchar(12) NOT NULL,
  `no` varchar(12) NOT NULL,
  `nama_sparepart` varchar(30) NOT NULL,
  `jumlah` int(12) NOT NULL,
  PRIMARY KEY (`no_pesan`),
  KEY `FK_tb_pesansparepart_tb_sparepart` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesansparepart`
--

INSERT INTO `tb_pesansparepart` (`no_pesan`, `no`, `nama_sparepart`, `jumlah`) VALUES
('PS-0002/17', 'SP-0002/17', 'LG Motherboard 43"', 5),
('PS-0003/17', 'SP-0001/17', 'Panel LCD 32"', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tb_returbeli`
--

CREATE TABLE IF NOT EXISTS `tb_returbeli` (
  `no_returbeli` varchar(12) NOT NULL,
  `no_returjual` varchar(12) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `barang` varchar(20) NOT NULL,
  `no_seri` varchar(1000) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `kerusakan` varchar(1000) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`no_returbeli`),
  KEY `FK_tb_returbeli_tb_returjual` (`no_returjual`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_returbeli`
--

INSERT INTO `tb_returbeli` (`no_returbeli`, `no_returjual`, `merk`, `barang`, `no_seri`, `jumlah`, `kerusakan`, `tanggal`) VALUES
('RB-0003/17', 'RJ-0002/17', 'LG', 'GN-INV304SL', '704INZS56746', '6', 'Freezer Bocor', '2017-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_returjual`
--

CREATE TABLE IF NOT EXISTS `tb_returjual` (
  `no_returjual` varchar(12) NOT NULL,
  `no_kwitansi` varchar(12) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `nama_konsumen` varchar(20) NOT NULL,
  `no_seri` varchar(12) NOT NULL,
  `no_seribaru` varchar(25) NOT NULL,
  `kerusakan` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`no_returjual`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_returjual`
--

INSERT INTO `tb_returjual` (`no_returjual`, `no_kwitansi`, `nama_barang`, `nama_konsumen`, `no_seri`, `no_seribaru`, `kerusakan`, `tanggal`) VALUES
('RJ-0002/17', '34345', 'GN-INV304SL', 'Chandra', '704INZS56746', '705INZQ7W332', 'Freezer Bocor', '2017-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_servis`
--

CREATE TABLE IF NOT EXISTS `tb_servis` (
  `no_servis` varchar(12) NOT NULL,
  `kode_barang` varchar(12) NOT NULL,
  `no_seri` varchar(25) NOT NULL,
  `id_teknisi` varchar(12) NOT NULL,
  `kerusakan` varchar(100) NOT NULL,
  `no` varchar(12) NOT NULL,
  `kode_konsumen` varchar(12) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`no_servis`),
  KEY `id_teknisi` (`id_teknisi`),
  KEY `kode_barang` (`kode_barang`),
  KEY `kode_konsumen` (`kode_konsumen`),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_servis`
--

INSERT INTO `tb_servis` (`no_servis`, `kode_barang`, `no_seri`, `id_teknisi`, `kerusakan`, `no`, `kode_konsumen`, `tanggal`) VALUES
('SV-0005/17', 'BR-0005/17', '705', 'TK-0001/17', 'LCD Pecah', 'SP-0000/00', 'KS-0004/17', '2017-07-25'),
('SV-0007/17', 'BR-0007/17', '705INZY4W322', 'TK-0001/17', 'Tidak Dingin', 'SP-0004/17', 'KS-0006/17', '2017-07-31');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sparepart`
--

CREATE TABLE IF NOT EXISTS `tb_sparepart` (
  `no` varchar(12) NOT NULL,
  `nama_sparepart` varchar(30) NOT NULL,
  `harga` int(7) NOT NULL,
  `stok` int(7) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sparepart`
--

INSERT INTO `tb_sparepart` (`no`, `nama_sparepart`, `harga`, `stok`) VALUES
('SP-0000/00', 'Tidak Ganti Sparepart', 0, 2000),
('SP-0001/17', 'Panel LCD 32"', 2000000, 25),
('SP-0002/17', 'LG Motherboard 43"', 1500000, 11),
('SP-0003/17', 'Digital Tuner', 500000, 1),
('SP-0004/17', 'Kompresor Kulkas', 300000, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sparepartmasuk`
--

CREATE TABLE IF NOT EXISTS `tb_sparepartmasuk` (
  `no_masuk` int(11) NOT NULL AUTO_INCREMENT,
  `no_pesan` varchar(12) NOT NULL,
  `no` varchar(12) NOT NULL,
  `nama_sparepart` varchar(30) NOT NULL,
  `jumlah` int(12) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`no_masuk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tb_sparepartmasuk`
--

INSERT INTO `tb_sparepartmasuk` (`no_masuk`, `no_pesan`, `no`, `nama_sparepart`, `jumlah`, `tanggal`) VALUES
(7, 'PS-0002/17', 'SP-0002/17', 'LG Motherboard 43"', 5, '2017-08-04'),
(8, 'PS-0003/17', 'SP-0001/17', 'Panel LCD 32"', 15, '2017-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `tb_teknisi`
--

CREATE TABLE IF NOT EXISTS `tb_teknisi` (
  `id_teknisi` varchar(12) NOT NULL,
  `nama_teknisi` varchar(30) NOT NULL,
  `hp_teknisi` varchar(25) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  PRIMARY KEY (`id_teknisi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_teknisi`
--

INSERT INTO `tb_teknisi` (`id_teknisi`, `nama_teknisi`, `hp_teknisi`, `alamat`) VALUES
('TK-0001/17', 'Arul', '08971170711', 'Jalan Kelayan B Komplek 10 No 81');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `user` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` varchar(10) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user`, `password`, `level`) VALUES
('a', 'a', 'Admin'),
('arul', 'admin', 'Admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`kode_konsumen`) REFERENCES `tb_konsumen` (`kode_konsumen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kwitansi`
--
ALTER TABLE `tb_kwitansi`
  ADD CONSTRAINT `tb_kwitansi_ibfk_1` FOREIGN KEY (`no_servis`) REFERENCES `tb_servis` (`no_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pesansparepart`
--
ALTER TABLE `tb_pesansparepart`
  ADD CONSTRAINT `FK_tb_pesansparepart_tb_sparepart` FOREIGN KEY (`no`) REFERENCES `tb_sparepart` (`no`);

--
-- Constraints for table `tb_returbeli`
--
ALTER TABLE `tb_returbeli`
  ADD CONSTRAINT `FK_tb_returbeli_tb_returjual` FOREIGN KEY (`no_returjual`) REFERENCES `tb_returjual` (`no_returjual`);

--
-- Constraints for table `tb_servis`
--
ALTER TABLE `tb_servis`
  ADD CONSTRAINT `tb_servis_ibfk_18` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_servis_ibfk_19` FOREIGN KEY (`id_teknisi`) REFERENCES `tb_teknisi` (`id_teknisi`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_servis_ibfk_20` FOREIGN KEY (`kode_konsumen`) REFERENCES `tb_konsumen` (`kode_konsumen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_servis_ibfk_21` FOREIGN KEY (`no`) REFERENCES `tb_sparepart` (`no`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
