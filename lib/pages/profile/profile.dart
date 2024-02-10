import 'dart:convert';

import 'package:ecom_app/entities/values/colors.dart';
import 'package:ecom_app/global.dart';
import 'package:ecom_app/pages/profile/bloc/profile_blocs.dart';
import 'package:ecom_app/pages/profile/bloc/profile_events.dart';
import 'package:ecom_app/pages/profile/bloc/profile_states.dart';
import 'package:ecom_app/pages/profile/widgets/profile_widgets.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    var userProfile = Global.storageService.getUserProfile();
    print("user profile is ${jsonEncode(userProfile)}");     //jsonEncode because that's an object, and we want to convert it to a string. When it is json. Makes it readable as it isn't an object.
    context.read<ProfileBlocs>().add(TriggerProfileName(userProfile!));

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBlocs, ProfileStates>(builder: (context, state){     //We do this because the settings page is not a route, so to make the blocs available, we set it here for the page to use
      return Scaffold(      //Remember to inject your blocs! This is very important!
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //For showing profile image
                profileIconandEditButton(),
                SizedBox(height: 30.h,),
                //For showing the profile name.
                buildProfileName(state),
                //Build row buttons
                buildRowView(context),

                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: buildListView(context),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
