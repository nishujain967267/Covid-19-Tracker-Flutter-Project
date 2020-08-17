import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  MostAffectedPanel({this.countryData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 20,
                ),
                SizedBox(width: 5),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                SizedBox(width: 7),
                Text(
                  "Cases   " + countryData[index]['cases'].toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
