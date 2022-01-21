import 'package:flutter/material.dart';
import 'package:flutter_cat/model/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({ Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: ()=>{
          print("You tapped ${product.name}")
        },
        leading: Image.network(product.image),
        title: Text(product.name),
        trailing: Text("\$${product.price}"),
        subtitle: Text(product.description),
      ),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}