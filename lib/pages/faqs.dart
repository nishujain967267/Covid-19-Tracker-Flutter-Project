import 'package:flutter/material.dart';
import 'package:shreeram/datasource.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.questionAnswers[index]['question'],
              ),
              children: [
                Text(
                  DataSource.questionAnswers[index]['answer'],
                ),
              ],
            );
          }),
    );
  }
}
