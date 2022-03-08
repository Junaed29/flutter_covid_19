import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Country.dart';
import '../models/WorldStatesModel.dart';
import 'utilities/app_urls.dart';

class StatesServices {
  Future<WorldStatesModel> getWorldStates() async {
    print("sdfsdf");
    var response = await http.get(Uri.parse(AppUrls.worldStatesApi));

    if (response.statusCode == 200) {
      print("Succedd");
      print(response.body.toString());
      return worldStatesModelFromJson(response.body.toString());
    } else {
      print(response.statusCode);
      throw Exception("Error");
    }
  }

  Future<List<Country>?> getAllCountiesDetails() async {
    print("sdfsdf");
    var response = await http.get(Uri.parse(AppUrls.countriesList));

    if (response.statusCode == 200) {
      List<Country> countryList = [];
      var data = json.decode(response.body);
      for (Map i in data) {
        Country country = Country.fromJson(i);
        countryList.add(country);
      }
      return countryList;
    } else {
      print(response.reasonPhrase);
      throw Exception("Error");
    }
  }
}
