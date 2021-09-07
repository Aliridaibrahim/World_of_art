


import 'package:flutter/material.dart';
import 'package:world_of_art/screens/settings.dart';

import 'Homepage.dart';



//ignore: must_be_immutable
class NavigationBarPage extends StatefulWidget {
  int selectedIndex = 0;
  NavigationBarPage({@required this.selectedIndex});
  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int selectedIndex= 0;

  // final Tabs = [
  //   Center(child: Text('set'),),
  //   Center(child: Text('Home'),),
  //   Center(child: Text('favo'),),
  //   Center(child: Text('mail'),),
  //
  //
  //
  // ];

  final List<Widget> _children = [
   HomePage(),
   Settings(),


 ];
  // void _onItemTap(int index){
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
     body: _children[selectedIndex],
     // body: Tabs[widget.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[400],
        currentIndex: selectedIndex,
        onTap: ( index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items:[
BottomNavigationBarItem(icon: Icon(Icons.home),
label: "home",
backgroundColor: Colors.blue
),
 BottomNavigationBarItem(icon: Icon(Icons.favorite),
     label: "favorite",
    backgroundColor: Colors.red
  ),
BottomNavigationBarItem(icon: Icon(Icons.mail_outline),
label: "mail",
backgroundColor: Colors.blue
),
BottomNavigationBarItem(icon: Icon(Icons.settings),
label: "settings",
backgroundColor: Colors.blue
),

],
      ),
    );
  }
}



// items: [
// BottomNavigationBarItem(icon: Icon(Icons.home),
// label: "home",
// backgroundColor: Colors.blue
// ),
// // BottomNavigationBarItem(icon: Icon(Icons.favorite),
// //     label: "favorite",
// //    backgroundColor: Colors.red
// //  ),
// BottomNavigationBarItem(icon: Icon(Icons.mail_outline),
// label: "mail",
// backgroundColor: Colors.blue
// ),
// BottomNavigationBarItem(icon: Icon(Icons.settings),
// label: "settings",
// backgroundColor: Colors.blue
// ),
//
// ],

