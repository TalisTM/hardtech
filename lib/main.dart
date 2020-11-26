import 'package:flutter/material.dart';
import 'package:hardtech/page/categoria.dart';
import 'package:hardtech/page/home.dart';
import 'package:hardtech/page/perfil.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.green[700],
        elevation: 0.5,
      )
    ),
    routes: {
      "/inicio" : (context) => Home(),
      "/perfil" : (context) => Perfil(),
      "/categoria" : (context) => Categoria(),
    },
  )
);