
import 'package:flutter/material.dart';
import 'home_screen.dart';

class AppNav extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Age Calculator"),
          actions: <Widget>[
            // overflow menu
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return null;
              },
            ),
          ],
        ),
      body: SingleChildScrollView(child: HomeScreen()),
      ),
    );
  }

}