import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:playground/widgets/circle.dart';
import '../widgets/left.dart';
import '../widgets/right.dart';
import '../constants/app_constants.dart';

class HomeScreenState extends StatefulWidget {
  @override
  HomeScreenStateState createState() => HomeScreenStateState();
}

class HomeScreenStateState extends State<HomeScreenState> {
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();

  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator',
              style: TextStyle(
                  color: accentHexColor, fontWeight: FontWeight.w300)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 38,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 400,
                      child: TextField(
                        controller: heightcontroller,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'H(m)',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 32)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 400,
                      child: TextField(
                        controller: weightcontroller,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'W(kg)',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 32)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  double h = double.parse(heightcontroller.text);
                  double w = double.parse(weightcontroller.text);
                  setState(() {
                    bmiResult = w / (h * h);
                    if (bmiResult > 25) {
                      textResult = 'overweight👀';
                    }

                    if (bmiResult >= 18.5 && bmiResult <= 25) {
                      textResult = 'normal weight✔';
                    }

                    if (bmiResult < 18.5) {
                      textResult = 'underweight🥴';
                    }
                    //Navigator.of(context).pop();
                  });
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 62,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Text(
                  textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RightBar(barWidth: 40),
            SizedBox(height: 15),
            RightBar(barWidth: 90),
            SizedBox(height: 15),
            RightBar(barWidth: 50),
            SizedBox(height: 20),
            Row(
              children: [
                LeftBar(barWidth: 45),
                SizedBox(width: 60),
              ],
            ),
            SizedBox(height: 25),
            LeftBar(barWidth: 65),
            Round(length: 100),
          ],
        ),
      ),
    );
  }
}
