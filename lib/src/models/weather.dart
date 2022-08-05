class Weather {
  final temp;
  final humidity;
  final windSpeed;

  Weather({
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json["main"]["temp"] - 273.15,
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["Speed"],
    );
  }
}
