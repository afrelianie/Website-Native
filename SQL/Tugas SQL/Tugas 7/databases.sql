-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 03 Bulan Mei 2023 pada 22.32
-- Versi server: 8.0.30
-- Versi PHP: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtoko1`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addJenis_produk` (`nama` VARCHAR(20), `ket` VARCHAR(50))   begin
insert into jenis_produk(nama,ket) values(nama,ket);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addPesanan` (`tanggal` DATE, `total` DOUBLE, `pelanggan_id` INT)   begin
insert into pesanan (tanggal, total, pelanggan_id) values (tanggal, total, pelanggan_id);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputPelanggan` ()   begin
select nama, jk, tmp_lahir, email, kartu_id, alamat from pelanggan;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputProduk` ()   begin
select nama, harga_beli, harga_jual from produk;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showPelanggan` ()   begin
select nama, jk, tmp_lahir, email, kartu_id, alamat from pelanggan;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showproduk` ()   begin
select nama, harga_beli, harga_jual from produk;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showproduks` ()   select nama, harga_beli, harga_jual from produk;$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `totalPesanan` (IN `hrg` DOUBLE, IN `jml` INT, OUT `total` DOUBLE)   begin
set total = hrg*jml;
select @total;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_produk_vw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_produk_vw` (
`id` int
,`kode` varchar(10)
,`nama` varchar(50)
,`harga_beli` double
,`harga_jual` double
,`stok` int
,`min_stok` int
,`jenis_produk_id` int
,`jenis` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id` int NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `ket` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `jenis_produk`
--

