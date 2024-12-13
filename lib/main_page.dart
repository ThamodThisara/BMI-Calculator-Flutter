import 'package:flutter/material.dart';
import 'package:project_01/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                        color: gender=='M' ? Colors.orange.withAlpha(150): Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                        color: gender=='F' ? Colors.orange.withAlpha(150): Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 150),
                          Text("Female"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height (cm)"),
                        Text(
                          "$height",
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  if(height > 50){
                                    height --;
                                    bmi = calculateBMI(height: height, weight: weight);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed:  (){
                                setState(() {
                                  if(height < 220){
                                    height ++;
                                    bmi = calculateBMI(height: height, weight: weight);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight (kg)"),
                        Text(
                          "$weight",
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed:  (){
                                setState(() {
                                  if(weight > 35){
                                    weight --;
                                    bmi = calculateBMI(height: height, weight: weight);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed:  (){
                                setState(() {
                                  if(weight < 300){
                                    weight ++;
                                    bmi = calculateBMI(height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Column(
                children: [
                 const Text("BMI"),
                  Text("$bmi", style: kInputLabelColor.copyWith(color: kOutputTextColor,fontSize: 60 ),),
                  Text(getResult(bmi)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  double calculateBMI({required int height, required int weight}) {
    double bmi = (weight / (height * height)) * 10000;
    return double.parse(bmi.toStringAsFixed(2));
  }

  String getResult (bmiValue){
    if(bmiValue >= 25){
      return 'Over Weight';
    } else if (bmiValue>18.5){
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }
}
