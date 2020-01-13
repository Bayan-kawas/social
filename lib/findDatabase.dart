import 'package:shared_preferences/shared_preferences.dart';
import 'creatDBbdart.dart';
SharedPreferences prefs;
findDatabase(){
  print("0000000000000000");
  if(prefs.containsKey('database')){
    dataSeeded=true;
    print('dataseeded is true');
  }else{
    dataSeeded=false;
    print('dataSeeded is false ');
  }
}