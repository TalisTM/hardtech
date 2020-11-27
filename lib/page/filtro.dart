import 'package:flutter/material.dart';
import 'package:hardtech/components/builder_list.dart';

class Filtro extends StatelessWidget {

  final String text;
  final String tipo;

  Filtro(this.text, this.tipo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BuilderList(tipo: tipo),
      ),
    );
  }
}