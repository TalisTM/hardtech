import 'package:flutter/material.dart';
import 'package:hardtech/components/builder_pageview.dart';
import 'package:hardtech/page/get_dados.dart';

class DetalheProduto extends StatefulWidget {
  
  final Map produto;

  DetalheProduto(this.produto);

  @override
  _Detalhe_produtoState createState() => _Detalhe_produtoState();
}

class _Detalhe_produtoState extends State<DetalheProduto> {
  
  final PageController _pageController = PageController();
  int _currentPage;

  Map produto;

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != null) {
        setState(() {
          _currentPage = next;
        });
      }
    });

    produto = widget.produto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Produto"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: produtos.length,
              itemBuilder: (_ , int index){
                bool activePage = index == _currentPage;
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Detalhes do Produto"),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  body: Column(
                    children: [
                      Container(
                        child: BuilderPageView(
                          activePage: activePage,
                          imagem: produto["imagem"][index]
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}