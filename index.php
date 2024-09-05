<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Sensor Jarak</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: 'Poppins', sans-serif;
        }
        .navbar {
            margin-bottom: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .navbar-dark .navbar-nav .nav-link,
        .navbar-dark .navbar-brand {
            color: #fff;
        }
        .table thead th {
            background-color: #343a40;
            color: #fff;
        }
        .table tbody tr:nth-child(even) {
            background-color: #212529;
        }
        .table tbody tr:hover {
            background-color: #343a40;
            transition: background-color 0.3s ease;
        }
        .table td {
            color: #ddd; /* Warna teks lebih terang */
            vertical-align: middle;
        }
        .led-icon {
            font-size: 1.5em;
        }
        .led-red { color: #ff6666; }
        .led-yellow { color: #ffff66; }
        .led-green { color: #66ff66; }
        .led-blue { color: #6666ff; }
        .led-off { color: #c6c6c6; }
        .led-on { animation: pulse 1s infinite; }
        .header-jumbotron {
            background: linear-gradient(45deg, #212529, #343a40);
            color: #fff;
            padding: 2rem 1rem;
            border-radius: .3rem;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-bottom: 4px solid #495057;
        }
        .header-jumbotron img {
            position: absolute;
            top: 15px;
            left: 15px;
            height: 150px;
            width: auto;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            border-radius: 50px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        .filter-container {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Proyek IoT</a>
</nav>

<div class="header-jumbotron">
    <img src="images/umy-logo.png" alt="Logo UMY">
    <h1 class="display-4">Project Monitoring Sensor Jarak Berbasis IoT</h1>
    <p class="lead">by Fauzan Abdul Rasyid</p>
</div>

<div class="container mt-5">
    <h2 class="text-center mb-4">Data Sensor Jarak</h2>
    <div class="filter-container">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <select id="ledFilter" class="form-control">
                    <option value="">Semua LED</option>
                    <option value="led-red">LED Merah</option>
                    <option value="led-yellow">LED Kuning</option>
                    <option value="led-green">LED Hijau</option>
                    <option value="led-blue">LED Biru</option>
                    <option value="led-off">LED Mati</option>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <select id="buzzerFilter" class="form-control">
                    <option value="">Semua Status Buzzer</option>
                    <option value="text-danger">Buzzer On</option>
                    <option value="text-muted">Buzzer Off</option>
                </select>
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tanggal</th>
                    <th>Hari</th>
                    <th>Pukul</th>
                    <th>Jarak (cm)</th>
                    <th>LED Menyala</th>
                    <th>Status Buzzer</th>
                </tr>
            </thead>
            <tbody id="sensor-data">
                <?php
                // Koneksi ke database
                $conn = new mysqli("localhost", "root", "", "iot_project");

                // Memeriksa koneksi
                if ($conn->connect_error) {
                    die("Koneksi gagal: " . $conn->connect_error);
                }

                // Mengambil data dari tabel 'sensor_data'
                $sql = "SELECT * FROM sensor_data ORDER BY id DESC LIMIT 100";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $ledClass = getLEDClass($row["led_menyala"]);
                        $buzzerClass = ($row["buzzer_status"] == "On") ? "text-danger" : "text-muted";
                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($row["id"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["tanggal"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["hari"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["pukul"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["panjang"]) . "</td>";
                        echo "<td class='text-center'><i class='fas fa-lightbulb led-icon $ledClass led-on'></i></td>";
                        echo "<td class='text-center'><i class='fas fa-bell $buzzerClass'></i></td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='7'>Tidak ada data ditemukan</td></tr>";
                }
                $conn->close();
                
                // Fungsi untuk menentukan kelas warna LED berdasarkan status
                function getLEDClass($status) {
                    switch($status) {
                        case 'Merah': return 'led-red';
                        case 'Kuning': return 'led-yellow';
                        case 'Hijau': return 'led-green';
                        case 'Biru': return 'led-blue';
                        case 'Mati': return 'led-off';
                        default: return 'led-off';
                    }
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 Proyek IoT. Semua hak cipta dilindungi.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function() {
    // Fungsi untuk memfilter tabel berdasarkan input
    function filterTable() {
        var ledFilter = $('#ledFilter').val().toLowerCase();
        var buzzerFilter = $('#buzzerFilter').val().toLowerCase();

        $('#sensor-data tr').each(function() {
            var row = $(this);
            var led = row.find('td').eq(5).find('i').attr('class').toLowerCase();
            var buzzer = row.find('td').eq(6).find('i').attr('class').toLowerCase();

            // Cek apakah filter LED dan Buzzer sesuai
            var matchLed = (ledFilter === '' || led.indexOf(ledFilter) !== -1);
            var matchBuzzer = (buzzerFilter === '' || buzzer.indexOf(buzzerFilter) !== -1);

            // Menampilkan atau menyembunyikan baris berdasarkan kondisi filter
            if (matchLed && matchBuzzer) {
                row.show();
            } else {
                row.hide();
            }
        });
    }

    // Penerapan event listener pada filter
    $('#ledFilter, #buzzerFilter').on('input change', function() {
        filterTable();
    });
});
</script>

</body>
</html>
