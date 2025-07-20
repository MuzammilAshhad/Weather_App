import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey = "5e29c818765d441d941174410250207";

class WeatherApiService{
  final String _baseUrl = "https://api.weatherapi.com/v1";



  //for current 7 days
  Future<Map<String, dynamic>> getHourlyForecast(String location) async {
    final url = Uri.parse("$_baseUrl/forecast.json?Key=$apiKey&q=$location&days=7");

    final res = await http.get(url);
    if(res.statusCode != 200){
      throw
        Exception("Failed to fetch data: ${res.body}");
    }

    final data = json.decode(res.body);

    if(data.containsKey('error')){
      throw Exception(
        data['error']['message']?? 'Invalid location'
      );
    }
    return data;
  }


  //for previous 7 days
  Future<List<Map<String, dynamic>>> getPastSevenDaysWeather(String location) async {
    final List<Map<String, dynamic>> pastWeather =[];

    final today = DateTime.now();
    for(int i = 1 ; i < 7 ; i++){
      final data = today.subtract(Duration(days: i));
      final formattedDate = "${data.year}-${data.month.toString().padLeft(2, "0")}-${data.day.toString().padLeft(2,"0")}";

      final url = Uri.parse("$_baseUrl/history.json?Key=$apiKey&q=$location&dt=$formattedDate");

      final res = await http.get(url);

      if(res.statusCode == 200){

        final data = json.decode(res.body);

        if(data.containsKey('error')){
          throw Exception(
            data['error']['message']?? 'Invalid location'
          );
        }

        if(data["forecast"]?["forecastdays"] != null){
          pastWeather.add(data);
        }
      }
      else{
        debugPrint("Failed to fetch past data from $formattedDate : ${res.body}");
      }

      
      
    }

    return pastWeather;
  }

}