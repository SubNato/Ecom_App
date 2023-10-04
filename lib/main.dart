import 'package:ecom_app/app_blocs.dart';
import 'package:ecom_app/app_events.dart';
import 'package:ecom_app/app_states.dart';
import 'package:ecom_app/pages/application/application_page.dart';
import 'package:ecom_app/pages/bloc_providers.dart';
import 'package:ecom_app/pages/register/register.dart';
import 'package:ecom_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ecom_app/pages/sign_in/sign_in.dart';
import 'package:ecom_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ecom_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_core/firebase_core.dart';

import 'entities/values/colors.dart'; //Remember to put the dependency classpath above the others in android gradle build.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //To test Firebase Connection
  await Firebase.initializeApp(
      //Error appeared. The fix was to add the import of Firebase manually.
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.primaryText      //This is to set the color of the back button on the AppBar. It si there by default in the color white (the main color of the AppBar).
                ),
                  elevation: 0, backgroundColor: Colors.white)),
          home: const ApplicationPage(),
          routes: {
            //"myHomePage": (context) => const MyHomePage(),
            "signIn": (context) => const SignIn(),
            "register": (context)=>const Register()
          },
        ),
      ),
    );
  }
}
//void onCreate(){
//super.onCreate();

//MultiDex.install(getBaseContext());
//}
