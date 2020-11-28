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
      appBar: _builderAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _builderImages(),
            Text(widget.produto["nome"],
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 15),
            Text("R\$ ${widget.produto["preco"].toStringAsFixed(2).replaceAll(".", ",")}",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.green[800]
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("COMPRAR" , style: TextStyle(color: Colors.white)),
              color: Colors.green[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Ta loko?"),
                    content: Text("Isso é só o app do trabalho, da pra comprar não man"),
                    actions: [
                      FlatButton(
                        child: Text("Foi mal", style: TextStyle(color: Colors.green[700])),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )
                );
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("ADICIONAR AO CARRINHO" , style: TextStyle(color: Colors.white)),
              color: Colors.green[500],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("De novo?"),
                    content: Text("Isso é só o app do trabalho, da pra comprar não man"),
                    actions: [
                      FlatButton(
                        child: Text("Vacilei", style: TextStyle(color: Colors.green[700])),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )
                );
              },
            ),
            SizedBox(height: 100),
            Text("DESCRIÇÃO DO PRODUTO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 20),
            Text(widget.produto["especificacoes"],
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _builderAppBar() {
    return AppBar(
      title: Text("Detalhes do Produto"),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pushNamed(context, "/inicio"),
      ),
    );
  }

  Widget _builderImages() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      height: 300,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _pageController.previousPage(duration: Duration(microseconds: 1), curve: Curves.bounceIn),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              
              controller: _pageController,
              itemCount: widget.produto["imagem"].length,
              itemBuilder: (_ , int index){
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(widget.produto["imagem"][index], height: 200, width: 270,),
                    ],
                  )
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () => _pageController.nextPage(duration: Duration(microseconds: 1), curve: Curves.bounceIn),
          )
        ],
      ),
    );
  }
}