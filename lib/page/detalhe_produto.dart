import 'package:flutter/material.dart';

class DetalheProduto extends StatefulWidget {
  
  final Map produto;

  DetalheProduto(this.produto);

  @override
  _DetalheProdutoState createState() => _DetalheProdutoState();
}

class _DetalheProdutoState extends State<DetalheProduto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("${widget.produto}"),
      ),
    );
  }
}