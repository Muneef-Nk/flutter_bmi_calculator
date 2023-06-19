import 'package:bmi_calculator/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff12a644),
      ),
      home: SplashScreen(),
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  double height = 0;
  double weight = 0;
  int bmi = 0;
  String condition = 'Select Data';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              height: size.height * 0.32,
              // width: double.infinity,
              color: Color(0xff12a644),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Calculator',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your BMI is : ',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .01,
                            ),
                          ),
                          Text(
                            '$bmi',
                            style: TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          text: 'Classification : ',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                        TextSpan(
                            text: condition,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold))
                      ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Choose Data',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff12a644),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          text: 'Height : ',
                          style:
                              TextStyle(fontSize: 25, color: Colors.grey[800]),
                          children: <TextSpan>[
                        TextSpan(
                            text: ' ${height.toInt()} cm',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(height: 20),
                  Slider(
                      label: '${height.toInt()}',
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      divisions: 200,
                      min: 0,
                      max: 200,
                      value: height,
                      onChanged: (h) {
                        setState(() {
                          height = h;
                        });
                      }),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          text: 'Weight : ',
                          style:
                              TextStyle(fontSize: 25, color: Colors.grey[800]),
                          children: <TextSpan>[
                        TextSpan(
                            text: ' ${weight.toInt()} kg',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(height: 20),
                  Slider(
                      label: '${weight.toInt()}',
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      divisions: 100,
                      min: 0,
                      max: 100,
                      value: weight,
                      onChanged: (w) {
                        setState(() {
                          weight = w;
                        });
                      }),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      setState(() {
                        //<18.5 under weight
                        //18.5 - 25 healthy
                        //25 - 30 overweight
                        //>30 obesity
                        bmi = (weight / ((height / 100) * (height / 100)))
                            .round()
                            .toInt();
                        if (bmi > 18.5 && bmi <= 25) {
                          condition = 'Normal';
                        } else if (bmi > 25 && bmi <= 30) {
                          condition = 'overweight';
                        } else if (bmi > 30) {
                          condition = 'obesity';
                        } else {
                          condition = 'underweight';
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Ink(
                      width: size.width * 0.7,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xff12a644),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
