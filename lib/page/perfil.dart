import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';
import 'package:hardtech/components/floating_card.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingCard(),
    );
  }
}