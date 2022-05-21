import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserID{
  static User? userID;
  static var  db = FirebaseFirestore.instance;
  static Map<String,dynamic> userdata= {
    'firstName':'',
    'lastName':'',
    'phoneNumber':'',
    'email':'',
    'password':'',
    'id':'${Random().nextInt(100000000).toString()}',
    'landArea':'',
    'landShape':'',
    'landID':'${Random().nextInt(10000).toString()}',
    'sprinklers':'',
  };
  static Map<String,dynamic> sprinklerData = {
    '0':'${Random().nextInt(1000000000).toString()}',
    '1':'${Random().nextInt(1000000000).toString()}',
    '2':'${Random().nextInt(1000000000).toString()}',
    '3':'${Random().nextInt(1000000000).toString()}',
    '4':'${Random().nextInt(1000000000).toString()}',
    '5':'${Random().nextInt(1000000000).toString()}',
  };
  static Map<String,dynamic> sprinklerStatus = {
    '0':true,
    '1':true,
    '2':true,
    '3':true,
    '4':true,
    '5':true,
    'auto':true,
  };
  static void  push_sprinkler_data() async{
  db.collection("sprinklersID").doc('${userID?.uid}').set(sprinklerData)
      .onError((e, _) => print("Error writing document: $e"));
  db.collection("sprinklersStatus").doc('${userID?.uid}').set(sprinklerStatus)
      .onError((e, _) => print("Error writing document: $e"));
  }
  static void  get_sprinkler_data() async{
    final docRef = await db.collection("sprinklersID").doc("${userID?.uid}");
    docRef.get().then(
          (DocumentSnapshot doc) async {
        final data = await doc.data() as Map<String, dynamic>;
        sprinklerData = data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    final docRefr = await db.collection("sprinklersStatus").doc("${userID?.uid}");
    docRefr.get().then(
          (DocumentSnapshot doc) async {
        final data = await doc.data() as Map<String, dynamic>;
        sprinklerStatus = data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }


  static void push_user_data()async{
    db.collection("userData").doc('${userID?.uid}').set(userdata)
        .onError((e, _) => print("Error writing document: $e"));

  }

  static void get_user_data()async{
    final docRef = await db.collection("userData").doc("${userID?.uid}");
    docRef.get().then(
          (DocumentSnapshot doc) async {
        final data = await doc.data() as Map<String, dynamic>;
        userdata = data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  static String calc_active(){
    int x=0;
    for (int i=0;i<6;i++)

    {
      if (sprinklerStatus['$i']== true)
        x++;
    }

    return x.toString();
  }
  static String calc_deactive(){
    int x=0;
    for (int i=0;i<6;i++)

    {
      if (sprinklerStatus['$i']== false)
        x++;
    }

    return x.toString();
  }

}
