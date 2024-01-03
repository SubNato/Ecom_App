import 'package:ecom_app/pages/register/bloc/register_events.dart';
import 'package:ecom_app/pages/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
   RegisterBlocs():super(const RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
     print("Username: ${event.userName}");    //These are to check to see what values are being entered into the system. To really see if it works.
    emit(state.copyWith(userName:event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
    print("Email: ${event.email}");
    emit(state.copyWith(email:event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
    print("Password: ${event.password}");
    emit(state.copyWith(password:event.password));
  }
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
    print("Password Confirmed: ${event.rePassword}");
    emit(state.copyWith(rePassword:event.rePassword));
  }
}