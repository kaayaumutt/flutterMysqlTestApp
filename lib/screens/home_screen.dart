import 'package:flutter/material.dart';
import 'package:flutter_mysql_test_app/screens/note_add_screen.dart';
import 'package:flutter_mysql_test_app/screens/note_update_delete.dart';
import 'package:flutter_mysql_test_app/utils/color.dart';

import '../widgets/header_container.dart';
import '../widgets/txt_widget.dart';

class HomePage extends StatefulWidget {
  @override
  List notes = [];
  int count;
  HomePage(this.notes, this.count);
  _HomePageState createState() => _HomePageState(this.notes, this.count);
}

class _HomePageState extends State<HomePage> {
  List notes = [];
  int count;
  _HomePageState(this.notes, this.count);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Not Defteri", 0.2, 75),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GradientText(
                      'Notlarım',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      gradient: LinearGradient(colors: [
                        boldColors,
                        lightColors,
                      ]),
                    ),
                    buildListNotes(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoteAddPage()));
        },
        backgroundColor: boldColors,
        child: const Icon(Icons.save),
      ),
    );
  }

  Expanded buildListNotes() {
    return Expanded(
        child: ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  trailing: Icon(Icons.save_as),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://w7.pngwing.com/pngs/392/600/png-transparent-computer-icons-notepad-notepad-icon-angle-text-rectangle.png"),
                  ),
                  title: Text(
                    notes[index]["title"].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: boldColors),
                  ),
                  subtitle: Text(notes[index]["subtitle"].toString()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteUpdateDeletePage(
                                notes[index]["title"].toString(),
                                notes[index]["subtitle"].toString())));
                  });
            }));
  }
}
