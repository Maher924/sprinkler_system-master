import 'dart:math';

import 'package:sprinkler_system/utils/user_id.dart';
class SprinklerId {


  static List<String> id = [

    Random().nextInt(1000000000).toString(),
    Random().nextInt(1000000000).toString(),
    Random().nextInt(1000000000).toString(),
    Random().nextInt(1000000000).toString(),
    Random().nextInt(1000000000).toString(),];
  static List<bool> active =[
    true,
    true,
    true,
    true,
    true,
    true,
  ];
   static  bool auto = true;


}