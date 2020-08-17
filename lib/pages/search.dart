import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;
  Search({this.countryList});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = " ";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
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
                            suggestionList[index]['country'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          Image.network(
                            suggestionList[index]['countryInfo']['flag'],
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
                        child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Confirmed " +
                                suggestionList[index]['cases'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Active " +
                                suggestionList[index]['active'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Recovered " +
                                suggestionList[index]['recovered'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Deaths " +
                                suggestionList[index]['deaths'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Population " +
                                suggestionList[index]['population'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Tests " +
                                suggestionList[index]['tests'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          );
        });
  }
}
