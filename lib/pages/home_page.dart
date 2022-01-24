import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cat/model/product.dart';
import 'package:flutter_cat/widgets/bottomTabs.dart';
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
    print(CategoryModal.products);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test App"),
          centerTitle: true,
        ),
        body: (CategoryModal.products.isNotEmpty) ?
          GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ), 
            itemCount: CategoryModal.products.length,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
            itemBuilder: (context, index){
              final item= CategoryModal.products[index];
              return Card(
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child:  GridTile(
                  header: Container(
                    // ignore: prefer_const_constructors
                    decoration:  BoxDecoration(
                        color: Colors.purple,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                    child: Text(item.name,
                    textAlign: TextAlign.center,
                
                    style: const TextStyle(
                      color: Colors.white,
          
                    ),
                    )),
                  footer: Text('\$ ${item.price.toString()}'),
                  child: Image.network(item.image)
                ),
              );
            }
          )
        : const Center(
          child: CircularProgressIndicator(),
        )
        ,
        bottomNavigationBar: const CustomBottomTabs(),
        drawer:const MyDrawer(),
      );
  }
}


//  ListView.builder(
//           itemCount: CategoryModal.products.length,
          // itemBuilder:(context, index){
          //   return ProductWidget(
          //     product: CategoryModal.products[index],
          //     );
          // },
//         )