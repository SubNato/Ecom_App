import 'package:ecom_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ecom_app/pages/sign_in/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc():super(const SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState>emit){
    print("My email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState>emit){
    print("My Password is ${event.password}");          //So as you would type in either fields (email or password) an event would get triggered. (kind of like a stack, adding one letter at a time.)
    emit(state.copyWith(password: event.password));
  }
}