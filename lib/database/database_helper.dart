import 'package:flutter_mysql_test_app/models/note.dart';
import 'package:flutter_mysql_test_app/screens/splash_screen.dart';
import 'package:mysql1/mysql1.dart';

class Database extends Note {
  Database(super.title, super.subTitle);
  Database.withEmpty() : super.withEmpty();

  Future noteProcessDatabase({var cases, var oldTitle}) async {
    try {
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: '192.168.56.106',
          port: 3306,
          user: 'root',
          db: 'notedb',
          password: 'maxmi33'));
      switch (cases) {
        case 1:
          var result = await conn.query(
              'insert into notes (title, subtitle) values (?, ?)',
              [title, subTitle]);
          break;
        case 2:
          int count = 0;
          List notes = [];
          var results = await conn.query('select title, subtitle from notes');
          for (var row in results) {
            count += 1;
            notes.add(row);
          }
          SplashPage splash = SplashPage();
          splash.countUpdate(count, notes);
          break;
        case 3:
          await conn.query('update notes set title=?,subtitle=? where title=?',
              [title, subTitle, oldTitle]);
          break;
        case 4:
          await conn.query('delete from notes where title=? and subtitle=?',
              [title, subTitle]);
          break;
      }
      await conn.close();
    } catch (ex) {
      print(ex);
    }
  }
}
