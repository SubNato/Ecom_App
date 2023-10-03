import 'package:ecom_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ecom_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_blocs.dart';

class AppBlocProviders{
  static get allBlocProviders=> [
    BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
    BlocProvider(lazy: false, create: (context) => AppBlocs()), //This is (when set to false) orders this Bloc to be called first. Order ia important!
    BlocProvider(create: (context) => SignInBloc())
  ];
}