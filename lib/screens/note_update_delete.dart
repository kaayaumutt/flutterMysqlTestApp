import 'package:flutter/material.dart';
import 'package:flutter_mysql_test_app/database/database_helper.dart';
import 'package:flutter_mysql_test_app/screens/splash_screen.dart';
import 'package:flutter_mysql_test_app/utils/color.dart';

import '../widgets/header_container.dart';
import '../widgets/txt_widget.dart';

class NoteUpdateDeletePage extends StatefulWidget {
  var title;
  var subTitle;
  NoteUpdateDeletePage(this.title, this.subTitle);
  @override
  _NoteUpdateDeletePageState createState() =>
      _NoteUpdateDeletePageState(this.title, this.subTitle);
}

var controlTitle = TextEditingController();
var controlSubtitle = TextEditingController();

class _NoteUpdateDeletePageState extends State<NoteUpdateDeletePage> {
  var title;
  var subTitle;
  _NoteUpdateDeletePageState(this.title, this.subTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Not Güncelle", 0.2, 75),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GradientText(
                      'Notunu Güncelle',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      gradient: LinearGradient(colors: [
                        boldColors,
                        lightColors,
                      ]),
                    ),
                    SizedBox(height: 25),
                    Icon(
                      Icons.app_registration,
                      size: 75,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 10),
                    buildTextInput(
                        hinText: title,
                        maxLength: 48,
                        controller: controlTitle),
                    SizedBox(height: 10),
                    buildTextInput(
                        hinText: subTitle,
                        maxLength: 240,
                        controller: controlSubtitle),
                    SizedBox(height: 10),
                    buildUpdateButton(),
                    SizedBox(height: 10),
                    buildDeleteButton()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildTextInput({hinText, maxLength, controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinText,
            ),
            controller: controller,
            maxLength: maxLength,
          ),
        ),
      ),
    );
  }

  Padding buildUpdateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
          child: Center(
              child: Text(
            "Güncelle",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(25),
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Database db = Database(controlTitle.text, controlSubtitle.text);
            if (controlTitle.text != "" && controlSubtitle.text != "") {
              db.noteProcessDatabase(cases: 3, oldTitle: title);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(title),
                    content: Text("Başarıyla Güncelleme Yaptın."),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Tamam'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashPage()));
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              print("boş bıraktın dostum.");
            }
          }),
    );
  }

  Padding buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
          child: Center(
              child: Text(
            "Sil",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(25),
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Database db = Database(title, subTitle);
            db.noteProcessDatabase(cases: 4);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SplashPage()));
          }),
    );
  }
}
