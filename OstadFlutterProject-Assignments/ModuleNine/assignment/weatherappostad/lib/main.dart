import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isLoading = true;
  bool isError = false;
  WeatherData? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=boise&appid=0dadc0ec41869d72cab605ebf70d5c96';

      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          weatherData = WeatherData.fromJson(jsonData);
          isLoading = false;
        });
      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : isError
                ? Text('Error fetching weather data')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weatherData!.location,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      CachedNetworkImage(
                        imageUrl: weatherData!.weatherImage,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${weatherData!.temperature}°C',
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'CustomFont',
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        weatherData!.weatherDescription,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'CustomFont',
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

class WeatherData {
  final String location;
  final String temperature;
  final String weatherDescription;
  final String weatherImage;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherImage,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final iconCode = weather['icon'];
    final temperature = (json['main']['temp'] - 273.15).toStringAsFixed(1);

    return WeatherData(
      location: json['name'],
      temperature: temperature,
      weatherDescription: weather['main'],
      weatherImage:
          'https://openweathermap.org/img/w/$iconCode.png',
    );
  }
}