// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:world_of_art/model/user.dart';
//
//
// // class _user{
// //   final String uid;
// //
// //   _user(this.uid);
// //
// //
// //
// // }
// //var user = FirebaseAuth.instance.currentUser;
//
// class AuthBase{
//
//   UserModel _userFromFirebase( FirebaseUser  ){
//     return UserModel();
//   }
//
//   Future<void> registerWithEmailAndPassword(String email,String password) async{
//
//  final authResult = await   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//   return _userFromFirebase(authResult.user);
//   }
//
//
//   Future<void> loginWithEmailAndPassword(String email,String password)async{
//     final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
// return _userFromFirebase(authResult.user);
//   }
//
//
//   Future<void> logout()async{
//     await FirebaseAuth.instance.signOut();
//   }
//   //Google auth
//  Future<UserCredential> signWithGoogle() async {
//    final GoogleSignInAccount googleUser =
//    await GoogleSignIn(scopes: <String>["email"]).signIn();
//
//    final GoogleSignInAuthentication googleAuth =
//    await googleUser.authentication;
//
//    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//
//    return await FirebaseAuth.instance.signInWithCredential(credential);
//  }
// //facebook auth
//  Future<UserCredential> signInWithFacebook() async {
//    final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;
//
//    final FacebookAuthCredential facebookAuthCredential =
//    FacebookAuthProvider.credential(result.token);
//
//    return await FirebaseAuth.instance
//        .signInWithCredential(facebookAuthCredential);
//  }
//
// }
//
// // class AuthBase{
// //
// //   void _userFromFirebase(User){
// //     return User();
// //   }
// //
// //   Future<void> registerWithemailAndPassword(String email,String password) async {
// //     await Firebase.initializeApp();
// //     try {
// //
// //       final User user = (await FirebaseAuth.instance
// //           .signInWithEmailAndPassword(email: email, password: password))
// //           .user;
// //       return _userFromFirebase(user.uid);
// //     } catch (e) {
// //       print(e.message);
// //
// //     };
// //   }
// // }
//
//
//
