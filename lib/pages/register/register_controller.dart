import 'package:ecom_app/entities/values/constant.dart';
import 'package:ecom_app/pages/register/bloc/register_blocs.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});


  Future<void> handleEmailRegister() async {
    final state = context
        .read<RegisterBlocs>()
        .state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "UserName field cannot be empty.");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email field cannot be empty.");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password field cannot be empty.");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Password confirmation is wrong.");
      return;
    }
      //Remember that errors may be caused from the database table as well!
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password
      );

      if (credential.user !=
          null) { //This checks to see if there are credentials for the user in the database.
        await credential.user?.sendEmailVerification(); //This line of code requests/allows the database to send a verification email to the user that registered.
        await credential.user?.updateDisplayName(userName); //This line of code updates or gives the user the username they requested. Most likely updated/attached to the email which tells exactly the individual.
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "An email has been sent to the email you have registered. To acticate your account please check your email and click on the link provided.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email provided is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email is invalid");
      }
    }
  }
}
