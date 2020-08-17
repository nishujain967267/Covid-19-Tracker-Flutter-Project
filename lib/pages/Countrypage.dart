import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shreeram/datasource.dart';
import 'package:shreeram/pages/search.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countrypage;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countrypage = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: Search(countryList: countrypage));
            },
          ),
        ],
        backgroundColor: primaryBlack,
        title: Text(
          "Country Stats",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: countrypage == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(2),
                  height: 145,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 10,
                          offset: Offset(0, 30),
                        ),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              countrypage[index]['country'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                            ),
                            Image.network(
                              countrypage[index]['countryInfo']['flag'],
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 17),
                          child: Column(
                            children: [
                              Text(
                                "Confirmed " +
                                    countrypage[index]['cases'].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Active " +
                                    countrypage[index]['active'].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Recovered " +
                                    countrypage[index]['recovered'].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Deaths " +
                                    countrypage[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Population " +
                                    countrypage[index]['population'].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Tests " +
                                    countrypage[index]['tests'].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.purpleAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                );
              },
              itemCount: countrypage == null ? 0 : countrypage.length,
            ),
    );
  }
}
