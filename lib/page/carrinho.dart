import 'package:flutter/material.dart';
import '../main.dart';
import 'detalhe_produto.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {

  String formaPagamento;
  String formaEntrega;
  double total = 0;
  bool colocouCep = false;
  MaskedTextController cep = MaskedTextController(mask: "00000-000");

  calcularTotal() {
    total = 0;
    carrinho.forEach((e) {
      total += e["preco"];
    });
  }

  @override
  void initState() {
    calcularTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Carrinho"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _listTileBuilder("itens", Icons.list_alt),
            ListView.builder(
              itemCount: carrinho.length,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _itemCarrinho(carrinho[index], index);
              },
            ),
            SizedBox(height: 5),
            _divisor(),
            _listTileBuilder("TOTAL: R\$ ${total.toStringAsFixed(2)}", Icons.money_rounded),
            _divisor(),
            _listTileBuilder("formas de pagamento", Icons.payment),
            _radioBuilderPagamento("Cartão de Crédito"),
            _radioBuilderPagamento("Cartão de Débito"),
            _radioBuilderPagamento("Boleto"),
            _radioBuilderPagamento("Pix"),
            SizedBox(height: 5),
            _divisor(),
            _listTileBuilder("insira seu cep", Icons.location_on_outlined),
            _inserirCep(),
            cep.text.toString().length == 9 ? _entrega() : SizedBox(),
            _botaoComprar(),
          ],
        ),
      )
    );
  }

  Widget _listTileBuilder(String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      title: Text(
        title.toUpperCase(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,)
      ),
      leading: Icon(icon, color: Colors.black, size: 27),
    );
  }

  Widget _inserirCep() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[800])
      ),
      child: TextField(
        controller: cep,
        onChanged: (_) {
          setState(() {});
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "00000-000",
          labelText: "CEP",
          labelStyle: TextStyle(color: Colors.green[900])
        ),
      ),
    );
  }

  Widget _divisor() {
    return Container(
      height: 10,
      color: Colors.grey,
    );
  }

  Widget _radioBuilderPagamento(String forma) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[800])
      ),
      child: RadioListTile(
        title: Text(forma, style: TextStyle(color: Colors.green[900])),
        activeColor: Colors.green[800],
        value: forma,
        groupValue: formaPagamento,
        onChanged: (value){
          setState(() {
            formaPagamento = value;
          });
        },
      ),
    );
  }

  Widget _radioBuilderEntrega(String forma) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[800])
      ),
      child: RadioListTile(
        title: Text(forma, style: TextStyle(color: Colors.green[900])),
        activeColor: Colors.green[800],
        value: forma,
        groupValue: formaEntrega,
        onChanged: (value){
          setState(() {
            formaEntrega = value;
          });
        },
      ),
    );
  }

  Widget _entrega(){
    return Column(
      children: [
        SizedBox(height: 10),
        _divisor(),
        _listTileBuilder("formas de entrega", Icons.local_shipping_outlined),
        _radioBuilderEntrega("PAC - R\$ 23,80"),
        _radioBuilderEntrega("Sedex - R\$ 41,99"),
        _radioBuilderEntrega("FastLog - R\$ 18,90"),
        _radioBuilderEntrega("Rapidão - R\$ 34,00"),
      ],
    );
  }

  Widget _itemCarrinho(Map produto, int index) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheProduto(produto)));
    },
    onLongPress: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Tem certeza que deseja remover este item do carrinho?"),
            actions: [
              FlatButton(
                child: Text("Cancelar", style: TextStyle(color: Colors.green[800])),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Remover", style: TextStyle(color: Colors.green[800])),
                onPressed: () {
                  carrinho.removeAt(index);
                  Navigator.pop(context);
                  calcularTotal();
                  setState(() {});
                  if(carrinho.length == 0){
                    Navigator.pushNamed(context, "/inicio");
                  }
                },
              ),
            ],
          );
        }
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[800])
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            child: Image.network(produto["imagem"][0]),
          ),
          Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(produto["nome"], style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600)),
                Text("R\$ ${produto["preco"].toStringAsFixed(2).replaceAll(".", ",")}", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w700))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

  Widget _botaoComprar() {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Text("FINALIZAR COMPRA", style: TextStyle(color: Colors.white)),
        color: Colors.green[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {},
      ),
    );
  }
}