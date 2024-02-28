-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 10:04 AM
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
-- Database: `kasir_sindy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cari_kategori` (IN `namaNya` VARCHAR(50))   SELECT * FROM tbl_kategori WHERE nama_kategori LIKE CONCAT ('%',namaNya,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cari_produk` (IN `namaNya` VARCHAR(100))   SELECT 
	   tbl_produk.kode_produk,
       tbl_produk.nama_produk,
       tbl_produk.harga_beli,
       tbl_produk.harga_jual,
       tbl_satuan.nama_satuan,
       tbl_kategori.nama_kategori,
       tbl_produk.stok
FROM tbl_produk
JOIN tbl_satuan ON tbl_satuan.kode_satuan=tbl_produk.kode_satuan
JOIN tbl_kategori ON tbl_kategori.kode_kategori=tbl_produk.kode_kategori
WHERE nama_produk LIKE concat('%',namaNya,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cari_satuan` (IN `namaNya` VARCHAR(50))   SELECT * FROM tbl_satuan WHERE nama_satuan LIKE CONCAT ('%',namaNya,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cari_user` (IN `namaNya` VARCHAR(100))   SELECT tbl_user.email,
	   tbl_user.nama_user,
       tbl_user.role,
       tbl_user.status
FROM tbl_user
WHERE nama_user LIKE concat("%",namaNya,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detail_kategori` (IN `idNya` INT)   SELECT * FROM tbl_kategori WHERE kode_kategori=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detail_produk` (IN `idNya` INT)   SELECT tbl_produk.id_produk,
	   tbl_produk.kode_produk,
       tbl_produk.nama_produk,
       tbl_produk.harga_beli,
       tbl_produk.harga_jual,
       tbl_satuan.nama_satuan,
       tbl_kategori.nama_kategori,
       tbl_produk.stok
FROM tbl_produk
JOIN tbl_satuan ON tbl_satuan.kode_satuan=tbl_produk.kode_satuan
JOIN tbl_kategori ON tbl_kategori.kode_kategori=tbl_produk.kode_kategori
WHERE id_produk=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detail_satuan` (IN `idNya` INT)   SELECT * FROM tbl_satuan WHERE kode_satuan=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detail_user` (IN `emailNya` VARCHAR(255))   SELECT tbl_user.email,
	   tbl_user.nama_user,
       tbl_user.password,
       tbl_user.role,
       tbl_user.status
FROM tbl_user
WHERE email=emailNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_kategori` (IN `idNya` INT)   DELETE FROM tbl_kategori WHERE kode_kategori=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_produk` (IN `idNya` INT)   DELETE FROM tbl_produk WHERE id_produk=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_satuan` (IN `idNya` INT)   DELETE FROM tbl_satuan WHERE kode_satuan=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_user` (IN `emailNya` VARCHAR(255))   DELETE FROM tbl_user WHERE email=emailNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_detailProduk` ()   SELECT tbl_produk.id_produk,
        tbl_produk.kode_produk,
        tbl_produk.nama_produk,
        tbl_produk.harga_beli,
        tbl_produk.harga_jual,
        
        tbl_produk.stok
FROM tbl_produk

WHERE tbl_produk.stok > 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_kategori` ()   SELECT * FROM tbl_kategori$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_produk` ()   SELECT tbl_produk.id_produk,
	   tbl_produk.kode_produk,
       tbl_produk.nama_produk,
       tbl_produk.harga_beli,
       tbl_produk.harga_jual,
       tbl_satuan.nama_satuan,
       tbl_kategori.nama_kategori,
       tbl_produk.stok
FROM tbl_produk
JOIN tbl_satuan ON tbl_satuan.kode_satuan=tbl_produk.kode_satuan
JOIN tbl_kategori ON tbl_kategori.kode_kategori=tbl_produk.kode_kategori$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_satuan` ()   SELECT * FROM tbl_satuan$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_supplier` ()   SELECT * FROM tbl_supplier$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_user` ()   SELECT tbl_user.email,
	   tbl_user.nama_user, 
       tbl_user.role,
       tbl_user.status
FROM tbl_user$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tampil_produk` ()   begin
SELECT tbl_produk.nama_produk, tbl_produk.harga_beli, tbl_produk.harga_jual, tbl_produk.stok
FROM tbl_produk
ORDER BY tbl_produk.stok ASC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_kategori` (IN `namaNya` VARCHAR(50))   INSERT INTO tbl_kategori (nama_kategori) VALUES (namaNya)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_produk` (IN `kodeNya` VARCHAR(25), IN `namaNya` VARCHAR(100), IN `beliNya` INT, IN `jualNya` INT, IN `satuanNya` INT, IN `kategoriNya` INT, IN `stokNya` INT)   INSERT INTO tbl_produk (kode_produk, nama_produk, harga_beli, harga_jual,
                        kode_satuan, kode_kategori, stok)
VALUES (kodeNya, namaNya, beliNya, jualNya, satuanNya, kategoriNya, stokNya)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_satuan` (IN `namaNya` VARCHAR(50))   INSERT INTO tbl_satuan (nama_satuan) VALUES (namaNya)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_supplier` (IN `namaNya` VARCHAR(150), IN `alamatNya` MEDIUMTEXT, IN `waNya` VARCHAR(20))   INSERT INTO tbl_supplier (nama_supplier, alamat_supplier, wa_supplier)
VALUES (namaNya, alamatNya, waNya)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_user` (IN `emailNya` VARCHAR(255), IN `namaNya` VARCHAR(100), IN `passwordNya` VARCHAR(60), IN `roleNya` ENUM('admin','petugas'))   INSERT INTO tbl_user (email, nama_user, password, role, status)
    VALUES (emailNya, namaNya, md5(passwordNya), roleNya, 'nonaktif')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_kategori` (IN `idNya` INT, IN `namaNya` VARCHAR(50))   UPDATE tbl_kategori SET nama_kategori=namaNya WHERE kode_kategori=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_produk` (IN `idNya` INT, IN `kodeNya` VARCHAR(25), IN `namaNya` VARCHAR(100), IN `beliNya` INT, IN `jualNya` INT, IN `satuanNya` INT, IN `kategoriNya` INT, IN `stokNya` INT)   UPDATE tbl_produk SET kode_produk=kodeNya,
					  nama_produk=namaNya,
                      harga_beli=beliNya,
                      harga_jual=jualNya,
                      kode_satuan=satuanNya,
                      kode_kategori=kategoriNya,
                      stok=stokNya
WHERE id_produk=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_satuan` (IN `idNya` INT, IN `namaNya` VARCHAR(50))   UPDATE tbl_satuan SET nama_satuan=namaNya WHERE kode_satuan=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (IN `emailNya` VARCHAR(255), IN `roleNya` ENUM('admin','petugas'), IN `statusNya` ENUM('aktif','nonaktif'))   UPDATE tbl_user set role=roleNya, status=statusNya WHERE email=emailNya$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailpenjualan`
--

CREATE TABLE `tbl_detailpenjualan` (
  `id_detail` int(11) NOT NULL,
  `kode_penjualan` int(11) NOT NULL,
  `kode_produk` varchar(25) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kode_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kode_kategori`, `nama_kategori`) VALUES
(122, 'Makanan'),
(123, 'Minuman'),
(131, 'Alat Mandi'),
(135, 'Mainan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `kode_penjualan` int(11) NOT NULL,
  `tgl_penjualan` datetime NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `no_faktur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`kode_penjualan`, `tgl_penjualan`, `grand_total`, `no_faktur`) VALUES
(1, '2024-02-27 15:35:51', '26000.00', 'INV-202402270001'),
(2, '2024-02-27 15:36:26', '26000.00', 'INV-202402270001'),
(3, '2024-02-27 15:36:30', '26000.00', 'INV-202402270001'),
(4, '2024-02-27 15:49:59', '26000.00', 'INV-202402270001'),
(5, '2024-02-27 15:50:12', '26000.00', 'INV-202402270001'),
(6, '2024-02-27 15:51:12', '26000.00', 'INV-202402270001'),
(7, '2024-02-27 15:51:21', '26000.00', 'INV-202402270001'),
(8, '2024-02-27 15:51:26', '26000.00', 'INV-202402270001'),
(9, '2024-02-27 16:02:45', '26000.00', 'INV-202402270001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` int(11) NOT NULL,
  `kode_produk` varchar(25) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `kode_kategori` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `kode_produk`, `nama_produk`, `harga_jual`, `kode_kategori`, `stok`, `harga_beli`, `id_satuan`) VALUES
(903, 'BRG001', 'Coklat ', 13000, 122, 50, 12500, 1),
(910, 'BRG002', 'Sikat Gigi', 8000, 131, 50, 7000, 1),
(920, 'BRG003', 'Teh', 4000, 123, 10, 3000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `id_satuan` int(10) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_satuan`
--

INSERT INTO `tbl_satuan` (`id_satuan`, `nama_satuan`) VALUES
(1, 'pcs'),
(2, 'Saschet'),
(5, 'Box'),
(7, ' Kg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('admin','kasir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `nama_user`, `password`, `level`) VALUES
(18, 'zeya', 'zeyna', '118', 'kasir'),
(19, 'sindy', 'sindysetiani', '123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_detailpenjualan`
--
ALTER TABLE `tbl_detailpenjualan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `kode_produk` (`kode_produk`),
  ADD KEY `kode_penjualan` (`kode_penjualan`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indexes for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_detailpenjualan`
--
ALTER TABLE `tbl_detailpenjualan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `kode_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  MODIFY `kode_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=921;

--
-- AUTO_INCREMENT for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `id_satuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD CONSTRAINT `tbl_produk_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `tbl_kategori` (`kode_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_produk_ibfk_2` FOREIGN KEY (`id_satuan`) REFERENCES `tbl_satuan` (`id_satuan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
