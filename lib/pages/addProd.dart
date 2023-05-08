import 'package:flutter/material.dart';
import 'package:simple_app/pages/product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey=GlobalKey<FormState>();
  String? name,description,url;
  double? price ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
           Center(
             child: Container(
              padding:const EdgeInsets.symmetric(horizontal: 15),
              margin:const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height/1.5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                borderRadius:const BorderRadius.all(
                  Radius.circular(20)
                )
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    field_name,
                    field_desc,
                    field_Price,
                    field_Url,
                    button_add_prod
                  ],
                ),
              ),
          ),
           ),
        ),
      );
   //);
  }

  Widget get field_name{
    return TextFormField(
      validator: (value){
        if((value ?? "").isNotEmpty){
          name=value;
          return null;
        }
        return "required";
      },
      decoration:_getDecoration("Name") ,
    );
  }
  Widget get field_desc{
    return TextFormField(
      validator: (value){
        if((value ?? "").isNotEmpty){
          description=value;
          return null;
        }
        return "required";
      },
      decoration:_getDecoration("Description") ,
    );
  }
  Widget get field_Price{
    return TextFormField(
      validator: (value){
        if(value!.isNotEmpty){
          price=double.parse(value!);
          return null;
        }
        return "required";
      },
      decoration: _getDecoration("Price"),
      keyboardType: TextInputType.number,
    );
  }
  Widget get field_Url{
    return TextFormField(
      validator: (value){
        if(value!.isNotEmpty){
          url=value;
          return null;
        }
        return "required";
      },
      decoration: _getDecoration("Image"),
      keyboardType: TextInputType.url,
    );
  }
  Widget get button_add_prod{
    return  ElevatedButton(
        onPressed:(){
        if(formKey.currentState!.validate()){
          Product prod=Product(name: name,description: description,price: price,url: url);
          Navigator.pop(context,prod);
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
        padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 30)
      ),
      child:const Text("Add Product",style: TextStyle(color: Colors.white,fontSize: 18)),

    );
  }
  InputDecoration _getDecoration(String label){
    return InputDecoration(
      label:  Text(label),
      border:const OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.black,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
        enabledBorder: const OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.black38,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedBorder:  const OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.black,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      labelStyle:const TextStyle(color: Colors.black38,fontSize: 18)
    );
  }




}
