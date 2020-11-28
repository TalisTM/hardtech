import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';
import 'package:hardtech/page/filtro.dart';

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
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
            SizedBox(height: 10),
            _box("Processador", "processador"),
            _box("Placa-Mãe", "placa-mae"),
            _box("Memória Ram", "ram"),
            _box("Placa de Vídeo", "placa-video"),
            _box("Fonte", "fonte"),
            _box("SSD", "ssd"),
            _box("Gabinete", "gabinete"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _box(String text, String tipo){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Filtro(text ,tipo)));
      },
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
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