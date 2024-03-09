import 'package:ecom_app/pages/home/home_page.dart';
import 'package:ecom_app/pages/messages/message/cubit/message_cubits.dart';
import 'package:ecom_app/pages/messages/message/message.dart';
import 'package:ecom_app/pages/search/bloc/search_blocs.dart';
import 'package:ecom_app/pages/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../entities/values/colors.dart';
import '../../profile/profile.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    const HomePage(),
    BlocProvider<SearchBlocs>(create: (context)=>SearchBlocs(), child: const Search(),),     //This is another way of injecting your blocs for the app to use and get the states etc.

    Center(child: Text("Course")),
    //Center(child: Text("Chat")),
    BlocProvider<MessageCubits>(create: (context)=>MessageCubits(), child: Messages(),),
    //Center(child: Text("Profile")),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    //Explaination: The stuff on the navigation bar at the bottom are actually icons. Like what other apps use. They are actually photos sized to match what is needed. The more you know!
    label: "home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
          "assets/icons/home.png"), //The exact directory and name along with the file type of the photo being used.
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "course",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];