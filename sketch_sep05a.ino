#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <NTPClient.h>
#include <ESP8266HTTPClient.h>

// Konfigurasi WiFi
const char* ssid = "OJAN";
const char* password = "Ojan12345";

// URL server untuk mengirim data
const String serverName = "http://192.168.122.157/iot_project/save_data.php";

// Konfigurasi pin
const int trigPin = D2;    // Pin trigger sensor jarak
const int echoPin = D3;    // Pin echo sensor jarak

const int greenLEDPin = D5;    // Pin LED hijau
const int yellowLEDPin = D6;   // Pin LED kuning
const int redLEDPin = D7;      // Pin LED merah
const int blueLEDPin = D8;     // Pin LED biru
const int buzzerPin = D4;      // Pin buzzer

long duration;
int distance;

// NTP client setup untuk WIB (UTC +7) 
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", 25200, 60000);

// Create a WiFiClient object
WiFiClient client;

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED && attempts < 30) {
    delay(500);
    Serial.print(".");
    attempts++;
  }

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println();
    Serial.println("Connected to WiFi");
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());

    // Update waktu setelah koneksi Wi-Fi berhasil
    timeClient.begin();
    timeClient.update();
  } else {
    Serial.println();
    Serial.println("Failed to connect to WiFi");
    Serial.print("Status: ");
    Serial.println(WiFi.status());
  }

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(greenLEDPin, OUTPUT);
  pinMode(yellowLEDPin, OUTPUT);
  pinMode(redLEDPin, OUTPUT);
  pinMode(blueLEDPin, OUTPUT);   // Set pin mode for blue LED
  pinMode(buzzerPin, OUTPUT);    // Set pin mode for buzzer
}

void loop() {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("Reconnecting to WiFi...");
    WiFi.reconnect();
    delay(5000);
  }

  timeClient.update();

  // Mengukur jarak
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2;

  String ledStatus = "";
  String buzzerStatus = "Off";

  // Mengatur LED dan buzzer berdasarkan jarak
  if (distance < 10) {
    digitalWrite(blueLEDPin, LOW);   // Matikan LED biru
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(yellowLEDPin, LOW);
    digitalWrite(redLEDPin, HIGH);
    digitalWrite(buzzerPin, HIGH);  // Nyalakan buzzer
    ledStatus = "Merah";
    buzzerStatus = "On";
  } else if (distance < 20) {
    digitalWrite(blueLEDPin, LOW);   // Matikan LED biru
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(yellowLEDPin, HIGH);
    digitalWrite(redLEDPin, LOW);
    digitalWrite(buzzerPin, LOW);
    ledStatus = "Kuning";
  } else if (distance < 30) {
    digitalWrite(blueLEDPin, LOW);   // Matikan LED biru
    digitalWrite(greenLEDPin, HIGH);
    digitalWrite(yellowLEDPin, LOW);
    digitalWrite(redLEDPin, LOW);
    digitalWrite(buzzerPin, LOW);
    ledStatus = "Hijau";
  } else if (distance < 40) {
    digitalWrite(blueLEDPin, HIGH);  // Nyalakan LED biru
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(yellowLEDPin, LOW);
    digitalWrite(redLEDPin, LOW);
    digitalWrite(buzzerPin, LOW);
    ledStatus = "Biru";
  } else {
    digitalWrite(blueLEDPin, LOW);   // Matikan LED biru
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(yellowLEDPin, LOW);
    digitalWrite(redLEDPin, LOW);
    digitalWrite(buzzerPin, LOW);
    ledStatus = "Mati";
  }

  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    String serverPath = serverName + "?tanggal=" + getDate() + "&hari=" + getDay() +
                        "&pukul=" + getTime() + "&panjang=" + distance +
                        "&led_menyala=" + ledStatus + "&buzzer_status=" + buzzerStatus;

    http.begin(client, serverPath);

    int httpResponseCode = http.GET();

    if (httpResponseCode > 0) {
      String response = http.getString();
      Serial.println(httpResponseCode);
      Serial.println(response);
    } else {
      Serial.print("Error in sending data: ");
      Serial.println(httpResponseCode);
    }

    http.end();
  } else {
    Serial.println("WiFi Disconnected");
  }

  delay(2000);
}

// Fungsi untuk mendapatkan tanggal dalam format YYYY-MM-DD
String getDate() {
  int epochTime = timeClient.getEpochTime();
  time_t rawtime = epochTime;
  struct tm *info = localtime(&rawtime);

  char date[11];
  strftime(date, 11, "%Y-%m-%d", info);
  return String(date);
}

// Fungsi untuk mendapatkan hari dalam bahasa Indonesia
String getDay() {
  String daysOfWeek[] = {"Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"};
  int dayOfWeek = timeClient.getDay();
  return daysOfWeek[dayOfWeek];
}

// Fungsi untuk mendapatkan waktu dalam format HH:MM:SS
String getTime() {
  return timeClient.getFormattedTime();
}
