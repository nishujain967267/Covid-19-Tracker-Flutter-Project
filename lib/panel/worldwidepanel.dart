import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;
  WorldWidePanel({this.worldData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        //we have to constraint grid view into a certain fix size because it takes up teh entire screen.
        //we have to make it unscrolabble so it does not scroll with the entire screen.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title: "CONFIRMED",
            panelColor: Colors.red[300],
            textColor: Colors.white,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: "ACTIVE",
            panelColor: Colors.blue[300],
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: "RECOVERED",
            panelColor: Colors.teal[200],
            textColor: Colors.teal,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: "DEATHS",
            panelColor: Colors.grey[200],
            textColor: Colors.grey[900],
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  StatusPanel({this.panelColor, this.textColor, this.title, this.count});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: panelColor, borderRadius: BorderRadius.circular(16)),
      height: 80,
      width: width / 2,
      child: Column(
        children: [
          Text(" "),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              count,
              style: TextStyle(
                  color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
