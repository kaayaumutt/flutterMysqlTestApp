import 'package:flutter/material.dart';
import 'package:flutter_mysql_test_app/database/database_helper.dart';
import 'package:flutter_mysql_test_app/screens/splash_screen.dart';
import 'package:flutter_mysql_test_app/utils/color.dart';

import '../widgets/header_container.dart';
import '../widgets/txt_widget.dart';

class NoteAddPage extends StatefulWidget {
  @override
  _NoteAddPageState createState() => _NoteAddPageState();
}

var controlTitle = TextEditingController();
var controlSubtitle = TextEditingController();

class _NoteAddPageState extends State<NoteAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Not Ekleme", 0.2, 75),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GradientText(
                      'Not Ekleyin',
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
                        hinText: "Başlık",
                        maxLength: 48,
                        controller: controlTitle),
                    SizedBox(height: 10),
                    buildTextInput(
                        hinText: "Açıklama",
                        maxLength: 240,
                        controller: controlSubtitle),
                    SizedBox(height: 10),
                    buildAddButton(),
                    SizedBox(height: 10),
                    buildBackButton()
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

  Padding buildAddButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
          child: Center(
              child: Text(
            "Ekle",
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
              db.noteProcessDatabase(cases: 1);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashPage()));
            } else {
              print("boş bıraktın dostum.");
            }
          }),
    );
  }

  Padding buildBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
          child: Center(
              child: Text(
            "Geri",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(25),
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SplashPage()));
          }),
    );
  }
}
