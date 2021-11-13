import 'package:flutter/material.dart';
import 'package:game_project/home.dart';
class firstPage extends StatelessWidget {
  static const routeName = '/first';
  const firstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeader(),
                      Container(child: Text("เกมส์ทายคำจากภาพ",style: TextStyle(fontSize: 50.0),)),
                      Container(child: Text("กติกา            ",style: TextStyle(fontSize: 30.0),)),
                      Container(child: Text("     1.ให้ตอบว่าภาพที่เห็นคือคำว่าอะไร")),
                      Container(child: Text("2.สามารถตอบได้ภาพละ 3 ครั้ง")),
                      SizedBox(height: 20,),
                      OutlinedButton(
                        onPressed: () {
                         // Navigator.pushReplacementNamed(context, home.routeName);
                          Navigator.pushNamed(context, home.routeName);
                        },

                        child: Text(
                          'start game',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  height: 10,
                  color: Colors.black,
                )
              ],
            )


        ));

  }
  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240.0, // 160 = 1 inch
        ),
        Text(
          'GUESS THE PICTURE',

        ),Text(
          '------------------',

        ),
      ],
    );
  }
}
