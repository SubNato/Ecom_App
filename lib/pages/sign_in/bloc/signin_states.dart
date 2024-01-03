class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  SignInState copyWith({    //Optional named parameter. Makes it assigned to any value(the value called, and not both)
    String? email,
    String? password,
  })  {        // The '?' sign makes it optional. So it means option value.
    return SignInState(
      email: email ?? this.email,       //This means IF it is NOT '?' empty use whatever is there, IF it IS empty '?'
      password: password ?? this.password,          //use the other value previously stated in the const method above.
    );
  }

}
