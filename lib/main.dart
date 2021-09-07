import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_art/screens/Homepage.dart';
import 'package:world_of_art/screens/landinPage.dart';
import 'package:world_of_art/screens/navigationBar.dart';
import 'package:world_of_art/screens/splashscreen.dart';

import 'provider/google_signin.dart';

void main() async {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSignInProvider>(create: (context)=> GoogleSignInProvider(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
      // home: NavigationBarPage(),

        home: Splashscreen(),



        routes:<String,WidgetBuilder> {

          'splachscreen': (buildContext)=>LandinPage() ,
          'homepage' : (buildContext)=>HomePage() ,
          'login': (buildContext)=>LandinPage() ,

        }


    ),
    );

  }

}

