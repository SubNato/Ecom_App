import 'dart:convert';

import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/entities/values/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }
Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
}

  Future<bool> setString(String key, String value) async {    //To create string
    return await _prefs.setString(key, value);
  }

bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
}

bool getIsLoggedIn(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
}     //To retrieve string


Future<bool> remove(String key){
    return _prefs.remove(key);
}

String getUserToken(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
}


UserItem? getUserProfile(){

    var profileOffline = _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ??"";
    if(profileOffline.isNotEmpty){       //'fromJson' changes the Json data into an object!
      return UserItem.fromJson(jsonDecode(profileOffline));
    }     //jsonDecode changes a String (or whatever is being given to it), to Json format for the use that it is needed for.
    return null;
  }

}