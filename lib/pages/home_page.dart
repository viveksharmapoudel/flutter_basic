import 'package:flutter/material.dart';
import 'package:flutter_cat/widgets/drawer.dart';

class HomePage extends StatelessWidget {

  final double check =1;
  final String name ="vivekd";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test App"),
        ),
        body: Center(
          child: Container(
            child: Text("$name $check"),
          )
        ),
        drawer:const  MyDrawer(),
      );
  }

}