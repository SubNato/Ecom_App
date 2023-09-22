import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}
        //flutter pub add firebase_auth was used to authenticate the values given. Used in the terminal
        //TO CHECK IF THE USER EXISTS IN THE FIREBASE.

        try {
          //Network issues should be in a try catch clause, just in case something goes wrong it does not crash your system!
          final credential = await FirebaseAuth.instance        //Singleton class ("._" ), means that you can't create a new one. So this class just uses a getter.
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if(credential.user==null){

          }
          if(credential.user!.emailVerified){

          }

          var user = credential.user;
          if(user!=null){
            //we got verified user from firebase
          }else{
            //Error getting user form firebase.
          }

        } catch (e) {}
      }
    } catch (e) {}
  }
}
