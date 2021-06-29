import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              width: 300,
              height: 300,
              child: bmiModel.isNormal
                  ? SvgPicture.asset(
                      "image/happy.svg",
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      "image/sad.svg",
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Your BMI is ${bmiModel.bmi.round()}",
              style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "${bmiModel.comments}",
              style: TextStyle(
                  color: Colors.brown[400],
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 3,
            ),
            bmiModel.isNormal
                ? Text(
                    "Hurray! your BMI is normal.",
                    style: TextStyle(
                        color: Colors.brown[400],
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  )
                : Text(
                    "Sorry, your BMI is not normal.",
                    style: TextStyle(
                        color: Colors.brown[400],
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text("Let's calculate again."),
                textColor: Colors.white,
                color: Colors.blueGrey,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }
}
