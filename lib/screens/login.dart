
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_of_art/provider/google_signin.dart';
import 'package:world_of_art/provider/user.dart';
import 'package:world_of_art/screens/Homepage.dart';
import 'package:world_of_art/screens/landinPage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email = "",
      _password = "";
  AuthBase authBase = AuthBase();
  GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();

  //User _user = new User();
  bool isSignedIn = false,
      showPassword = true;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _displayName = new TextEditingController();


  @override



  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Login"),

          leading:IconButton(icon: Icon(Icons.keyboard_return) ,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LandinPage();
                  },
                ));
              }
          ),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("Login to get started",style: TextStyle(fontSize: 40),),
              ),SizedBox(
                height: 50,
              ),
              // Email Text Field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  controller:  _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    return null;
                  },
                  onChanged: (value)=>_email=value,
                  onSaved: (String value) {
                  //  _user.email = value;
                  },
                  cursorColor:Color.fromRGBO(33, 23, 12, 1.0),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                    icon: Icon(
                      Icons.email,
                      color:Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                  ),
                ),
              ), //EMAIL TEXT FIELD
              SizedBox(
                height: 20,
              ),
              // Password Text Field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  obscureText: showPassword,
                  validator: (String value) {
                    return null;
                  },
                  onChanged: (value)=>_password=value,
                  onSaved: (String value) {
                 //   _user.password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color.fromRGBO(33, 23, 12, 1.0),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          (showPassword) ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromRGBO(33, 23, 12, 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        }
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(height: 60,
                width: 300,
                child: ElevatedButton(
                  child: Text("Login",style: TextStyle(color: Colors.red),),

                  onPressed: () async{
                    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', _emailController.text);

                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) {
                    //     return HomePage();
                    //
                    //   },
                    // ));

                    await  authBase.loginWithEmailAndPassword(_email, _password);
                    Navigator.of(context).pushReplacementNamed('homepage');
                  },
                  style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5)),

                ),

              ),
              SizedBox(
                height: 40,
              ),Container(
                  child: Row(
                      children:<Widget> [
                        Text("or login witth"),
                        Container( child: ElevatedButton(
                          child: Text("F",style: TextStyle(color: Colors.blue),),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LoginPage();
                              },
                            ));

                          },
                          style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5),shape: CircleBorder()),

                        ),),
                        Container(
                            child:  Column(
                                children: [
                                GestureDetector(
                                onTap: () {
                            //Sign In with google
                            AuthBase()
                            .signWithGoogle()
                            .then((UserCredential value) async{
                          final displayName = value.user.displayName;

                          print(displayName);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                                  (route) => false);
                          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.setString('email',_displayName.text);});
            },
                child: ElevatedButton(


                  child: Text("G",style: TextStyle(color: Colors.red),),
                  style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5),shape: CircleBorder()),
                )

                ),
            ]
          )
        )









                            // ElevatedButton(
                            //   child: Text("G",style: TextStyle(color: Colors.red),),
                            //
                            //   onPressed: () async{







                              //  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                //sharedPreferences.setString('email', _PasswordController.text);



                                //
                                // final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                                // provider.login();
                                // // Navigator.of(context).pushReplacementNamed('homepage');
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (BuildContext context) {
                                //     if(provider.isSigningIn){
                                //       return HomePage();
                                //     }
                                //     else{
                                //       return LandinPage();
                                //     }
                                //   },
                                //
                                // )
                                // );

                       //       },
                        //      style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5),shape: CircleBorder()),

                       //     )

                   //     )






                      ]
                  )
              )
            ]
        ),),)
    )
    ;

  }
}

