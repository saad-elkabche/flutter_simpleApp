import 'package:flutter/material.dart';

class  Product{
   String? name,description,url;
   double? price ;
   Product({this.name,this.description,this.price,this.url});
}

class ProductItem extends StatelessWidget {
  final Product prod;
  final Function(Product) onclickProd;

  const ProductItem({Key? key,required this.prod,required this.onclickProd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onclickProd(prod),
      child: ListTile(
        leading:CircleAvatar(
          backgroundImage: NetworkImage(prod.url!),
          radius: 50,
        ) ,
        title: Text(
            prod.name ?? "None",
          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          prod.description ?? "None",
          style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          prod.price.toString(),
           style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.green)
        ),
      ),
    );
  }
}
