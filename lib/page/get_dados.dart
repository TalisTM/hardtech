import 'dart:convert';
import 'package:hardtech/components/loading.dart';
import 'package:hardtech/components/error.dart';
import 'package:hardtech/page/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List produtos;

class GetDados extends StatefulWidget {
  @override
  _GetDadosState createState() => _GetDadosState();
}

class _GetDadosState extends State<GetDados> {
  
  Future _getDados() async {
    http.Response response;
    response = await http.get("https://talismarchioro.wixsite.com/my-site/_functions/produtos");

    produtos = jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getDados();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getDados(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Loading();
          default:
            if(snapshot.hasError){
              return Error();
            } else {
              return Home();
            }
        }
      },
    );
  }
}