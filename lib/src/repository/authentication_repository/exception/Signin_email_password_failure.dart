
class SigninEmailAndPasswordFailure{

  final String message;

  const SigninEmailAndPasswordFailure([this.message = "An Unknown error occured."]);

  factory SigninEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'user-not-found' :
        return const SigninEmailAndPasswordFailure('User Not Found.');
      case 'invalid-email' :
        return const SigninEmailAndPasswordFailure('Email is not valid or badly formatted.');
      case 'email-already-in-use' :
        return const SigninEmailAndPasswordFailure('An account already exists for that email.');
      case 'operation-not-allowed' :
        return const SigninEmailAndPasswordFailure('Operation is not allowed. Please contact support.');
      case 'user-disabled' :
        return const SigninEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');
      case 'wrong-password' :
        return const SigninEmailAndPasswordFailure('Wrong Password.');
      default: return const SigninEmailAndPasswordFailure();
    }

  }

}