
import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_of_art/model/cart.dart';
import 'package:world_of_art/model/user.dart';

class UserServices{

  var _firestore= FirebaseFirestore.instance;
  //Firestore _firestore = Firestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async{
    try{
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
    }catch(e){
      print('ERROR: ${e.toString()}');
    }


  }

  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).doc(id).get().then((doc){
    print("==========id is $id=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");

    print("==========NAME is ${doc.data()['name']}=============");
    print("==========NAME is ${doc.data()['name']}=============");
    print("==========NAME is ${doc.data()['name']}=============");


    return UserModel.fromMap(override);
  });

  void addToCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}