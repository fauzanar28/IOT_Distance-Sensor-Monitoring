-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Sep 2024 pada 06.14
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot_project`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `pukul` time DEFAULT NULL,
  `panjang` int(11) DEFAULT NULL,
  `led_menyala` varchar(10) DEFAULT NULL,
  `buzzer_status` enum('On','Off') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `tanggal`, `hari`, `pukul`, `panjang`, `led_menyala`, `buzzer_status`) VALUES
(4537, '2024-09-05', 'Kamis', '11:06:35', 0, 'Merah', 'On'),
(4538, '2024-09-05', 'Kamis', '11:06:38', 0, 'Merah', 'On'),
(4539, '2024-09-05', 'Kamis', '11:06:41', 0, 'Merah', 'On'),
(4540, '2024-09-05', 'Kamis', '11:06:44', 0, 'Merah', 'On'),
(4541, '2024-09-05', 'Kamis', '11:06:47', 0, 'Merah', 'On'),
(4542, '2024-09-05', 'Kamis', '11:06:50', 0, 'Merah', 'On'),
(4543, '2024-09-05', 'Kamis', '11:06:54', 0, 'Merah', 'On'),
(4544, '2024-09-05', 'Kamis', '11:06:58', 0, 'Merah', 'On'),
(4545, '2024-09-05', 'Kamis', '11:07:01', 0, 'Merah', 'On'),
(4546, '2024-09-05', 'Kamis', '11:07:04', 0, 'Merah', 'On'),
(4547, '2024-09-05', 'Kamis', '11:07:07', 0, 'Merah', 'On'),
(4548, '2024-09-05', 'Kamis', '11:07:10', 0, 'Merah', 'On'),
(4549, '2024-09-05', 'Kamis', '11:07:13', 0, 'Merah', 'On'),
(4550, '2024-09-05', 'Kamis', '11:07:16', 0, 'Merah', 'On'),
(4551, '2024-09-05', 'Kamis', '11:07:20', 0, 'Merah', 'On'),
(4552, '2024-09-05', 'Kamis', '11:07:23', 0, 'Merah', 'On'),
(4553, '2024-09-05', 'Kamis', '11:07:26', 0, 'Merah', 'On'),
(4554, '2024-09-05', 'Kamis', '11:07:29', 0, 'Merah', 'On'),
(4555, '2024-09-05', 'Kamis', '11:07:33', 0, 'Merah', 'On'),
(4556, '2024-09-05', 'Kamis', '11:07:36', 0, 'Merah', 'On'),
(4557, '2024-09-05', 'Kamis', '11:07:40', 0, 'Merah', 'On'),
(4558, '2024-09-05', 'Kamis', '11:07:43', 0, 'Merah', 'On'),
(4559, '2024-09-05', 'Kamis', '11:07:46', 0, 'Merah', 'On'),
(4560, '2024-09-05', 'Kamis', '11:07:49', 0, 'Merah', 'On'),
(4561, '2024-09-05', 'Kamis', '11:07:53', 0, 'Merah', 'On'),
(4562, '2024-09-05', 'Kamis', '11:07:56', 0, 'Merah', 'On'),
(4563, '2024-09-05', 'Kamis', '11:07:59', 0, 'Merah', 'On'),
(4564, '2024-09-05', 'Kamis', '11:08:02', 0, 'Merah', 'On'),
(4565, '2024-09-05', 'Kamis', '11:08:05', 0, 'Merah', 'On'),
(4566, '2024-09-05', 'Kamis', '11:08:09', 0, 'Merah', 'On'),
(4567, '2024-09-05', 'Kamis', '11:08:12', 0, 'Merah', 'On'),
(4568, '2024-09-05', 'Kamis', '11:08:15', 0, 'Merah', 'On'),
(4569, '2024-09-05', 'Kamis', '11:08:19', 0, 'Merah', 'On'),
(4570, '2024-09-05', 'Kamis', '11:08:22', 0, 'Merah', 'On'),
(4571, '2024-09-05', 'Kamis', '11:08:25', 0, 'Merah', 'On'),
(4572, '2024-09-05', 'Kamis', '11:08:28', 0, 'Merah', 'On'),
(4573, '2024-09-05', 'Kamis', '11:08:31', 0, 'Merah', 'On'),
(4574, '2024-09-05', 'Kamis', '11:08:34', 0, 'Merah', 'On'),
(4575, '2024-09-05', 'Kamis', '11:08:38', 0, 'Merah', 'On'),
(4576, '2024-09-05', 'Kamis', '11:08:42', 0, 'Merah', 'On'),
(4577, '2024-09-05', 'Kamis', '11:08:45', 0, 'Merah', 'On'),
(4578, '2024-09-05', 'Kamis', '11:08:48', 0, 'Merah', 'On'),
(4579, '2024-09-05', 'Kamis', '11:08:51', 0, 'Merah', 'On'),
(4580, '2024-09-05', 'Kamis', '11:08:54', 0, 'Merah', 'On'),
(4581, '2024-09-05', 'Kamis', '11:08:57', 0, 'Merah', 'On'),
(4582, '2024-09-05', 'Kamis', '11:09:01', 0, 'Merah', 'On'),
(4583, '2024-09-05', 'Kamis', '11:09:04', 0, 'Merah', 'On'),
(4584, '2024-09-05', 'Kamis', '11:09:07', 0, 'Merah', 'On'),
(4585, '2024-09-05', 'Kamis', '11:09:10', 0, 'Merah', 'On'),
(4586, '2024-09-05', 'Kamis', '11:09:14', 0, 'Merah', 'On'),
(4587, '2024-09-05', 'Kamis', '11:09:17', 0, 'Merah', 'On'),
(4588, '2024-09-05', 'Kamis', '11:09:21', 0, 'Merah', 'On'),
(4589, '2024-09-05', 'Kamis', '11:09:24', 0, 'Merah', 'On'),
(4590, '2024-09-05', 'Kamis', '11:09:27', 0, 'Merah', 'On'),
(4591, '2024-09-05', 'Kamis', '11:09:30', 0, 'Merah', 'On'),
(4592, '2024-09-05', 'Kamis', '11:09:34', 0, 'Merah', 'On'),
(4593, '2024-09-05', 'Kamis', '11:09:37', 0, 'Merah', 'On'),
(4594, '2024-09-05', 'Kamis', '11:09:40', 0, 'Merah', 'On'),
(4595, '2024-09-05', 'Kamis', '11:09:44', 0, 'Merah', 'On'),
(4596, '2024-09-05', 'Kamis', '11:09:47', 0, 'Merah', 'On'),
(4597, '2024-09-05', 'Kamis', '11:09:51', 0, 'Merah', 'On'),
(4598, '2024-09-05', 'Kamis', '11:09:54', 0, 'Merah', 'On'),
(4599, '2024-09-05', 'Kamis', '11:09:58', 0, 'Merah', 'On'),
(4600, '2024-09-05', 'Kamis', '11:10:01', 0, 'Merah', 'On'),
(4601, '2024-09-05', 'Kamis', '11:10:04', 0, 'Merah', 'On'),
(4602, '2024-09-05', 'Kamis', '11:10:08', 0, 'Merah', 'On'),
(4603, '2024-09-05', 'Kamis', '11:10:11', 0, 'Merah', 'On'),
(4604, '2024-09-05', 'Kamis', '11:10:14', 0, 'Merah', 'On'),
(4605, '2024-09-05', 'Kamis', '11:10:17', 0, 'Merah', 'On'),
(4606, '2024-09-05', 'Kamis', '11:10:20', 0, 'Merah', 'On'),
(4607, '2024-09-05', 'Kamis', '11:10:23', 0, 'Merah', 'On'),
(4608, '2024-09-05', 'Kamis', '11:10:27', 0, 'Merah', 'On'),
(4609, '2024-09-05', 'Kamis', '11:10:30', 0, 'Merah', 'On'),
(4610, '2024-09-05', 'Kamis', '11:10:33', 0, 'Merah', 'On'),
(4611, '2024-09-05', 'Kamis', '11:10:37', 0, 'Merah', 'On'),
(4612, '2024-09-05', 'Kamis', '11:10:40', 0, 'Merah', 'On'),
(4613, '2024-09-05', 'Kamis', '11:10:44', 0, 'Merah', 'On'),
(4614, '2024-09-05', 'Kamis', '11:10:47', 0, 'Merah', 'On'),
(4615, '2024-09-05', 'Kamis', '11:10:50', 0, 'Merah', 'On'),
(4616, '2024-09-05', 'Kamis', '11:10:53', 0, 'Merah', 'On'),
(4617, '2024-09-05', 'Kamis', '11:10:57', 0, 'Merah', 'On'),
(4618, '2024-09-05', 'Kamis', '11:11:00', 0, 'Merah', 'On'),
(4619, '2024-09-05', 'Kamis', '11:11:04', 0, 'Merah', 'On'),
(4620, '2024-09-05', 'Kamis', '11:11:07', 0, 'Merah', 'On'),
(4621, '2024-09-05', 'Kamis', '11:11:10', 0, 'Merah', 'On'),
(4622, '2024-09-05', 'Kamis', '11:11:13', 0, 'Merah', 'On'),
(4623, '2024-09-05', 'Kamis', '11:11:16', 0, 'Merah', 'On'),
(4624, '2024-09-05', 'Kamis', '11:11:19', 0, 'Merah', 'On'),
(4625, '2024-09-05', 'Kamis', '11:11:23', 0, 'Merah', 'On'),
(4626, '2024-09-05', 'Kamis', '11:11:26', 0, 'Merah', 'On'),
(4627, '2024-09-05', 'Kamis', '11:11:29', 0, 'Merah', 'On'),
(4628, '2024-09-05', 'Kamis', '11:11:32', 0, 'Merah', 'On'),
(4629, '2024-09-05', 'Kamis', '11:11:35', 0, 'Merah', 'On'),
(4630, '2024-09-05', 'Kamis', '11:11:39', 0, 'Merah', 'On'),
(4631, '2024-09-05', 'Kamis', '11:11:42', 0, 'Merah', 'On'),
(4632, '2024-09-05', 'Kamis', '11:11:45', 0, 'Merah', 'On'),
(4633, '2024-09-05', 'Kamis', '11:11:48', 0, 'Merah', 'On'),
(4634, '2024-09-05', 'Kamis', '11:11:51', 0, 'Merah', 'On'),
(4635, '2024-09-05', 'Kamis', '11:11:55', 0, 'Merah', 'On'),
(4636, '2024-09-05', 'Kamis', '11:11:58', 0, 'Merah', 'On'),
(4637, '2024-09-05', 'Kamis', '11:12:01', 0, 'Merah', 'On'),
(4638, '2024-09-05', 'Kamis', '11:12:04', 0, 'Merah', 'On'),
(4639, '2024-09-05', 'Kamis', '11:12:07', 0, 'Merah', 'On'),
(4640, '2024-09-05', 'Kamis', '11:12:10', 0, 'Merah', 'On'),
(4641, '2024-09-05', 'Kamis', '11:12:14', 0, 'Merah', 'On'),
(4642, '2024-09-05', 'Kamis', '11:12:17', 0, 'Merah', 'On'),
(4643, '2024-09-05', 'Kamis', '11:12:20', 0, 'Merah', 'On'),
(4644, '2024-09-05', 'Kamis', '11:12:24', 0, 'Merah', 'On'),
(4645, '2024-09-05', 'Kamis', '11:12:27', 0, 'Merah', 'On'),
(4646, '2024-09-05', 'Kamis', '11:12:30', 0, 'Merah', 'On'),
(4647, '2024-09-05', 'Kamis', '11:12:34', 0, 'Merah', 'On'),
(4648, '2024-09-05', 'Kamis', '11:12:37', 0, 'Merah', 'On'),
(4649, '2024-09-05', 'Kamis', '11:12:40', 0, 'Merah', 'On'),
(4650, '2024-09-05', 'Kamis', '11:12:43', 0, 'Merah', 'On'),
(4651, '2024-09-05', 'Kamis', '11:12:47', 0, 'Merah', 'On'),
(4652, '2024-09-05', 'Kamis', '11:12:50', 0, 'Merah', 'On'),
(4653, '2024-09-05', 'Kamis', '11:12:53', 0, 'Merah', 'On'),
(4654, '2024-09-05', 'Kamis', '11:12:56', 0, 'Merah', 'On'),
(4655, '2024-09-05', 'Kamis', '11:13:00', 0, 'Merah', 'On'),
(4656, '2024-09-05', 'Kamis', '11:13:03', 0, 'Merah', 'On'),
(4657, '2024-09-05', 'Kamis', '11:13:07', 0, 'Merah', 'On'),
(4658, '2024-09-05', 'Kamis', '11:13:10', 0, 'Merah', 'On'),
(4659, '2024-09-05', 'Kamis', '11:13:13', 0, 'Merah', 'On'),
(4660, '2024-09-05', 'Kamis', '11:13:16', 0, 'Merah', 'On'),
(4661, '2024-09-05', 'Kamis', '11:13:19', 0, 'Merah', 'On'),
(4662, '2024-09-05', 'Kamis', '11:13:23', 0, 'Merah', 'On'),
(4663, '2024-09-05', 'Kamis', '11:13:26', 0, 'Merah', 'On'),
(4664, '2024-09-05', 'Kamis', '11:13:29', 0, 'Merah', 'On'),
(4665, '2024-09-05', 'Kamis', '11:13:32', 0, 'Merah', 'On'),
(4666, '2024-09-05', 'Kamis', '11:13:35', 0, 'Merah', 'On'),
(4667, '2024-09-05', 'Kamis', '11:13:39', 0, 'Merah', 'On'),
(4668, '2024-09-05', 'Kamis', '11:13:42', 0, 'Merah', 'On'),
(4669, '2024-09-05', 'Kamis', '11:13:45', 0, 'Merah', 'On'),
(4670, '2024-09-05', 'Kamis', '11:13:49', 0, 'Merah', 'On'),
(4671, '2024-09-05', 'Kamis', '11:13:52', 0, 'Merah', 'On'),
(4672, '2024-09-05', 'Kamis', '11:13:55', 0, 'Merah', 'On'),
(4673, '2024-09-05', 'Kamis', '11:13:59', 0, 'Merah', 'On'),
(4674, '2024-09-05', 'Kamis', '11:14:02', 0, 'Merah', 'On'),
(4675, '2024-09-05', 'Kamis', '11:14:05', 0, 'Merah', 'On'),
(4676, '2024-09-05', 'Kamis', '11:14:08', 0, 'Merah', 'On'),
(4677, '2024-09-05', 'Kamis', '11:14:12', 0, 'Merah', 'On'),
(4678, '2024-09-05', 'Kamis', '11:14:15', 0, 'Merah', 'On'),
(4679, '2024-09-05', 'Kamis', '11:14:18', 0, 'Merah', 'On'),
(4680, '2024-09-05', 'Kamis', '11:14:22', 0, 'Merah', 'On'),
(4681, '2024-09-05', 'Kamis', '11:14:25', 0, 'Merah', 'On'),
(4682, '2024-09-05', 'Kamis', '11:14:28', 0, 'Merah', 'On'),
(4683, '2024-09-05', 'Kamis', '11:14:31', 0, 'Merah', 'On'),
(4684, '2024-09-05', 'Kamis', '11:14:34', 0, 'Merah', 'On'),
(4685, '2024-09-05', 'Kamis', '11:14:37', 0, 'Merah', 'On'),
(4686, '2024-09-05', 'Kamis', '11:14:41', 0, 'Merah', 'On'),
(4687, '2024-09-05', 'Kamis', '11:14:44', 0, 'Merah', 'On'),
(4688, '2024-09-05', 'Kamis', '11:14:47', 0, 'Merah', 'On'),
(4689, '2024-09-05', 'Kamis', '11:14:50', 0, 'Merah', 'On'),
(4690, '2024-09-05', 'Kamis', '11:14:53', 0, 'Merah', 'On'),
(4691, '2024-09-05', 'Kamis', '11:14:56', 0, 'Merah', 'On');

--
-- Trigger `sensor_data`
--
DELIMITER $$
CREATE TRIGGER `limit_sensor_data` BEFORE INSERT ON `sensor_data` FOR EACH ROW BEGIN
    DECLARE row_count INT;
    -- Hitung jumlah record di tabel
    SELECT COUNT(*) INTO row_count FROM sensor_data;
    -- Jika jumlah record >= 500, hapus record paling lama
    IF row_count >= 500 THEN
        DELETE FROM sensor_data ORDER BY id ASC LIMIT 1;
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4692;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
