
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_project/home.dart';

class ScorePage extends StatefulWidget {
  static const routeName = '/score';

  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Text("จบเกม",style: TextStyle(fontSize: 20.0, color: Colors.blue),),
            Text("คะแนนที่ได้คือ ${home.cscore}",style: TextStyle(fontSize: 20.0, color: Colors.blue),),
            OutlinedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, home.routeName);
                home.cscore = 0;
                Navigator.pushNamed(context, home.routeName);
              },

              child: Text(
                'new game',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
