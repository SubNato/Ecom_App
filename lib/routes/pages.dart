//This class is to unify the BlocProvider and routes and pages/screenNames. It is a good practice to do.

import 'package:ecom_app/pages/application/application_page.dart';
import 'package:ecom_app/pages/application/bloc/app_blocs.dart';
import 'package:ecom_app/pages/register/bloc/register_blocs.dart';
import 'package:ecom_app/pages/register/register.dart';
import 'package:ecom_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ecom_app/pages/sign_in/sign_in.dart';
import 'package:ecom_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ecom_app/pages/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'names.dart';


class AppPages{
  static List<PageEntity> routes(){
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_)=>WelcomeBloc(),)
      ),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_)=>SignInBloc(),)
      ),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_)=>RegisterBlocs(),)
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_)=>AppBlocs(),)
      ),
    ];
  }

//Here we returned all the BlocProviders.
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //When using/clicking the navigator, it covers the entire screen as a model.
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      //This checks to see if the route name matches any of the above when the navigator is used. So it would grab one of the above routes and call (or use) it.
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        print("Valid route name ${settings.name}");
        return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);      //Why like this? Because it would return many results, and we want the first one, so result.first then we want the widget page (as we defined it in the class below) so we then return praise be to God, result.first.page! Hope this helps!
      }

    }
    print("Invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
  }

}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}
