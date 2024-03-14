import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(child: Text('Ask Me Anything')),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.indigo, Colors.blue])),
          )
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.deepPurple, Colors.purpleAccent])),
          child: Ball(),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {

  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: (){  // need to use stateful
                setState(() {
                  randomize();
                });
                print('The ball image is pressed and ball $ballNumber is shown');
              },
              child: Image.asset('images/ball$ballNumber.png'),
            ),
          ),
        ),
      );
  }

  void randomize(){
    ballNumber = Random().nextInt(5) + 1; // +1 to avoid 0
  }

}


