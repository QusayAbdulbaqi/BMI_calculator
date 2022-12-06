import 'dart:math';
import 'package:calculator/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 0;

  int weight = 20;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.green,
        title:
        Text('Culcultor',style: TextStyle(
          color: Colors.black,fontWeight: FontWeight.bold,
        ),),
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.all(20),
            child:Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale=true;
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                         image:AssetImage('images/male.png'),
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(height: 15,),
                        Text('MALE',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMale ?Colors.green :Colors.grey,
                    ),
                  ),
                )
                ),
                SizedBox(width: 20,),
                Expanded(
                    child:GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale =false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image:AssetImage('images/female.png'),
                            width: 90,height: 90,
                            ),
                            SizedBox(height: 15,),
                            Text('FEMALE',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ?Colors.green :Colors.grey,
                        ),
                      ),
                    ),
                ),
              ],
            ),
          )),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                  style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                  ),),
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${height.round()}',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                      SizedBox(width: 5,),
                      Text('CM',style: TextStyle(
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),)
                    ],
                  ),
                  Slider(
                      thumbColor:Colors.black,
                      activeColor:Colors.green,
                      value: height,
                      max: 100,
                      min: 0,
                      onChanged: (value){
                        setState(() {
                          height =value;
                        });
                      }
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[500],
              ),
            ),
          )),
          Expanded(child:Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('$weight',style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(backgroundColor: Colors.green,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            heroTag: 'weight-',
                            mini: true,
                            child: Icon(
                              Icons.remove,color: Colors.black,
                            ),
                          ),
                          FloatingActionButton(backgroundColor: Colors.green,
                            onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                            heroTag: 'weigh+',
                            mini: true,
                            child: Icon(
                              Icons.add,color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                  ),
                )
                ),
                SizedBox(width: 20,),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('$age',style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(backgroundColor: Colors.green,
                              onPressed:(){
                                setState(() {
                                  age--;
                                });
                              },
                          heroTag: 'age-',
                          mini: true,
                          child: Icon(
                            Icons.remove,color: Colors.black,
                          ),),
                          FloatingActionButton(backgroundColor: Colors.green,
                            onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          heroTag: 'age+',
                            mini: true,
                            child: Icon(
                              Icons.add,color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                )
                ),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(color: Colors.green,
              onPressed: (){
                 var result = weight / pow(height / 100, 2);
                  print(result.round());

                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => RresultScreen(
                       age: age,
                       isMale: isMale,
                       result: result.round(),
                     ),
                   ),
                 );
              },
              height: 50.0,
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize:25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}