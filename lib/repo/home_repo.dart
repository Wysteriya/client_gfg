import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurego_gfg/utils/url.dart';
import 'package:intl/intl.dart';

class HomeRepository {



  Future<String> AllInsuranceTypes() async {
    final url = Uri.parse('https://r7tdo1y07b.execute-api.us-east-1.amazonaws.com/api/client/getalltypes');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }






  Future<String> login(
    String emailAddress,
    String password,
  ) async {
    final url = Uri.parse(URL.url + 'client/login');
    print(url);
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "emailAddress": emailAddress,
            "password": password,
          }));

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }


}
