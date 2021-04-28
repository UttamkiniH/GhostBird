import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {

  final size;
  MyBarrier({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 3,color: Colors.grey[800]),
          borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
