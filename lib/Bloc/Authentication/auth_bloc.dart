import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_events.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_events.dart';
import 'package:taskappfigma/Repository/authentication_repository.dart';
import '../product Bloc/bloc.dart';
import 'auth_states.dart';
import 'package:flutter/material.dart';


class AuthBloc extends Bloc<AuthEvent,AuthState>{
   TextEditingController emailController =TextEditingController();
   TextEditingController passwordController =TextEditingController();
   int? userid;
   AuthBloc() : super(AuthInitialState()){
    on(onLogin);
    on(onFieldError);
  }

  void onLogin(LoginEvent event,Emitter<AuthState> emit)async {
       event.emailKey.currentState!.validate();
       event.pwdKey.currentState!.validate();
      if(event.pwdKey.currentState!.isValid && event.emailKey.currentState!.isValid){
            emit(AuthLoadingState());
            final int? id = await Authentication.userLogin(emailController.text , passwordController.text);
            if(id != null){
              if(id > 4){
                userid = Random().nextInt(3)+1;
              }else{
                userid = id;
              }
              emit(LoginSuccessState(id: id));
              print(id);
            }else{
              emit(LoginFailState());
            }
      }
  }

  void onFieldError(ErrorEvent event, Emitter<AuthState> emit){
     if(event.emailText.isEmpty || event.emailText.length < 8 || !event.emailText.contains('@')){
       emit(ErrorState(errorMsg: 'please enter valid email address'));
     }else if (event.passwordText.isEmpty || event.passwordText.length < 8 ){
       emit(ErrorState(errorMsg: 'Password minimum 8 characters required'));
     }else{
       emit(AuthInitialState());
     }
  }

  @override
  Future<void> close() {
   emailController.dispose();
   passwordController.dispose();
   return super.close();
  }
}