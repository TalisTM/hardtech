import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: Text("Lamentamos ocorreu um erro :(",
          textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 40,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}