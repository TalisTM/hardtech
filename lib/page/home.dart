// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';
import 'package:hardtech/components/card_item.dart';
import 'package:hardtech/components/loading.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Future<List> _getDados() async {
  //   http.Response response;
  //   response = await http.get("https://talismarchioro.wixsite.com/my-site/_functions/produtos");

  //   return jsonDecode(response.body);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getDados();
  // }

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
            FutureBuilder(
              future: produtos,
              builder: (context, snapshot){
                switch (snapshot.connectionState){
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Loading();
                  
                  default:
                    if(snapshot.hasError) {
                      return Container(
                        child: Center(
                          child: Text("Erro"),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset("assets/img_inicio.jpeg"),
                          ),
                          _bulderList(context, snapshot)
                        ],
                      );
                    }
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar()
    );
  }

  Widget _bulderList(BuildContext context, AsyncSnapshot snapshot){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index){
        return CardItem(snapshot.data[index]);
      },
    );
  }
}