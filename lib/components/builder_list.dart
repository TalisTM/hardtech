import 'package:flutter/material.dart';
import 'package:hardtech/components/card_item.dart';
import 'package:hardtech/page/get_dados.dart';

class BuilderList extends StatelessWidget {
  
  final int count;
  final String tipo;

  BuilderList({this.count, this.tipo = ""});

  @override
  Widget build(BuildContext context) {
    int empty = 0;
    
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: count != null ? count : produtos.length,
      itemBuilder: (context, index){
        if(tipo.isEmpty){
          empty = 1;
          return CardItem(produtos[index]);
        } else {
          if(produtos[index]["tipo"] == tipo){
            empty = 1;
            return CardItem(produtos[index]);
          } else {
            if((produtos.length - 1 == index) && (empty == 0)){
              return Column(
                children: [
                  SizedBox(height: 10),
                  Text("Não há produtos para serem mostrados :(",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              );
            }
            return SizedBox();
          }
        }
      },
    );
  }
}