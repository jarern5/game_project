import 'package:flutter/material.dart';
import 'package:game_project/game.dart';
import 'package:game_project/score_page.dart';



class home extends StatefulWidget {
  static const routeName = '/home';
  const home({Key? key}) : super(key: key);
  static var cscore = 0;
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<home> {
  @override
  late Game _game;
  String? data;
  String? feedback = "";
  String title = "GOOD JOB!!!";
  String msg ="";
  int count = 0;
  int pic = 1;
  var status;
  var newgame = false;
  var picture = ["1","2","3","4","5"];
  int countend = 0;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _game = Game();
  }


  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }
  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog

                Navigator.of(context).pop();



              },
            ),
          ],
        );
      },
    );
  }Widget _newGame() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            msg = "";
            feedback = "";
            data = null;
            newgame = false;
            _game = Game();
          });
        },

        child: Text(
          'new game',
          style: TextStyle(fontSize: 20.0, color: Colors.blue),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                SizedBox.shrink(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
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

  Widget _buildMainContent() {
    return data ==null?Column(
      children: [
        Text("ภาพที่เท่าไหร่เอ่ย ?",style: TextStyle(color: Colors.black,fontSize: 20.0),),
        Text("$count / 3"),
        Image.asset(
          'assets/images/${pic}.jpg',
          width: 250.0, // 160 = 1 inch
        ),SizedBox(height: 20.0,),
        status==false?Icon(Icons.close,color: Colors.red,size: 20.0,):SizedBox.shrink()
      ],
    ):Column(
      children: [
        Text("ภาพที่เท่าไหร่เอ่ย ?",style: TextStyle(color: Colors.black,fontSize: 20.0),),
        Text("$count / 3"),
        Image.asset(
          'assets/images/${pic}.jpg',
          width: 250.0, // 160 = 1 inch
        ),SizedBox(height: 20.0),
        status==false?Icon(Icons.close,color: Colors.red,size: 20.0,):SizedBox.shrink(),
        //Text(data!,style: TextStyle(fontSize: 30.0),),
       // Text(feedback!,style: TextStyle(fontSize: 20.0),),

        feedback == 'CORRECT !!!'?_newGame():SizedBox.shrink(),
      ],
    );
  }

  Widget _buildInputPanel() {
    return Column(
      children: [
        Text(
          '------------------',

        ),
        Container(
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Flexible(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      isDense: true,
                      // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.0),
                        ),
                      ),
                      // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Enter the number here',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                  )

              ),

              Container(
                height: 50.0,
                width: 80.0,
                color: Colors.black54,
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: TextButton(
                    onPressed: () {
                      count++;
                      print("$count $pic");
                      setState(() {
                        if(pic >= 5&&count>2||countend == 5){
                          Navigator.pushNamed(context, ScorePage.routeName);
                        }
                        if(count > 2){
                          count = 0;
                          pic++;
                          countend++;
                          status = true;

                        }
                        data = _controller.text;
                        var gusee = data;
                        print(gusee);
                        print(picture[pic-1]);
                        if(picture[pic-1] == gusee){
                          pic++;
                          count = 0;
                          home.cscore++;
                          countend++;
                          status = true;
                          print("goooooooooooooooooooood");
                        }else{
                          status = false;
                        }
                        if(countend == 5){
                          Navigator.pushNamed(context, ScorePage.routeName);
                        }
                      /*  if(gusee != null){
                          var result = _game.doGuess(gusee);
                          if(result == 0){
                            feedback = 'CORRECT !!!';
                            msg = "$msg => $data";
                            _showMaterialDialog(title, msg);
                          }else if(result == 1){
                            feedback = 'IS TOO HIGH';
                            msg!=""?msg = "$msg => $data":msg = "$data";
                          }else{
                            feedback = 'IS TOO LOW';
                            msg!=""?msg = "$msg => $data":msg = "$data";
                          }
                        } */ _controller.clear();

                      });
                    },
                    child: Text('GUESS',style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}