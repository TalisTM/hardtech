import 'package:flutter/material.dart';

int op = 1;

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: op,
      fixedColor: Colors.green[800],
      //backgroundColor: Colors.green,
      onTap: (escolha){
        if(escolha == 0){
          Navigator.pushNamed(context, "/categoria");
          setState(() {
            op = 0;
          });
        } else if(escolha == 1){
          Navigator.pushNamed(context, "/inicio");
          setState(() {
            op = 1;
          });
        } else {
          Navigator.pushNamed(context, "/perfil");
          setState(() {
            op = 2;
          });
        }
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: Icon(Icons.list),
          title: Text("Categoria"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          title: Text("Inicio", )
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Perfil")
        ),
      ],
    );
  }
}