import 'package:get/get.dart';

import '../models/WorldStatesModel.dart';
import 'utilities/app_urls.dart';

class StatesServices extends GetConnect {
  Future<WorldStatesModel> getWorldStates() async {
    print("sdfsdf");
    var response = await get(AppUrls.worldStatesApi);

    if (response.statusCode == 200) {
      print("Succedd");
      print(response.bodyString);
      return worldStatesModelFromJson(response.bodyString!);
    } else {
      print(response.statusText);
      throw Exception("Error");
    }
  }
}