INSERT INTO `jenis_produk` (`id`, `nama`, `ket`) VALUES
(1, 'furniture', 'tersedia'),
(2, 'minuman', 'tersedia'),
(3, 'makanan', 'tidak tersedia'),
(4, 'elektronik', 'tersedia'),
(5, 'ATK', 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kartu`
--

CREATE TABLE `kartu` (
  `id` int NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(30) NOT NULL,
  `diskon` double DEFAULT '0',
  `iuran` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kartu`
--

INSERT INTO `kartu` (`id`, `kode`, `nama`, `diskon`, `iuran`) VALUES
(1, '10111', 'Gold', 20000, 2000),
(2, '10112', 'Silver', 15000, 1500),
(3, '10113', 'platinum', 10000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tmp_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `kartu_id` int NOT NULL,
  `alamat` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `email`, `kartu_id`, `alamat`) VALUES
(1, '011101', 'Dion', 'P', 'Bandung', '1997-09-06', 'agun@gmail.com', 1, NULL),
(2, '011102', 'Angga', 'L', 'Jogja', '1999-11-23', 'angga@gmail.com', 2, NULL),
(3, '011103', 'Fia', 'P', 'Kediri', '1998-01-13', 'fia@gmail.com', 3, NULL),
(5, '011105', 'Suandi', 'L', 'Ketapang', '1997-08-08', 'suandi@gmail.com', 1, NULL),
(6, '011106', 'Vika', 'P', 'Kaltim', '1995-03-18', 'vika@gmail.com', 2, NULL),
(7, '011104', 'Dion', 'L', 'Kalbar', '1998-03-09', 'dion@gmail.com', 4, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int NOT NULL,
  `no_kuitansi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `ke` int DEFAULT NULL,
  `pesanan_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int NOT NULL,
  `tanggal` varchar(45) DEFAULT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `produk_id` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `vendor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id`, `tanggal`, `nomor`, `produk_id`, `jumlah`, `harga`, `vendor_id`) VALUES
(1, '2019-10-10', 'P001', 1, 2, 3500000, 1),
(2, '2019-11-20', 'P002', 2, 5, 5500000, 2),
(3, '2019-12-12', 'P003', 2, 5, 5400000, 1),
(4, '2020-01-20', 'P004', 7, 200, 1800, 3),
(5, '2020-01-20', 'P005', 5, 100, 2300, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pelanggan_id` int NOT NULL,
  `produk_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal`, `total`, `pelanggan_id`, `produk_id`) VALUES
(1, '2015-11-04', 9720000, 1, 1),
(2, '2015-11-04', 17500, 3, 3),
(3, '2015-11-04', 0, 6, 6),
(4, '2015-11-04', 0, 7, 3),
(5, '2015-11-04', 0, 10, 5),
(6, '2015-11-04', 0, 2, 2),
(7, '2015-11-04', 0, 5, 4),
(8, '2015-11-04', 0, 4, 6),
(9, '2015-11-04', 0, 8, 1),
(10, '2015-11-04', 0, 9, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_items`
--

CREATE TABLE `pesanan_items` (
  `id` int NOT NULL,
  `produk_id` int NOT NULL,
  `pesanan_id` int NOT NULL,
  `qty` int DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `pesanan_items`
--

INSERT INTO `pesanan_items` (`id`, `produk_id`, `pesanan_id`, `qty`, `harga`) VALUES
(1, 1, 1, 1, 5040000),
(2, 3, 1, 1, 4680000),
(3, 5, 2, 5, 3500),
(6, 5, 3, 10, 3500),
(7, 1, 3, 1, 5040000),
(9, 5, 5, 10, 3500),
(10, 5, 6, 20, 3500);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `pesanan_produk_vw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pesanan_produk_vw` (
`id` int
,`tanggal` date
,`total` double
,`pelanggan_id` int
,`produk_id` int
,`jenis` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int NOT NULL,
  `kode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double NOT NULL,
  `stok` int DEFAULT NULL,
  `min_stok` int NOT NULL,
  `jenis_produk_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_beli`, `harga_jual`, `stok`, `min_stok`, `jenis_produk_id`) VALUES
(1, 'TV01', 'TV 21 Inch', 20000000, 30000000, 10, 3, 1),
(2, 'TV02', 'Kulkas', 40000000, 50000000, 10, 3, 1),
(3, 'K001', 'Meja Makan', 1000000, 2000000, 4, 2, 4),
(4, 'M001', 'Taro', 4000, 5000, 3, 2, 2),
(5, 'T001', 'Milk Teh', 3000, 4000, 3, 10, 3),
(6, 'TK01', 'TV 25 Inch', 25000000, 35000000, 10, 3, 1);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tampil_produk`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tampil_produk` (
`nama` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendor`
--

CREATE TABLE `vendor` (
  `id` int NOT NULL,
  `nomor` varchar(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `kontak` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `vendor`
--

INSERT INTO `vendor` (`id`, `nomor`, `nama`, `kota`, `kontak`) VALUES
(1, 'V001', 'PT Guna Samudra', 'Surabaya', 'Ali Nurdin'),
(2, 'V002', 'PT Pondok C9', 'Depok', 'Putri Ramadhani'),
(3, 'V003', 'CV Jaya Raya Semesta', 'Jakarta', 'Dwi Rahayu'),
(4, 'V004', 'PT Lekulo X', 'Kebumen', 'Mbambang G'),
(5, 'V005', 'PT IT Prima', 'Jakarta', 'David W');

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_produk_vw`
--
DROP TABLE IF EXISTS `detail_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_produk_vw`  AS SELECT `p`.`id` AS `id`, `p`.`kode` AS `kode`, `p`.`nama` AS `nama`, `p`.`harga_beli` AS `harga_beli`, `p`.`harga_jual` AS `harga_jual`, `p`.`stok` AS `stok`, `p`.`min_stok` AS `min_stok`, `p`.`jenis_produk_id` AS `jenis_produk_id`, `j`.`nama` AS `jenis` FROM (`jenis_produk` `j` join `produk` `p` on((`p`.`jenis_produk_id` = `j`.`id`)))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pesanan_produk_vw`
--
DROP TABLE IF EXISTS `pesanan_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan_produk_vw`  AS SELECT `p`.`id` AS `id`, `p`.`tanggal` AS `tanggal`, `p`.`total` AS `total`, `p`.`pelanggan_id` AS `pelanggan_id`, `p`.`produk_id` AS `produk_id`, `j`.`nama` AS `jenis` FROM (`produk` `j` join `pesanan` `p` on((`p`.`produk_id` = `j`.`id`)))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `tampil_produk`
--
DROP TABLE IF EXISTS `tampil_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil_produk`  AS SELECT `produk`.`nama` AS `nama` FROM `produk``produk`  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kartu`
--
ALTER TABLE `kartu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kuitansi` (`no_kuitansi`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_UNIQUE` (`nomor`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan_customer_idx` (`pelanggan_id`);

--
-- Indeks untuk tabel `pesanan_items`
--
ALTER TABLE `pesanan_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan_items_pesanan1_idx` (`pesanan_id`),
  ADD KEY `fk_pesanan_items_produk1_idx` (`produk_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indeks untuk tabel `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kartu`
--
ALTER TABLE `kartu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pesanan_items`
--
ALTER TABLE `pesanan_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
