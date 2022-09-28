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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp == -1) {
      return 'Unable to load the weather :(';
    } else if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
