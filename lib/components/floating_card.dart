import 'package:flutter/material.dart';
import '../main.dart';

class FloatingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return carrinho.length > 0
      ? FloatingActionButton(
          child: Icon(Icons.shopping_cart, color: Colors.white),
          backgroundColor: Colors.green[800],
          onPressed: () {
            Navigator.pushNamed(context, "/carrinho");
          },
        )
      : SizedBox();
  }
}