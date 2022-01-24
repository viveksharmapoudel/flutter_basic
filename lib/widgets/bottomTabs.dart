import 'package:flutter/material.dart';


class CustomBottomTabs extends StatefulWidget {
  const CustomBottomTabs({ Key? key }) : super(key: key);

  @override
  _CustomBottomTabsState createState() => _CustomBottomTabsState();
}

class _CustomBottomTabsState extends State<CustomBottomTabs> {
  int _selectedIndex=0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BottomNavigationBar(
              backgroundColor: Colors.yellow,
              elevation: 10,
              items: const<BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "home"
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: "profile"
                )
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
      ),
    );
  }
}