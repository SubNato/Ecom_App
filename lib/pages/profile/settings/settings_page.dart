import 'package:ecom_app/entities/values/constant.dart';
import 'package:ecom_app/global.dart';
import 'package:ecom_app/pages/application/bloc/app_blocs.dart';
import 'package:ecom_app/pages/application/bloc/app_events.dart';
import 'package:ecom_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ecom_app/pages/home/bloc/home_page_events.dart';
import 'package:ecom_app/pages/profile/settings/widgets/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/names.dart';
import '../../../widgets/base_text_widget.dart';
import 'bloc/settings_blocs.dart';
import 'bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData(){
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Settings"),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingStates>(
            builder: (context, state){
              return Container(
                child: Column(
                  children: [

                    settingsButton(context, removeUserData)

                  ],
                ),
              );
            }
        )
      ),
    );
  }
}
