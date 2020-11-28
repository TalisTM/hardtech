import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';
import 'package:hardtech/components/builder_list.dart';
import 'package:hardtech/page/filtro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("HardTech"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image.asset("assets/images/img_inicio.jpeg"),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Filtro("Placa de Vídeo" , "placa-video")));
              },
            ),
            SizedBox(height: 10),
            Text("DESTAQUES:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
            SizedBox(height: 10),
            BuilderList(count: 8),
            SizedBox(height: 10)
          ],
        ),
      ),
      bottomNavigationBar: BottomBar()
    );
  }
}