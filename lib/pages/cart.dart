import 'package:flutter/material.dart';
import 'package:simple_app/pages/product.dart';

import 'showProduct.dart';

class Cart extends StatefulWidget {
  final Map<Product,int> cart;

  const Cart({Key? key,required this.cart}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:Column(
            children: [
              header,
              widget.cart.isNotEmpty?getItems:NothingImg
            ],
          ) ,
      ),
    );
  }
  Widget get NothingImg{
    return Center(
      child: Image.asset("assets/empty.png"),
    );
  }
  Widget get header{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed:()=>Navigator.pop(context),
            icon:const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.cyan,
            )
        ),
        const Expanded(child:  Text("Cart",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))
      ],
    );
  }
  Widget get getItems{
    return Expanded(
      child: ListView(
        children: widget.cart.keys.map<Widget>((prod) =>
          CartItem(prod: prod, removeProd: removeProduct, upDate: UpdateCart, Count: widget.cart[prod] as int)
        ).toList()
      ),
    );
  }


  void UpdateCart(Product prod,int count){
    setState(() {
      widget.cart[prod]=count;
    });
  }
  void removeProduct(Product prod){
    setState(() {
      widget.cart.remove(prod);
    });
  }





}


class CartItem  extends StatelessWidget {
final Product prod;
final int Count;
final Function(Product) removeProd;
final Function(Product,int) upDate;

CartItem({Key? key,required this.prod,required this.removeProd,required this.upDate,required this.Count}) : super(key: key);


@override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(prod.url!),
              radius: 50,
            ),
            title: Text(prod.name!),
            subtitle: Text(prod.description!),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${prod.price} x $Count"),
                Text("Total : ${prod.price! * Count}\$"),
              ],
            ),
          ),
          Center(
            child:
            Counter(count: Count,valueChanged: onProdChanged),
          ),
          ElevatedButton(onPressed: ()=>this.removeProd(this.prod), child:const Text("delete"))
        ],
      ),
    );
  }

  void onProdChanged(int count){
    upDate(this.prod,count);
  }

}



