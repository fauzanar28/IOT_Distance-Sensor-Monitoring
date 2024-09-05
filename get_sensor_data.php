<?php
// Koneksi ke database
$conn = new mysqli("localhost", "root", "", "iot_project");

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Mengambil data dari tabel 'sensor_data'
$sql = "SELECT pukul, panjang FROM sensor_data ORDER BY id DESC LIMIT 50";
$result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

$conn->close();

// Mengembalikan data dalam format JSON
echo json_encode($data);
?>
