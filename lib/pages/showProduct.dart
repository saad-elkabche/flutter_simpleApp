import 'package:flutter/material.dart';
import 'package:simple_app/pages/product.dart';

class ShowProd extends StatefulWidget {
  final Product prod;

  const ShowProd({Key? key,required this.prod}) : super(key: key);

  @override
  State<ShowProd> createState() => _ShowProdState();
}

class _ShowProdState extends State<ShowProd> {
  int _count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 70),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.prod.url!),
                radius: MediaQuery.of(context).size.width/3,
              ),
            ),
            ListTile(
              title: Text(widget.prod.name!,
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
              subtitle: Text(widget.prod.description!,
                style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ),
              trailing: Text(widget.prod.price.toString()!,
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.green),
              ),
            ),
            Counter(valueChanged: valueChanged,count: _count),
            _count!=0? Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text("${widget.prod.price!*_count}\$",style:
           const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green)),
            )
                :Container(),
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: _count!=0?ElevatedButton(onPressed: Confirm, child:const  Text("Add to cart")):Container())
          ],
        ),
      ),
    );
  }
  void valueChanged(int count){
    setState(() {
      _count=count;
    });
  }
  void Confirm() {
    Navigator.pop(context,_count);
  }
}



class Counter extends StatelessWidget {

  int? count=0;
  final Function(int) valueChanged;
  Counter({Key? key,this.count,required this.valueChanged}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: plus,
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: Text("+"),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text((count ?? 0).toString())),
        GestureDetector(
          onTap: mainis,
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            child: Text("-"),
          ),
        )
      ],
    );
  }

  void plus() {
    count=count!+1;
    valueChanged(count!);
  }

  void mainis() {
    if(count==0) return;
    count=count!-1;
    valueChanged(count!);
  }


}


