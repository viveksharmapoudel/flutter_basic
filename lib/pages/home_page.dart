import 'package:flutter/material.dart';
import 'package:flutter_cat/model/product.dart';
import 'package:flutter_cat/widgets/drawer.dart';
import 'package:flutter_cat/widgets/product_widget.dart';

class HomePage extends StatelessWidget {

  final double check =1;
  final String name ="vivekd";
  @override
  Widget build(BuildContext context) {
    final productList= List.generate(10,(index)=> products[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Test App"),
        ),
        body: ListView.builder(
          itemCount: productList.length,
          itemBuilder:(context, index){
            return ProductWidget(
              product: productList[index],
              );
          },
        )
        ,
        drawer:const  MyDrawer(),
      );
  }

}