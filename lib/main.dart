import 'package:ecom_app/app_blocs.dart';
import 'package:ecom_app/app_events.dart';
import 'package:ecom_app/app_states.dart';
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
          home: const Welcome(),
          routes: {
            "myHomePage": (context) => const MyHomePage(),
            "signIn": (context) => const SignIn(),
            "register": (context)=>const Register()
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "heroTag1",
            //Hero Tags are used to identify between the different FloatingActionButtons!
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "heroTag2", //Explanation listed above!
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//void onCreate(){
//super.onCreate();

//MultiDex.install(getBaseContext());
//}
