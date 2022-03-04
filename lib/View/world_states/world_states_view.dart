import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import 'world_states_logic.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  _WorldStatesScreenState createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WorldStatesLogic());
    logic.fetchData();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Obx(() {
                if (logic.loading.value) {
                  return const Expanded(
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  );
                }
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .01),
                    Obx(() {
                      return PieChart(
                        dataMap: {
                          'Total':
                              logic.worldStatesList.value.cases!.toDouble(),
                          'Recovered':
                              logic.worldStatesList.value.recovered!.toDouble(),
                          'Death':
                              logic.worldStatesList.value.deaths!.toDouble(),
                        },
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        animationDuration: const Duration(milliseconds: 1200),
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                        chartType: ChartType.ring,
                        colorList: colorList,
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.06),
                      child: Card(
                        child: Obx(() {
                          return Column(
                            children: [
                              ReusableRow(
                                  title: "Total",
                                  value: logic.worldStatesList.value.cases!
                                      .toDouble()
                                      .toString()),
                              ReusableRow(
                                  title: "Deaths",
                                  value: logic.worldStatesList.value.deaths!
                                      .toDouble()
                                      .toString()),
                              ReusableRow(
                                  title: "Recovered",
                                  value: logic.worldStatesList.value.recovered!
                                      .toDouble()
                                      .toString()),
                              ReusableRow(
                                  title: "Active",
                                  value: logic.worldStatesList.value.active!
                                      .toDouble()
                                      .toString()),
                              ReusableRow(
                                  title: "Critical",
                                  value: logic.worldStatesList.value.critical!
                                      .toDouble()
                                      .toString()),
                              ReusableRow(
                                  title: "Today Deaths",
                                  value: logic
                                      .worldStatesList.value.todayDeaths!
                                      .toDouble()
                                      .toString()),
                              ReusableRow(
                                  title: "Today Recovered",
                                  value: logic
                                      .worldStatesList.value.todayRecovered!
                                      .toDouble()
                                      .toString()),
                            ],
                          );
                        }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff1aa260),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Track Countries",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(height: 1)
      ],
    );
  }
}
