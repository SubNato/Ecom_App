import 'package:ecom_app/pages/register/bloc/register_events.dart';
import 'package:ecom_app/pages/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_blocs.dart';
import 'bloc/register_states.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText("Enter your details below for free sign up!")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      //To get the words on the screen! In and above the text box.
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Username"),
                        buildTextField(
                            "Enter your username", "name", "user",
                                (value) {
                              context.read<RegisterBlocs>().add(UserNameEvent(value));
                            }),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address", "email", "user",
                                (value) {
                              context.read<RegisterBlocs>().add(EmailEvent(value));
                            }),
                        reusableText("Password"),

                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<RegisterBlocs>().add(PasswordEvent(value)); //The states get saved
                        }),
                        reusableText("Re-enter password"),

                        buildTextField(
                            "Re-enter your password to confirm", "password", "lock", (value) {
                          context.read<RegisterBlocs>().add(RePasswordEvent(value)); //The states get saved
                        })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reusableText("By creating an account you have to agree"),
                  ),
                  buildLoginAndRegButton("Sign Up", "login", () {       //If the login in condition is true then the button color is blue!  So it is only to get the button color.
                    //Navigator.of(context).pushNamed("register");
                    RegisterController(context:context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
