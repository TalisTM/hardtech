import 'package:flutter/material.dart';
import 'package:hardtech/components/bottom_bar.dart';
import 'package:hardtech/components/floating_card.dart';

class Perfil extends StatefulWidget {

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Perfil"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _listBuilder("Dados Pessoais", Icons.person_outline),
            _listBuilder("Pedidos", Icons.shopping_bag_outlined),
            _listBuilder("Endereços", Icons.location_on_outlined),
            _listBuilder("Promoções", Icons.confirmation_num_outlined),
            _listBuilder("Notificações", Icons.notifications_on_outlined),
            _listBuilder("Sobre", Icons.info_outline),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingCard(),
    );
  }

  Widget _listBuilder(String title, IconData icon){
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 20)),
      leading: Icon(icon, color: Colors.green[800], size: 30),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[800], size: 20),
      onTap: (){},
    );
  }
}