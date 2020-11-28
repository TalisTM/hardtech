import 'package:flutter/material.dart';

class DetalheProduto extends StatefulWidget {
  
  final Map produto;

  DetalheProduto(this.produto);

  @override
  _DetalheProdutoState createState() => _DetalheProdutoState();
}

class _DetalheProdutoState extends State<DetalheProduto> {
  
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Produto"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, "/inicio"),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green[800], width: 4),
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 300,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: widget.produto["imagem"].length,
              itemBuilder: (_ , int index){
                return Container(
                  child: Image.network(widget.produto["imagem"][index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}