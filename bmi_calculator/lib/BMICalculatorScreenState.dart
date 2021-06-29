import 'package:bmi_calculator/BMIModel.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BMICalculatorScreenState extends StatefulWidget {
  const BMICalculatorScreenState({Key? key}) : super(key: key);

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreenState> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double values = 0.0;
  double value = 0.0;
  double _bmi = 0.0;
  late BMIModel _bmiModel;

  get bmiModel => null;

  @override
  Widget build(BuildContext context) {
    // debugPrint("Reload build method.");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                width: 300,
                height: 300,
                child: SvgPicture.asset(
                  "image/heart.svg",
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "We care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Height(cm)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.amberAccent,
                    // border: Border.all(width: 3.0, color: Colors.blueAccent),
                    // borderRadius: BorderRadius.circular(30.0),
                    ),
                // padding: EdgeInsets.all(5),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (values) => setState(() {
                    this._heightOfUser = values;
                  }),
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.brown[400],
                  // inactiveColor: Colors.blue,
                  label: _heightOfUser.toString(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "$_heightOfUser cm ",
                  style: TextStyle(
                      color: Colors.brown[500],
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                child: Text(
                  "Weight(kg)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.amberAccent,
                    // border: Border.all(width: 3.0, color: Colors.blueAccent),
                    // borderRadius: BorderRadius.circular(15.0),
                    ),
                padding: EdgeInsets.all(8),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (value) => setState(() {
                    this._weightOfUser = value;
                  }),
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.brown[400],
                  // inactiveColor: Colors.blue,
                  label: _weightOfUser.toString(),
                ),
              ),
              Text(
                "$_weightOfUser kg",
                style: TextStyle(
                    color: Colors.brown[500],
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                child: FlatButton.icon(
                  onPressed: () {
                    setState(
                      () {
                        _bmi = _weightOfUser /
                            ((_heightOfUser / 100) * (_heightOfUser / 100));
                        if (_bmi >= 18.5 && _bmi <= 25) {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: true,
                              comments: "You are fit.");
                        } else if (_bmi < 18.5) {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: false,
                              comments: "You are underweight.");
                        } else if (_bmi > 25 && _bmi <= 30) {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: false,
                              comments: "You are overweight.");
                        } else {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: false,
                              comments: "You are obessed.");
                        }
                      },
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(bmiModel: _bmiModel)));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("CALCULATE"),
                  textColor: Colors.white,
                  color: Colors.blueGrey,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
