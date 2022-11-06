import 'package:flutter/material.dart';
import 'package:flutter_mysql_test_app/utils/color.dart';

class HeaderContainer extends StatelessWidget {
  var text;
  var headerHeight;
  double headerLogoSize;

  HeaderContainer(this.text, this.headerHeight, this.headerLogoSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * headerHeight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [boldColors, lightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: Image.asset(
              "assets/logo.png",
              width: headerLogoSize,
              height: headerLogoSize,
            ),
          ),
        ],
      ),
    );
  }
}
