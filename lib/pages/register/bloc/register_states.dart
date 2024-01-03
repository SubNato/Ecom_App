class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  const RegisterStates(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""}); //'{}' - Denotes optional. And also note, '[]' denotes positional parameters.

  RegisterStates copyWith(          //This copyWith method is really useful!
      { //Method to return the object.
      String? userName,
      String? email,
      String? password,
      String? rePassword}) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
//Ameika - 1-954-652-9603     Send the thing to this lady instead of Ms. Bailey

//Some things to note!

//Why immutable classes? To make it safe, so that outside changes do not change the information here.
//The value should only change when you authorize it. Or it should change when you want it to be changed.
//Makes it safe. Your class should have variables, have final, and should have const to make it immutable.
//Immutable variables are objects that thread safe
