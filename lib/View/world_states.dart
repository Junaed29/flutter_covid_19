import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              PieChart(
                dataMap: {
                  'Total': 20,
                  'Recovered': 15,
                  'Death': 5,
                },
                animationDuration: Duration(milliseconds: 1200),
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions:
                    LegendOptions(legendPosition: LegendPosition.left),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: "title", value: "value"),
                      ReusableRow(title: "title", value: "value"),
                      ReusableRow(title: "title", value: "value"),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff1aa260),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Track Countries",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              )
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
        SizedBox(height: 5),
        Divider(height: 1)
      ],
    );
  }
}
