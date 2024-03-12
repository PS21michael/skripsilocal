
class SignupEmailAndPasswordFailure{
  final String message;

  const SignupEmailAndPasswordFailure([this.message = "An Unknown error occured."]);

  factory SignupEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
        return const SignupEmailAndPasswordFailure('Please enter a stronger password.');
      case 'invalid-email' :
        return const SignupEmailAndPasswordFailure('Email is not valid or badly formatted.');
      case 'email-already-in-use' :
        return const SignupEmailAndPasswordFailure('An account already exists for that email.');
      case 'operation-not-allowed' :
        return const SignupEmailAndPasswordFailure('Operation is not allowed. Please contact support.');
      case 'user-disabled' :
        return const SignupEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');
      default: return const SignupEmailAndPasswordFailure();
    }
  }

}