import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List produtos;

class GetDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Future<List> _getDados() async {
      http.Response response;
      response = await http.get("https://talismarchioro.wixsite.com/my-site/_functions/produtos");

      produtos = jsonDecode(response.body);
    }
  }
}