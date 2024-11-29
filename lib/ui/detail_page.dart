import 'package:flutter/material.dart';
import 'package:weatherapp/models/constants.dart';
import 'package:weatherapp/ui/welcome.dart';
import 'package:weatherapp/widgets/weather_item.dart';

class DetailPage extends StatefulWidget {
  final List consolidatedWeatherList;
  final int selectedId;
  final String location;

  const DetailPage({
    super.key,
    required this.consolidatedWeatherList,
    required this.selectedId,
    required this.location
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    int selectedIndex = widget.selectedId;
    var weatherStateName = widget.consolidatedWeatherList[selectedIndex]['weather'][0]['description'];
    String iconCode = widget.consolidatedWeatherList[selectedIndex]['weather'][0]['icon'];

    return Scaffold(
      backgroundColor: myConstants.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: myConstants.secondaryColor,
        elevation: 0.0,
        title: Text(widget.location),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Welcome()));
              },
              icon: const Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height * .45,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    right: 20,
                    left: 20,
                    child: Container(
                      width: size.width * .7,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          colors: [
                            Color(0xffa9c1f5),
                            Color(0xff6696f5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.1),
                            offset: const Offset(0, 25),
                            blurRadius: 3,
                            spreadRadius: -10,
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40,
                            left: 20,
                            child: Image.network(
                              'http://openweathermap.org/img/wn/$iconCode@4x.png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                weatherStateName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              width: size.width * .8,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherItem(
                                    text: 'Velocidad Viento',
                                    value: widget.consolidatedWeatherList[selectedIndex]['wind']['speed'].round(),
                                    unit: 'km/h',
                                    imageUrl: 'http://openweathermap.org/img/wn/50d@2x.png',
                                  ),
                                  WeatherItem(
                                    text: 'Humedad',
                                    value: widget.consolidatedWeatherList[selectedIndex]['main']['humidity'].round(),
                                    unit: '%',
                                    imageUrl: 'http://openweathermap.org/img/wn/09d@2x.png',
                                  ),
                                  WeatherItem(
                                    text: 'Temp Max',
                                    value: widget.consolidatedWeatherList[selectedIndex]['main']['temp_max'].round(),
                                    unit: '°C',
                                    imageUrl: 'http://openweathermap.org/img/wn/01d@2x.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.consolidatedWeatherList[selectedIndex]['main']['temp'].round().toString(),
                                  style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()..shader = linearGradient,
                                  ),
                                ),
                                Text(
                                  '°',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()..shader = linearGradient,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}