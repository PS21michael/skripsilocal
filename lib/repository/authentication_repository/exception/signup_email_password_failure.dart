class SignupEmailAndPasswordFailure{
  final String message;

  const SignupEmailAndPasswordFailure([this.message = "Something went wrong, please try again!"]);

  factory SignupEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
        return const SignupEmailAndPasswordFailure('Password not too strong');
      case 'invalid-email' :
        return const SignupEmailAndPasswordFailure('Email not valid');
      case 'email-already-in-use' :
        return const SignupEmailAndPasswordFailure('Email already registered');
      case 'operation-not-allowed' :
        return const SignupEmailAndPasswordFailure('A system error occured');
      case 'user-disabled' :
        return const SignupEmailAndPasswordFailure('User disabled. Please contact support team');
      default: return const SignupEmailAndPasswordFailure();
    }
  }

}