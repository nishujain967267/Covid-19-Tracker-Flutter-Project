import 'package:flutter/material.dart';
import 'package:shreeram/datasource.dart';
import 'HomePage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryBlack,
      ),
    ));
