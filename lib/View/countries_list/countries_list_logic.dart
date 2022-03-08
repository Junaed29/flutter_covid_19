import 'package:get/get.dart';

import '../../models/Country.dart';
import '../../services/states_services.dart';

class CountriesListLogic extends GetxController {
  var loading = true.obs;
  var countryList = <Country>[].obs;
  var searchableList = <Country>[].obs;

  void fetchData() async {
    loading.value = true;
    var data = await StatesServices().getAllCountiesDetails();
    if (data != null) {
      countryList.value = data;
      loading.value = false;
    }
  }
}
