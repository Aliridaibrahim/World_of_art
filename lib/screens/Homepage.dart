
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_of_art/provider/google_signin.dart';
import 'package:world_of_art/provider/user.dart';
import 'package:world_of_art/screens/profile.dart';
import 'package:world_of_art/screens/settings.dart';

import 'navigationBar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBase authBase =AuthBase();
  int selectedIndex= 0;
  final screens = [
    Center(child: Text('Home',style: TextStyle(fontSize: 60),),),
    Center(child: Text('profile',style: TextStyle(fontSize: 60),),),
    Profile(),
    Settings()
  ];
// final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
drawer: Drawer(
  child: Column(
    children: <Widget>[
  Container(alignment: Alignment.center,
      
      child:  IconButton(

      onPressed:() async{
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.remove('email') ;
        authBase.logout();
        final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.logout();
  Navigator.of(context).pushReplacementNamed("login");
  },

      icon: Icon(Icons.exit_to_app,color: Colors.blue,),),

  ),Divider(color: Colors.blue,
        thickness: 20,
      ),
      Container(child: Column(
        children: [
          CircleAvatar(
            maxRadius: 25,
        //    backgroundImage: NetworkImage(user.photoURL),
          ),SizedBox(height: 8,),
          Text("Name :",style: TextStyle(color: Colors.blue
      )
          )
      
        ]
      )
)

    ],
  ),
),

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[600],
        currentIndex: selectedIndex,
        onTap: ( value) {
          setState(() {
            selectedIndex = value;
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
          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: "profile",
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
              label: "settings",
              backgroundColor: Colors.blue

          ),

        ],
      ),

body: screens[selectedIndex],
    );
  }
}



