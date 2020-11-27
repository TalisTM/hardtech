import 'package:flutter/material.dart';
import 'package:hardtech/components/card_item.dart';
import 'package:hardtech/page/get_dados.dart';

class BuilderList extends StatelessWidget {
  
  final int count;
  final String tipo;

  BuilderList({this.count, this.tipo = ""});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: count != null ? count : produtos.length,
      itemBuilder: (context, index){
        if(tipo.isEmpty){
          return CardItem(produtos[index]);
        } else {
          if(produtos[index]["tipo"] == tipo){
            return CardItem(produtos[index]);
          } else {
            return SizedBox();
          }
        }
      },
    );
  }
}