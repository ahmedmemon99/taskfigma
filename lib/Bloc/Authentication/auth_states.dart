class AuthState{



}
class AuthInitialState extends AuthState{


}

class LoginSuccessState extends AuthState{

  LoginSuccessState({required this.id});
  final int id;


}
class LoginFailState extends AuthState{


}
class AuthLoadingState extends AuthState{

}

class ErrorState extends AuthState{

  ErrorState({required this.errorMsg});

  String errorMsg;


}