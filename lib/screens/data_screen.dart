// import 'dart:ffi';
// import 'dart:html';

// import 'package:fl_chart/fl_chart.dart';
import 'package:covid19/screens/list_countries.dart';
import 'package:covid19/services/sates_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19/models/world_api.dart';

class Datascreen extends StatefulWidget {
  const Datascreen({Key? key}) : super(key: key);

  @override
  State<Datascreen> createState() => _DatascreenState();
}

class _DatascreenState extends State<Datascreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..reset();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorlist = <Color>[
    const Color.fromARGB(246, 201, 1, 1),
    const Color.fromARGB(240, 48, 172, 20),
    const Color.fromARGB(255, 210, 190, 65),
    const Color.fromARGB(255, 0, 0, 0),
  ];
  // final Map<String, double> dataMap = {
  //   "Total":double.parse(snapshot.data!.cases!.toString()),
  //   "Recoverd": 120,
  //   "Death": 80,
  // };

  @override
  Widget build(BuildContext context) {
    Stateservices stateservices = Stateservices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
                future: stateservices.fecthWorldapiRecords(),
                builder: (context, AsyncSnapshot<Worldapi> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: const Color.fromARGB(255, 150, 92, 92),
                          controller: _controller,
                          size: 60.0,
                        ));
                  } else {
                    return Column(children: [
                      PieChart(
                        //  dataMap: dataMap,
                        dataMap: {
                          "Total":
                              double.parse(snapshot.data!.cases!.toString()),
                          "Recovered":
                              double.parse(snapshot.data!.recovered.toString()),
                          "Critical Situation":
                              double.parse(snapshot.data!.active.toString()),
                          "Deaths":
                              double.parse(snapshot.data!.deaths.toString()),
                        },
                        animationDuration: const Duration(seconds: 4),
                        chartType: ChartType.ring,
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        chartLegendSpacing: 30,
                        chartRadius: 120,
                        colorList: colorlist,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                            legendTextStyle:
                                TextStyle(fontWeight: FontWeight.w800)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 6),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 10,
                          shadowColor: const Color.fromARGB(255, 107, 35, 35),
                          color: const Color.fromARGB(255, 213, 189, 189),
                          child: Column(children: [
                            Detialsvalue(
                              title: 'Active Cases',
                              value: snapshot.data!.active.toString(),
                            ),
                            Detialsvalue(
                              title: 'Total Cases',
                              value: snapshot.data!.cases.toString(),
                            ),
                            Detialsvalue(
                              title: 'Today Cases',
                              value: snapshot.data!.todayCases.toString(),
                            ),
                            Detialsvalue(
                              title: 'Total Deaths',
                              value: snapshot.data!.deaths.toString(),
                            ),
                            Detialsvalue(
                              title: 'Today Deaths',
                              value: snapshot.data!.todayDeaths.toString(),
                            ),
                            Detialsvalue(
                              title: 'Critical Situation',
                              value: snapshot.data!.critical.toString(),
                            ),
                            Detialsvalue(
                              title: 'Total Recovered',
                              value: snapshot.data!.recovered.toString(),
                            ),
                            Detialsvalue(
                              title: 'Today Recovered',
                              value: snapshot.data!.todayRecovered.toString(),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Countrieslist()));
                        },
                        child: Container(
                          height: 50,
                          width: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(255, 107, 35, 35),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 148, 147, 147),
                                    offset: Offset(0, 5),
                                    blurRadius: 10,
                                    spreadRadius: 2)
                              ]),
                          child: const Center(
                            child: Text(
                              'Country Tracker',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]);
                  }
                }),
          ]),
        ),
      ),
    );
  }
}

// detialvalue class
class Detialsvalue extends StatelessWidget {
  final String title, value;
  const Detialsvalue({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              Text(
                value,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 196, 17, 5)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Color.fromARGB(255, 107, 35, 35),
          ),
        ],
      ),
    );
  }
}
