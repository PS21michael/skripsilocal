
class SignupEmailAndPasswordFailure{
  final String message;

  const SignupEmailAndPasswordFailure([this.message = "Terjadi kesalahan. Tolong di cek kembali"]);

  factory SignupEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
        return const SignupEmailAndPasswordFailure('Passwor terlalu mudah ditebak');
      case 'invalid-email' :
        return const SignupEmailAndPasswordFailure('Email tidak valid');
      case 'email-already-in-use' :
        return const SignupEmailAndPasswordFailure('Email sudah terdaftar');
      case 'operation-not-allowed' :
        return const SignupEmailAndPasswordFailure('Terjadi keselahan sistem');
      case 'user-disabled' :
        return const SignupEmailAndPasswordFailure('User dinonaktifkan. Tolong hubungi tim support');
      default: return const SignupEmailAndPasswordFailure();
    }
  }

}