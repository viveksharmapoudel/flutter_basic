import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            key: key,
            padding:EdgeInsets.zero,
            child: const UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("vivek"),
              accountEmail: Text("vsp@mail"),
            )
          ),
           const ListTile(
            title:Text("Home", style: TextStyle(color:Colors.blue,fontSize: 18)),
            leading: Icon(CupertinoIcons.home),
            horizontalTitleGap:0,
          ),
          const ListTile(
            title:Text("Profile", style: TextStyle(color:Colors.blue,fontSize: 18)),
            leading: Icon(CupertinoIcons.profile_circled,),
            horizontalTitleGap:0,
          ), 
        ],
      ),
    );
  }
}