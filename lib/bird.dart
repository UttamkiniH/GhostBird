import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 150,
      child: Image.asset(
        'lib/images/bird.png'
      ),
    );
  }
}
