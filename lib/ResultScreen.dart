import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Details.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(

                  height: 300,
                  width: 200,
                  child: bmiModel.isNormal
                      ? Image.asset(
                          "assets/happy.png",
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          "assets/sad.png",
                          fit: BoxFit.contain,
                        )),
              SizedBox(
                height: 25,
              ),
              Text(
                "Your BMI value is: ${bmiModel.bmi}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                bmiModel.comment,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    color: Colors.grey),

              ),
              SizedBox(
                height: 20,
              ),
              bmiModel.isNormal?
                  Text("HURRAY! YOUR BMI IS NORMAL",style: TextStyle(color: Colors.red,fontSize:20 ,fontWeight: FontWeight.w900
                  ),
                  ): Text("SADLY! YOUR BMI IS NOT NORMAL",style: TextStyle(color: Colors.red,fontSize:20 ,fontWeight: FontWeight.w900
              ),

              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15,right: 15),
                child: FlatButton.icon(
                  onPressed:(){
                    Navigator.pop(context);
                  },
                    icon: Icon(Icons.arrow_back,color:Colors.white),
                    label: Text("LET'S CALCULATE AGAIN",style: TextStyle(color: Colors.white),),
                  color: Colors.pink,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15,right: 15),
                child: FlatButton.icon(
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Details(),));
                  },
                  icon: Icon(Icons.arrow_forward,color:Colors.white),
                  label: Text("LET'S CHECKOUT HEALTH TIPS",style: TextStyle(color: Colors.white),),
                  color: Colors.pink,
                ),
              ),

            ],
          ),
        ),
    );
  }
}
