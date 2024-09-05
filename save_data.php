<?php
// Aktifkan error reporting untuk debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Konfigurasi koneksi database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "iot_project";

// Membuat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Mengambil data dari request GET dengan penanganan jika parameter tidak ada
$tanggal = isset($_GET['tanggal']) ? $_GET['tanggal'] : '';
$hari = isset($_GET['hari']) ? $_GET['hari'] : '';
$pukul = isset($_GET['pukul']) ? $_GET['pukul'] : '';
$panjang = isset($_GET['panjang']) ? $_GET['panjang'] : '';
$led_menyala = isset($_GET['led_menyala']) ? $_GET['led_menyala'] : '';
$buzzer_status = isset($_GET['buzzer_status']) ? $_GET['buzzer_status'] : '';

// Memeriksa apakah semua data tersedia
if ($tanggal && $hari && $pukul && $panjang !== '' && $led_menyala && $buzzer_status) {
    // Menggunakan prepared statement untuk menghindari SQL injection
    $stmt = $conn->prepare("INSERT INTO sensor_data (tanggal, hari, pukul, panjang, led_menyala, buzzer_status) VALUES (?, ?, ?, ?, ?, ?)");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }

    // Mengikat parameter dan mengeksekusi statement
    $stmt->bind_param("ssssss", $tanggal, $hari, $pukul, $panjang, $led_menyala, $buzzer_status);

    if ($stmt->execute()) {
        echo "Data berhasil disimpan.";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Menutup statement
    $stmt->close();
} else {
    echo "Data tidak lengkap. Silakan periksa parameter yang diterima.";
}

// Menutup koneksi
$conn->close();
?>
