import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mysql_test_app/screens/home_screen.dart';
import 'package:flutter_mysql_test_app/utils/color.dart';

import '../database/database_helper.dart';
import '../widgets/txt_widget.dart';

List _notes = [];
int _count = 0;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();

  countUpdate(count, series) {
    seriesUpdate(series);
    return _count = count;
  }

  seriesUpdate(series) {
    return _notes = series;
  }
}

Database db = Database.withEmpty();

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage(_notes, _count)));
    });
  }

  @override
  Widget build(BuildContext context) {
    db.noteProcessDatabase(cases: 2);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [boldColors, lightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
            child: Column(children: [
          Padding(padding: EdgeInsets.only(top: 200)),
          Image.asset(
            "assets/logo.png",
            width: 150,
            height: 150,
          ),
          SizedBox(height: 20),
          GradientText(
            'Not defterin',
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            gradient: LinearGradient(colors: [
              boldColors,
              lightColors,
            ]),
          ),
        ])),
      ),
    );
  }
}
