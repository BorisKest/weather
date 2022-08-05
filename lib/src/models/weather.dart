class Weather {
  final String city;
  final int temp;
  final String humidity;
  final String windSpeed;

  Weather({
    required this.city,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: (json["main"]["temp"] - 273.15).toInt(),
      humidity: json["main"]["humidity"].toString(),
      windSpeed: json["wind"]["speed"].toString(),
      city: json["name"],
    );
  }
}
