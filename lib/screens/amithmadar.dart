import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dio/dio.dart';

final dio = Dio();


  void makePostRequestWithCookies() async {
    // Create a new http client
    var client = http.Client();

    try {
      // Define the endpoint URL
      var url = Uri.parse('http://34.125.247.127:9080/baby_chain/private/node');

      // Define the request body
      var requestBody = jsonEncode({'yash': 'yash'});

      // Define the request headers
      var headers = {'Content-Type': 'application/json'};

      // Create a new http POST request with the defined URL, headers and body
      var response = await client.post(
        url,
        headers: headers,
        body: requestBody,
      );

      // Check if the response contains cookies
      if (response.headers.containsKey('set-cookie')) {
        // Extract the cookies from the response headers
        var cookies = response.headers['set-cookie'];

        // Store the cookies for later use
        // You can store the cookies in a CookieJar or in SharedPreferences
        // Here, we are just printing the cookies for demonstration purposes
        print('Received cookies: $cookies');
      }

      // Handle the response body
      if (response.statusCode == 200) {
        var responseBody = response.body;
        print(responseBody);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error making POST request: $error');
    } finally {
      // Close the client
      client.close();
    }
  }





void main() async {
  makePostRequestWithCookies();
}
