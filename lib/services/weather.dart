import 'location.dart';
import 'networking.dart';

const apiKey = '2ea63928d1ab52c558cc25b2ec207ffa',
    openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherCity(String cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
            '$openWeatherMapURL?q=${cityName.toLowerCase()}&appid=${apiKey}&units=metric');
    var data = await networkingHelper.getData();
    assert(data != null);
    return data;
  }

  Future<dynamic> getWeatherLocation() async {
    Location l = Location();
    print(await l.getCurrentLocation());
    // l.latitude = 33.4879;
    // l.longitude = 36.3444;

    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
            '$openWeatherMapURL?lat=${l.latitude}&lon=${l.longitude}&appid=${apiKey}&units=metric');
    var data = await networkingHelper.getData();
    assert(data != null);
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition == -1) {
      return '';
    } else if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp == -1) {
      return 'Unable to load the weather :(';
    } else if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
