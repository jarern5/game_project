import 'package:flutter/material.dart';
import 'package:game_project/first_page.dart';
import 'package:game_project/home.dart';
import 'package:game_project/score_page.dart';



void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      //home: home(),

      routes: {
        firstPage.routeName: (context) => const firstPage(),
        home.routeName: (context) => const home(),
        ScorePage.routeName: (context) => const ScorePage(),

      },
      initialRoute: firstPage.routeName,
    );
  }
}




