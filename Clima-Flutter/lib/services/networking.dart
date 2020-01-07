import 'package:http/http.dart' as http;
import 'dart:convert';



class NetworkHelper {

  NetworkHelper(this.openWeatherURL);

  var openWeatherURL;


  Future getData() async {
    http.Response response = await http.get(openWeatherURL);
    print(response);
    if (response.statusCode == 200 ) {
      print("success");
      print(response.body);
      return jsonDecode(response.body);

    }else {
      print(response.statusCode);
    }
  }


}