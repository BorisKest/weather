class Weather {
  double temp;
  double humidity;
  double windSpeed;

  Weather({
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['temp'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'],
    );
  }
}
