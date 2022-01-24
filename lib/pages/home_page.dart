import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cat/model/product.dart';
import 'package:flutter_cat/widgets/drawer.dart';
import 'package:flutter_cat/widgets/product_widget.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double check =1;
  final String name ="vivekd";

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    final productJson = await rootBundle.loadString("assets/files/data.json");
    final decodedData= jsonDecode(productJson); 
    var productData= decodedData["products"];
    CategoryModal.products = List.from(productData).map<Product>((item) => Product.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          title: Text("Test App"),
        ),
        body: (CategoryModal.products !=null && CategoryModal.products.isNotEmpty) ? ListView.builder(
          itemCount: CategoryModal.products.length,
          itemBuilder:(context, index){
            return ProductWidget(
              product: CategoryModal.products[index],
              );
          },
        )
        : Center(
          child: CircularProgressIndicator(),
        )
        ,
        drawer:const MyDrawer(),
      );
  }
}