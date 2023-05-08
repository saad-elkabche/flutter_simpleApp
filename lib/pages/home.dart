import 'package:flutter/material.dart';
import 'package:simple_app/main.dart';
import 'package:simple_app/pages/product.dart';
import 'package:simple_app/pages/showProduct.dart';

import 'addProd.dart';
import 'cart.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products=[];
  Map<Product,int> cart={};


  @override
  void initState() {
    super.initState();

    products.clear();
    products.add(Product(name: "braclet",description: "braclet zwiiin",price: 100.50,url: "https://i.etsystatic.com/27235619/c/2375/1888/406/10/il/6acfc1/3646410701/il_340x270.3646410701_f4jh.jpg"));
    products.add(Product(name: "jbdjd",description: "brasdsdclet zwiiin",price: 150.50,url: "https://i.etsystatic.com/24512514/r/il/066b08/3699852893/il_340x270.3699852893_pkjb.jpg"));
    products.add(Product(name: "sa3a",description: "braclet zwiiin",price: 100.50,url: "https://i.etsystatic.com/6249450/r/il/fe643e/4097786803/il_340x270.4097786803_3ucv.jpg"));
    products.add(Product(name: "tableau",description: "braclet zwiiin",price: 100.50,url: "https://i.etsystatic.com/17860793/r/il/582f59/1766951619/il_340x270.1766951619_sww3.jpg"));
    products.add(Product(name: "dijdij",description: "braclet zwiiin",price: 100.50,url: "https://i.etsystatic.com/19990202/c/689/548/109/144/il/70c71d/4058268033/il_340x270.4058268033_58xr.jpg"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text("products"),
          actions: [
            cart.isNotEmpty?cartButton(count: cart.length,onCartClick: openCart):Container()
          ],
        ),
        body: ListView(
            children:children
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addProduct,
          child:const  Icon(
            Icons.add
          ),
        ),
      ),
    );
  }

  void addProduct() async{
    Product prod=await Navigator.push(context,
    MaterialPageRoute(
        builder: (constex)=>AddProduct()
    )
    );
    setState(() {
      products.add(prod);
    });
  }







  List<Widget> get children{
    return[
      for(int i=0;i<products.length;i++)
        ProductItem(prod: products[i] , onclickProd: productClicked)
    ];
  }
  productClicked(Product prod) async{
    var count=await Navigator.push(context,
    MaterialPageRoute(builder: (cont)=>
    ShowProd(prod:prod)
    )
    );
    if(count !=null){
      setState(() {
        cart[prod]=count;
      });
    }
  }
  void openCart() async {
   await Navigator.push(context,
    MaterialPageRoute(builder: (constext)
        {
          return Cart(cart: cart);
        }
    )
    );
   setState(() {

   });
  }
}


class cartButton extends StatelessWidget {
  final int count;
  final VoidCallback onCartClick;

  const cartButton({Key? key,required this.count,required this.onCartClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:const  EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            IconButton(onPressed: onCartClick, icon:
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 35,
            )
            ),
            Positioned(
              right: 2,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10,
                child: Text(count.toString()
                  ,style: const TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

