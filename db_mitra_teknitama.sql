-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26 Okt 2018 pada 13.24
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mitra_teknitama`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_cust` int(100) NOT NULL,
  `name_cust` varchar(100) NOT NULL,
  `addr` varchar(150) NOT NULL,
  `telp` int(20) DEFAULT NULL,
  `fax` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`id_cust`, `name_cust`, `addr`, `telp`, `fax`) VALUES
(1, 'PT. DION FARMA ABADI', 'JL. JOGJA -SOLO KM 18 SANGGRAHAN PRAMBANAN', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_fns`
--

CREATE TABLE `tb_fns` (
  `idFns` int(100) NOT NULL,
  `finish` varchar(200) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `sat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_fns`
--

INSERT INTO `tb_fns` (`idFns`, `finish`, `cost`, `sat`) VALUES
(1, 'COATING', '50000', 'KG'),
(2, 'TITANIUM COATING', '0000', 'XX'),
(3, 'TIN COATING', '0000', 'XX'),
(4, 'CHROME', '0000', 'XX'),
(5, 'HARD CHROME', '0000', 'XX'),
(6, 'PAINTING', '0000', 'XX'),
(7, 'POLISHING', '0000', 'XX');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hpp`
--

CREATE TABLE `tb_hpp` (
  `id_hpp` int(11) NOT NULL,
  `id_matprice` int(11) NOT NULL,
  `id_preprocess` int(11) NOT NULL,
  `id_macprocess` int(11) NOT NULL,
  `id_treat` int(11) NOT NULL,
  `id_scharge` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer` varchar(200) NOT NULL,
  `attn` varchar(200) NOT NULL,
  `cc` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `quote_no` varchar(200) NOT NULL,
  `sales_name` varchar(200) NOT NULL,
  `tittle` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_macprocess`
--

CREATE TABLE `tb_macprocess` (
  `id_macprocess` int(11) NOT NULL,
  `process` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mat`
--

CREATE TABLE `tb_mat` (
  `idMat` int(11) NOT NULL,
  `NmMat` varchar(200) NOT NULL,
  `Bj` varchar(100) NOT NULL,
  `hKg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mat`
--

INSERT INTO `tb_mat` (`idMat`, `NmMat`, `Bj`, `hKg`) VALUES
(2, 'ALUMINIUM A11100', '2.70', '120000'),
(3, 'ALUMINIUM BRONZE', '8.70', '200000'),
(4, 'ASSAB 705 (VCN 150)', '7.85', '55000'),
(5, 'ASSAB 709 (VCL 150)', '7.85', '40000'),
(6, 'ASSAB STAVAX', '7.85', '125000'),
(7, 'ASSAB XW-42', '7.90', '110000'),
(8, 'ASSAB XW-5', '7.85', '120000'),
(9, 'BOHLER VCL 140', '7.90', '45000'),
(10, 'BOHLER VCN 150', '7.90', '55000'),
(11, 'BRASS', '8.60', '100000'),
(12, 'BRONZE', '9.30', '170000'),
(13, 'CAST IRON', '7.30', '20000'),
(14, 'CEMETED CARBIDE V30', '14.10', '0000'),
(15, 'CEMETED CARBIDE V40', '13.90', '0000'),
(16, 'DC 53', '7.85', '90000'),
(17, 'DERLIN', '1.25', '150000'),
(18, 'DURALIUM A7075', '2.80', '120000'),
(19, 'MILD STEEL', '7.85', '15000'),
(20, 'NAK80', '7.80', '0000'),
(21, 'NYLON', '1.25', '150000'),
(22, 'S50C', '7.85', '23000'),
(23, 'SKD11', '7.85', '100000'),
(24, 'SKD61', '7.75', '0000'),
(25, 'SKH51', '8.20', '0000'),
(26, 'S-STAR', '7.85', '107920'),
(27, 'STAILESS STEEL 201', '8.00', '700000'),
(28, 'STAINLESS STEEL 304', '8.00', '85000'),
(29, 'STAINLESS STEEL 316', '8.00', '100000'),
(30, 'SUS 440 C HARDCHROME', '7.78', '1750000'),
(32, 'TEMBAGA', '8.90', '0000'),
(33, 'URETHANE', '3.60', '80000'),
(38, 'material material material material material material material material material material material material material material material material', 'berat', 'harga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_matprice`
--

CREATE TABLE `tb_matprice` (
  `id_matprice` int(11) NOT NULL,
  `mat_density` varchar(200) NOT NULL,
  `mat_price` varchar(200) NOT NULL,
  `mat_weight` varchar(200) NOT NULL,
  `dia1` varchar(100) NOT NULL,
  `dia2` varchar(100) NOT NULL,
  `length1` varchar(100) NOT NULL,
  `length2` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `thick` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mps`
--

CREATE TABLE `tb_mps` (
  `idMps` int(100) NOT NULL,
  `proses` varchar(200) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `sat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mps`
--

INSERT INTO `tb_mps` (`idMps`, `proses`, `harga`, `sat`) VALUES
(1, 'BLANK', '5000', 'SIDE'),
(2, 'BUBUT MANUAL', '600', 'MENIT'),
(3, 'BUBUT CNC', '2100', 'MENIT'),
(4, 'MILLING MANUAL', '700', 'MENIT'),
(5, 'MILLING CNC', '3000', 'MENIT'),
(6, 'SLOTTING', '600', 'MENIT'),
(7, 'FRAIS', '850', 'MENIT'),
(8, 'WELDING', '10000', 'SIDE'),
(9, 'BW', '250', 'MENIT'),
(10, 'WIRE CUT', '40', 'MM>2'),
(11, 'EDM', '2500', 'MENIT'),
(12, 'GRINDING', '650', 'MENIT'),
(13, 'SURFACE GRINDING', '650', 'MENIT'),
(14, 'BENDING', '8000', 'SIDE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_preprocess`
--

CREATE TABLE `tb_preprocess` (
  `id_preprocess` int(11) NOT NULL,
  `design_time` varchar(200) NOT NULL,
  `cost_1` varchar(200) NOT NULL,
  `program_time` varchar(200) NOT NULL,
  `cost_2` varchar(200) NOT NULL,
  `setting` varchar(200) NOT NULL,
  `cost_3` varchar(200) NOT NULL,
  `tools` varchar(200) NOT NULL,
  `cost_4` varchar(200) NOT NULL,
  `others` varchar(200) NOT NULL,
  `cost_5` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_scharge`
--

CREATE TABLE `tb_scharge` (
  `id_scharge` int(11) NOT NULL,
  `urgent` varchar(200) NOT NULL,
  `ekspedition` varchar(200) NOT NULL,
  `labour` varchar(200) NOT NULL,
  `sp_charge_cost` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_thd`
--

CREATE TABLE `tb_thd` (
  `idThd` int(100) NOT NULL,
  `thread` varchar(200) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `sat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tb_thd`
--

INSERT INTO `tb_thd` (`idThd`, `thread`, `cost`, `sat`) VALUES
(1, 'FULL HARDENED', '50000', 'KG'),
(2, 'FLAME HARDENED', '10000', 'KG'),
(3, 'INDUCTION HARDENED', '100000', 'KG'),
(4, 'CARBURIZING', '75000', 'KG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(100) NOT NULL,
  `deskripsi` varchar(200) DEFAULT NULL,
  `no_quotation` varchar(100) DEFAULT NULL,
  `status_po` varchar(100) DEFAULT NULL,
  `tgl_po` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `progress` varchar(200) DEFAULT NULL,
  `no_invoice` varchar(100) DEFAULT NULL,
  `angka_invoice` varchar(100) DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `ket_dibayar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_treat`
--

CREATE TABLE `tb_treat` (
  `id_treat` int(11) NOT NULL,
  `treatment` varchar(200) NOT NULL,
  `treatment_cost` varchar(200) NOT NULL,
  `finishing` varchar(200) NOT NULL,
  `finishing_cost` varchar(200) NOT NULL,
  `weight` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `level` varchar(100) NOT NULL,
  `sejak` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `nama`, `password`, `level`, `sejak`) VALUES
(1, 'admin', 'administrator', '21232f297a57a5a743894a0e4a801fc3', 'admin', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_cust`);

--
-- Indexes for table `tb_fns`
--
ALTER TABLE `tb_fns`
  ADD PRIMARY KEY (`idFns`);

--
-- Indexes for table `tb_hpp`
--
ALTER TABLE `tb_hpp`
  ADD PRIMARY KEY (`id_hpp`);

--
-- Indexes for table `tb_macprocess`
--
ALTER TABLE `tb_macprocess`
  ADD PRIMARY KEY (`id_macprocess`);

--
-- Indexes for table `tb_mat`
--
ALTER TABLE `tb_mat`
  ADD PRIMARY KEY (`idMat`);

--
-- Indexes for table `tb_matprice`
--
ALTER TABLE `tb_matprice`
  ADD PRIMARY KEY (`id_matprice`);

--
-- Indexes for table `tb_mps`
--
ALTER TABLE `tb_mps`
  ADD PRIMARY KEY (`idMps`);

--
-- Indexes for table `tb_preprocess`
--
ALTER TABLE `tb_preprocess`
  ADD PRIMARY KEY (`id_preprocess`);

--
-- Indexes for table `tb_scharge`
--
ALTER TABLE `tb_scharge`
  ADD PRIMARY KEY (`id_scharge`);

--
-- Indexes for table `tb_thd`
--
ALTER TABLE `tb_thd`
  ADD PRIMARY KEY (`idThd`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_treat`
--
ALTER TABLE `tb_treat`
  ADD PRIMARY KEY (`id_treat`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id_cust` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_fns`
--
ALTER TABLE `tb_fns`
  MODIFY `idFns` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_hpp`
--
ALTER TABLE `tb_hpp`
  MODIFY `id_hpp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_macprocess`
--
ALTER TABLE `tb_macprocess`
  MODIFY `id_macprocess` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_mat`
--
ALTER TABLE `tb_mat`
  MODIFY `idMat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `tb_matprice`
--
ALTER TABLE `tb_matprice`
  MODIFY `id_matprice` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_mps`
--
ALTER TABLE `tb_mps`
  MODIFY `idMps` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tb_preprocess`
--
ALTER TABLE `tb_preprocess`
  MODIFY `id_preprocess` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_scharge`
--
ALTER TABLE `tb_scharge`
  MODIFY `id_scharge` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_thd`
--
ALTER TABLE `tb_thd`
  MODIFY `idThd` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_treat`
--
ALTER TABLE `tb_treat`
  MODIFY `id_treat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
