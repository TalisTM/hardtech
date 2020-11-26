import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';

class Categoria extends StatefulWidget {
  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Categoria"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15),
            Text("ESCOLHA UMA OPÇÃO:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 10),
            _box("Processador"),
            _box("Placa-Mãe"),
            _box("Memória Ram"),
            _box("Placa de Vídeo"),
            _box("Fonte"),
            _box("SSD"),
            _box("Gabinete"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _box(String text){
    return GestureDetector(
      //onTap: ,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.green[700],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 4, color: Colors.green[900])
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white)
          ],
        )
      ),
    );
  }
}