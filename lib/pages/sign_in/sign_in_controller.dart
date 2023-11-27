import 'dart:convert';

import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/entities/values/constant.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../apis/user_api.dart';
import '../../global.dart';
import 'bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // Could ALSO USE     BlocProvider.of<SignInBloc>(context).state.   IF you don't want to use the Bloc Provider. Still uses Bloc though.
        final state = context.read<SignInBloc>().state; //To use the bloc "(context.read<>())" that accesses the UI.
        String emailAddress = state.email; //Calling the state above allows access to everything in that class. Which is needed!
        String password = state.password;
        if (emailAddress.isEmpty) {

          toastInfo(msg: "Please enter an email address");
          return;
        }
        if (password.isEmpty) {

          toastInfo(msg: "Please enter a password");
          return;
        }
        //flutter pub add firebase_auth was used to authenticate the values given. Used in the terminal
        //TO CHECK IF THE USER EXISTS IN THE FIREBASE.

        try {
          //Network issues should be in a try catch clause, just in case something goes wrong it does not crash your system!
          final credential = await FirebaseAuth.instance        //Singleton class ("._" ), means that you can't create a new one. So this class just uses a getter.
              .signInWithEmailAndPassword(  //Hover over the method to see what type of EXCEPTION it could throw with the FireBaseAuthException in a try/catch block!
                  email: emailAddress, password: password);
          if(credential.user==null){

            toastInfo(msg: "User does not exist");
            return;
          }
          if(!credential.user!.emailVerified){

            toastInfo(msg: "Please verify your email address");
            return;
          }

          var user = credential.user;
          if(user!=null){
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            //Type 1 means email login.
            loginRequestEntity.type = 1;

            print("User Exists");
            asyncPostAllData(loginRequestEntity);

            //we got verified user from firebase
          }else{
            toastInfo(msg: "Currently User does not exist");
            return;
            //Error getting user form firebase.
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("No user found for that email");
            toastInfo(msg: "No user found for that email .");
          } else if (e.code == 'wrong-password') {
            print("Wrong password provided");
            toastInfo(msg: "Wrong password provided for that user.");
          }else if (e.code == 'invalid-email'){
            print("Invalid email detected");
            toastInfo(msg: "Invalid email detected");
          }else{    //NewOne
            print("Something is wrong!");
            toastInfo(msg: "Invalid Log in credentials");
          }
        }
      }
    } catch (e) {print(e.toString());}
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    var result = await UserAPI.login(params:loginRequestEntity);
    if(result.code==200){     //This is possible because the results obtained from backend are placed in an object for ease of retrieving data.
      try{                  //So if you use the objects name, you can access a specific field from that object like 'code' (which was pre-converted in other methods with 'fromJson' etc.) as used here to query or compare it using 'if' method.
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));     //The '!' means not null.
        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
      }catch(e){
        print("Saving local storage error ${e.toString()}");
      }
    }else{
      EasyLoading.dismiss();
      toastInfo(msg: "An unknown error occurred");
    }
  }

}
