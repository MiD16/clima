import 'dart:convert';

import 'package:http/http.dart' as http;
import '';

class NetworkingHelper {
  final String url;
  NetworkingHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'message': 'got ${response.statusCode} as a status code'};
    }
  }
}
