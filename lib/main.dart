import 'package:flutter/material.dart';
import 'package:flutter_cat/pages/home_page.dart';
import 'package:flutter_cat/pages/login_page.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,
      theme:ThemeData(primarySwatch: Colors.deepPurple) ,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/login",
      routes: {
        "/":(context)=> HomePage(),
        "/login":(context)=>LoginPage(),
      },
    );
  }
}