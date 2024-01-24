// ignore_for_file: must_be_immutable

import 'package:covid19/screens/data_screen.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String name;
  String image;
  late int updated,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      critical,
      active,
      tests;

  DetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.updated,
    required this.active,
    required this.cases,
    required this.critical,
    required this.deaths,
    required this.recovered,
    required this.tests,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
         backgroundColor: const Color.fromARGB(255, 107, 35, 35),
        title: Text(
          
          widget.name,style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(widget.image),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 10,
            shadowColor: const Color.fromARGB(255, 107, 35, 35),
            color: const Color.fromARGB(255, 213, 189, 189),
            child: Column(
              children: [
                Detialsvalue(
                  title: 'Total Tests',
                  value: widget.tests.toString(),
                ),
                Detialsvalue(
                  title: 'Active Cases',
                  value: widget.active.toString(),
                ),
                Detialsvalue(
                  title: 'Total Cases',
                  value: widget.cases.toString(),
                ),
                Detialsvalue(
                  title: 'Today Cases',
                  value: widget.todayCases.toString(),
                ),
                Detialsvalue(
                  title: 'Total Deaths',
                  value: widget.deaths.toString(),
                ),
                Detialsvalue(
                  title: 'Today Deaths',
                  value: widget.todayDeaths.toString(),
                ),
                Detialsvalue(
                  title: 'Critical Situation',
                  value: widget.critical.toString(),
                ),
                Detialsvalue(
                  title: 'Total Recovered',
                  value: widget.recovered.toString(),
                ),
                Detialsvalue(
                  title: 'Today Recovered',
                  value: widget.todayRecovered.toString(),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
