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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text("Em breve...\nAinda em desenvolvimento",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20),
          Image.asset("assets/images/dev.png")
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}