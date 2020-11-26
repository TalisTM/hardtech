import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';
import 'package:hardtech/components/card_item.dart';
import 'package:hardtech/page/get_dados.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HardTech"),
        actions: [
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Image.asset("assets/img_inicio.jpeg"),
            ),
            _bulderList(context)
          ],
        ),
      ),
      bottomNavigationBar: BottomBar()
    );
  }

  Widget _bulderList(BuildContext context){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: produtos.length,
      itemBuilder: (context, index){
        return CardItem(produtos[index]);
      },
    );
  }
}