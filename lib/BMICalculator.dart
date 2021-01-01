import 'package:bmi_calculator/BMIModel.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _UserHeight = 100.0, _WeightOfUser = 100.0;
  double _bmi = 0.0;
  BMI_Model bmiyes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 300,
                child: Image.asset(
                  "assets/bmi.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("BMI Calculator",
                  style: TextStyle(
                      color: Colors.red.withOpacity(0.9),
                      fontSize: 45,
                      fontWeight: FontWeight.w800)),
              Text(
                "we care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 18,
              ),
              Text("Height (cm)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Slider(
                  min: 0.0,
                  max: 300.0,
                  onChanged: (values) {
                    setState(() {
                      _UserHeight = values;
                    });
                  },
                  value: _UserHeight,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_UserHeight",
                ),
              ),
              Text(
                " $_UserHeight cm",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Weight (kg)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Slider(
                  min: 0.0,
                  max: 200.0,
                  onChanged: (hello) {
                    setState(() {
                      _WeightOfUser = hello;
                    });
                  },
                  divisions: 100,
                  activeColor: Colors.pink,
                  value: _WeightOfUser,
                  label: "$_WeightOfUser kg",
                ),
              ),
              Text(
                "$_WeightOfUser kg",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.red.withOpacity(0.9),
                width: double.infinity,
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                     _bmi = _WeightOfUser /((_UserHeight / 100) * (_UserHeight / 100));
                      if (_bmi >= 18.5 && _bmi <= 25.0) {
                        bmiyes = BMI_Model(
                            bmi: _bmi,
                            isNormal: true,
                            comment: "You are totally fit",
                        );
                      } else if (_bmi < 18.5) {
                        bmiyes = BMI_Model(
                            bmi: _bmi,
                            isNormal: false,
                            comment: "You are underweight");
                      } else if (_bmi > 25.0 && _bmi <= 30.0) {
                        bmiyes = BMI_Model(
                            bmi: _bmi,
                            isNormal: false,
                            comment: "You are OverWeight");
                      } else {
                        bmiyes = BMI_Model(
                            bmi: _bmi,
                            isNormal: false,
                            comment: "You are Obesed");
                      }
                    });
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return ResultScreen(bmiModel: bmiyes);
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  label: Text(
                    "CALCULATE",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
