import 'package:flutter/material.dart';

class BuilderPageView extends StatelessWidget {
  
  final bool activePage;
  final String imagem;

  BuilderPageView({this.activePage, this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(imagem),
    );
  }
}