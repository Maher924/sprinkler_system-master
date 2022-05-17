import 'dart:math';
class SprinklerId {
  static List<String> id = [
    Random().nextInt(1000000000).toString(),
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
   static String calc_active(){
     int x=0;
     for (int i=0;i<6;i++)

       {
         if (active[i]== true)
           x++;
         }

     return x.toString();
   }
   static String calc_deactive(){
     int x=0;
     for (int i=0;i<6;i++)

       {
         if (active[i]== false)
           x++;
         }

     return x.toString();
   }
}