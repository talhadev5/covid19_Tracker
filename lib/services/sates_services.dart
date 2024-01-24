import 'dart:convert';

import 'package:covid19/models/world_api.dart';
import 'package:covid19/services/apps_url.dart';
import 'package:http/http.dart' as http;

class Stateservices {
  Future<Worldapi> fecthWorldapiRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStsteApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Worldapi.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countrieslist() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    // var data;
    if (response.statusCode == 200) {
     var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
