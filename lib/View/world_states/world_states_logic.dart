import 'package:get/get.dart';

import '../../models/WorldStatesModel.dart';
import '../../services/states_services.dart';

class WorldStatesLogic extends GetxController {
  var loading = true.obs;
  var worldStatesList = WorldStatesModel().obs;

  void fetchData() async {
    loading.value = true;
    var data = await StatesServices().getWorldStates();
    if (data != null) {
      print(data.toString());
      worldStatesList.value = data;
      loading.value = false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
