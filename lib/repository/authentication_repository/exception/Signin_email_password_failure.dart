class SigninEmailAndPasswordFailure{

  final String message;

  const SigninEmailAndPasswordFailure([this.message = "There is an error. Please check again"]);

  factory SigninEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'user-not-found' :
        return const SigninEmailAndPasswordFailure('User not found');
      case 'invalid-email' :
        return const SigninEmailAndPasswordFailure('Invalid email');
      case 'email-already-in-use' :
        return const SigninEmailAndPasswordFailure('Email has been registered');
      case 'operation-not-allowed' :
        return const SigninEmailAndPasswordFailure('A system error occurred');
      case 'user-disabled' :
        return const SigninEmailAndPasswordFailure('User disabled. Please contact the support team');
      case 'wrong-password' :
        return const SigninEmailAndPasswordFailure('Wrong password');
      case 'account-exists-with-different-credential' :
        return const SigninEmailAndPasswordFailure('Password does not match');
      case 'invalid-credential' :
        return const SigninEmailAndPasswordFailure('Email or password not found');

      default: return const SigninEmailAndPasswordFailure();
    }

  }

}