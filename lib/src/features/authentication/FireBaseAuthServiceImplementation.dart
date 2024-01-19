
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthServiceImplementation{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SignUp
  Future<User?> signUpWithEmailAndPassword (String email, String password) async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      return credential.user;
    }on FirebaseAuthException catch(e){

      if (e.code == 'email-already-in-use'){
        print('The Email address is Already in Use');
      } else{
        print('An error accured : ${e.code}');
      }
    }
    return null;
  }

  // Sign In
  Future<User?> signInWithEmailAndPassword (String email, String password) async{

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch(e){

      if(e.code == 'user-not-found' || e.code == 'wrong-password'){
        print('Invalid email or password');
      } else{
        print('Terdapat kesalahan : ${e.code}');
      }
    }
    return null;
  }


}