import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Perfil"),
      ),
      //body: ,
      bottomNavigationBar: BottomBar(),
    );
  }
}