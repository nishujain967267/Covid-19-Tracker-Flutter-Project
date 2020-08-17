import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shreeram/pages/Countrypage.dart';
import 'package:shreeram/panel/info_panel.dart';
import 'package:shreeram/panel/most_affected_panel.dart';
import 'package:shreeram/panel/worldwidepanel.dart';
import 'datasource.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  List countryData;
  fetchWorldData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchcountryPanel() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWorldData();
    fetchcountryPanel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Covid-19 Tracker",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Share.share("Covid-19 Tracker");
            },
          )
          // RaisedButton(
          //   child:
          //   onPressed: () {
          //     Share.share("Covid-19 Tracker");
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(7),
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.orange[100]),
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "   World Wide",
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 9),
                    decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Regional",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            //world wide condition.
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),

            //most affected countries.
            Text(
              "   Most Affected Countries",
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 7,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),

            InfoPanel(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
