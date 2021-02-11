import 'package:flutter/material.dart';
import '../components/card_item.dart';
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("ITENS:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
            ListView.builder(
              itemCount: carrinho.length,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _itemCarrinho(carrinho[index], index);
              },
            ),
            SizedBox(height: 10),
            Text("TOTAL: R\$ ${total.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
            SizedBox(height: 20),
            Text("FORMA DE PAGAMENTO:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
            _radioBuilderPagamento("Cartão de Crédito"),
            _radioBuilderPagamento("Cartão de Débito"),
            _radioBuilderPagamento("Cartão de Boleto"),
            _radioBuilderPagamento("Pix"),
            SizedBox(height: 20),
            Text("INSIRA SEU CEP:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
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
            ),
            cep.text.toString().length == 9 ? _entrega() : SizedBox(),
            SizedBox(height: 10),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text("FINALIZAR COMPRA", style: TextStyle(color: Colors.white)),
              color: Colors.green[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
            ),
          ],
        ),
      )
    );
  }

  Widget _radioBuilderPagamento(String forma) {
    return Container(
      margin: EdgeInsets.all(5),
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
      margin: EdgeInsets.all(5),
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
        Text("FORMA DE ENTREGA:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green[800]
              ),
            ),
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
      margin: EdgeInsets.all(5),
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
}