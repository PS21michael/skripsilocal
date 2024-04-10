class SigninEmailAndPasswordFailure{

  final String message;

  const SigninEmailAndPasswordFailure([this.message = "Terjadi kesalahan. Tolong di cek kembali"]);

  factory SigninEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'user-not-found' :
        return const SigninEmailAndPasswordFailure('User tidak ditemukan');
      case 'invalid-email' :
        return const SigninEmailAndPasswordFailure('Email tidak valid');
      case 'email-already-in-use' :
        return const SigninEmailAndPasswordFailure('Email sudah terdaftar');
      case 'operation-not-allowed' :
        return const SigninEmailAndPasswordFailure('Terjadi keselahan sistem');
      case 'user-disabled' :
        return const SigninEmailAndPasswordFailure('User dinonaktifkan. Tolong hubungi tim support');
      case 'wrong-password' :
        return const SigninEmailAndPasswordFailure('Password salah');
      case 'account-exists-with-different-credential' :
        return const SigninEmailAndPasswordFailure('Password tidak sesuai');
      case 'operation-not-allowed' :
        return const SigninEmailAndPasswordFailure('Terlalu banyak percobaan masuk');
      case 'invalid-credential' :
        return const SigninEmailAndPasswordFailure('Email atau Password tidak ditemukan');

      default: return const SigninEmailAndPasswordFailure();
    }

  }

}