
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
      case 'account-exists-with-different-credential' :
        return const SigninEmailAndPasswordFailure('Passowrd not match with email');
      case 'operation-not-allowed' :
        return const SigninEmailAndPasswordFailure('Too many requests to log into this account.');
      case 'invalid-credential' :
        return const SigninEmailAndPasswordFailure('Email atau Password tidak ditemukan');

      default: return const SigninEmailAndPasswordFailure();
    }

  }

}