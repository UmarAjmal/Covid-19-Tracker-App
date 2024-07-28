import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  // const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 5), vsync: this)
        ..repeat();

  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorldStates(),
        ),
      ),
    );
  }

  final colorList = <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              PieChart(
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
                dataMap: {'Total': 20, "Recovered": 15, "Deats": 5},
                animationDuration: Duration(microseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: Column(
                  children: [
                    ResuableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ResuableRow(
                      title: 'Total',
                      value: '23',
                    ),
                    ResuableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ResuableRow(
                      title: 'Total',
                      value: '546',
                    ),
                    ResuableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ResuableRow(
                      title: 'Total',
                      value: '32',
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff1aa260), borderRadius: BorderRadius.circular(10)
                      
                ),
                child: Center(
                  child: Text("Track Countries"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResuableRow extends StatelessWidget {
  late String title, value;

  ResuableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
