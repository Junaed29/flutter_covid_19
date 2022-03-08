import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'countries_list_logic.dart';

class CountriesListScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CountriesListLogic())..fetchData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
                hintText: "Search with country name",
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)))),
          ),
          Obx(() {
            if (logic.loading.value) {
              return const Expanded(
                child: SpinKitFadingCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(logic.countryList[index].country!),
                      subtitle:
                          Text(logic.countryList[index].cases!.toString()),
                      leading: Container(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                logic.countryList[index].countryInfo!.flag!),
                          )),
                    );
                  },
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
