import 'package:flutter/material.dart';
import 'package:hardtech/page/detalhe_produto.dart';

class CardItem extends StatelessWidget {

  final Map produto;

  CardItem(this.produto);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheProduto(produto)));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green[800])
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: Image.network(produto["imagem"][0]),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(produto["nome"], style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600)),
                  Text("R\$ ${produto["preco"].toStringAsFixed(2).replaceAll(".", ",")}", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w700))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}