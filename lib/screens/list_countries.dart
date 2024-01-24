import 'package:covid19/screens/detail_page.dart';
import 'package:covid19/services/sates_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Countrieslist extends StatefulWidget {
  const Countrieslist({Key? key}) : super(key: key);

  @override
  State<Countrieslist> createState() => _CountrieslistState();
}

TextEditingController serchcontroller = TextEditingController();

class _CountrieslistState extends State<Countrieslist> {
  @override
  Widget build(BuildContext context) {
    Stateservices stateservices = Stateservices();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 107, 35, 35),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 310,
              height: 47,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 188, 184, 184),
                        offset: Offset(0, 0),
                        blurRadius: 24,
                        spreadRadius: 2)
                  ]),
              child: TextFormField(
                cursorHeight: 25,
                cursorColor: const Color.fromARGB(255, 107, 35, 35),
                controller: serchcontroller,
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: stateservices.countrieslist(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                            period: const Duration(seconds: 3),
                            baseColor: const Color.fromARGB(255, 128, 125, 125),
                            highlightColor:
                                const Color.fromARGB(255, 62, 61, 61),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 90,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 90,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ));
                      });
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (serchcontroller.text.isEmpty) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                updated: snapshot.data![index]
                                                    ['updated'],
                                                tests: snapshot.data![index]
                                                    ['tests'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                cases: snapshot.data![index]
                                                    ['cases'],
                                                todayCases: snapshot
                                                    .data![index]['todayCases'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                deaths: snapshot.data![index]
                                                    ['deaths'],
                                                todayDeaths:
                                                    snapshot.data![index]
                                                        ['todayDeaths'],
                                                recovered: snapshot.data![index]
                                                    ['recovered'],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]['country'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                  selectedColor:
                                      const Color.fromARGB(255, 213, 189, 189),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag'])),
                                ),
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 107, 35, 35),
                              )
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(serchcontroller.text.toLowerCase())) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                updated: snapshot.data![index]
                                                    ['updated'],
                                                tests: snapshot.data![index]
                                                    ['tests'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                cases: snapshot.data![index]
                                                    ['cases'],
                                                todayCases: snapshot
                                                    .data![index]['todayCases'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                deaths: snapshot.data![index]
                                                    ['deaths'],
                                                todayDeaths:
                                                    snapshot.data![index]
                                                        ['todayDeaths'],
                                                recovered: snapshot.data![index]
                                                    ['recovered'],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                              )));
                                },
                                // list in country name
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]['country'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag'])),
                                ),
                              ),
                              const Divider()
                            ],
                          );
                        } else {
                          return Container();
                        }
                      });
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
