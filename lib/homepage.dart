import 'dart:async';
//import 'dart:html';

import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/images/bary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameStarted = false;
  static double barrierXone = 1.5;
  double barrierXtwo = barrierXone + 2;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if(barrierXone<-1.5){
          barrierXone += 3.5;
        }else{
          barrierXone -= 0.05;
        }
      });
        setState(() {
          if(barrierXtwo<-1.5){
            barrierXtwo += 3.5;
          }else{
            barrierXtwo -= 0.05;
          }
        });
      if (birdYaxis > 1 + 1) {
        timer.cancel();
        gameStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (gameStarted) {
            jump();
          } else {
            startGame();
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        alignment: Alignment(0, birdYaxis),
                        color: Colors.black,
                        child: MyBird(),
                      ),
                      Container(
                        alignment: Alignment(0, -0.3),
                        child: gameStarted
                            ? Text("")
                            : Text(
                                "T A P   T O   P L A Y",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(
                          size: 200.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, -1.5),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(
                          size: 150.0,

                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXtwo, -1.5),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(
                          size: 200.0,

                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXtwo, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(
                          size: 150.0,

                        ),
                      )


                    ],
                  )),
              Container(
                color: Colors.blueAccent,
                height: 15,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SCORE",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "20",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "BEST",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
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
