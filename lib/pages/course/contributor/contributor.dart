import 'package:ecom_app/entities/values/colors.dart';
import 'package:ecom_app/pages/course/contributor/contributor_controller.dart';
import 'package:ecom_app/pages/course/contributor/cubit/contributor_cubits.dart';
import 'package:ecom_app/pages/course/contributor/cubit/contributor_states.dart';
import 'package:ecom_app/pages/course/contributor/widgets/contributor_widgets.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contributor extends StatefulWidget {
  const Contributor({super.key});

  @override
  State<Contributor> createState() => _ContributorState();
}

class _ContributorState extends State<Contributor> {
  late ContributorController _contributorController;

  @override
  void didChangeDependencies() {
    _contributorController = ContributorController(context: context);
    _contributorController.init();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContributorCubits, ContributorStates>(
        builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Contributor"),
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //This container contains background image as well as the profile photo. Stacked widget
                Container(
                  width: 325.w,
                  height: 220.h,
                  child: Stack(
                    children: [
                      //Author page background
                      backgroundImage(),
                      //Author page profile photo and bio
                      if(state.authorItem != null)
                      Positioned(           //Positioned is used to get the profile picture at a certain position in the stack. So basically it can be positioned as you like.
                          left: 0, bottom: 0, child: authorView(context, state))
                      else
                        Container(),

                    ],
                  ),
                ),
                SizedBox(height: 30.h,),
                //About Me and Description
                authorsDescription(state),
                SizedBox(height: 20.h,),
                //Chat button using reusable components
                GestureDetector(
                    onTap: (){
                      if(state.authorItem!=null){
                        _contributorController.goChat(state.authorItem!);
                      }
                    },
                    child: appPrimaryButton("Go Chat!")

                ),
                SizedBox(height: 30.h,),
                reusableText("Author's Course List", color: AppColors.primaryText, ),
                authorCourseList(state),
              ],
            ),
          ),
        ),
      );
    });
  }


}
