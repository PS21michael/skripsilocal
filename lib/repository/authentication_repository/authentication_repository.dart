import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/authentication/mail_verification.dart';
import 'package:skripsilocal/pages/authentication/register_page.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/repository/authentication_repository/exception/Signin_email_password_failure.dart';
import 'package:skripsilocal/repository/authentication_repository/exception/signup_email_password_failure.dart';
import '../../../pages/profile/fill_profile.dart';
import '../user_repository/user_repository.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // variabel temp
  String emailGoogleSignIn = "";

  String isSuccessCreateUser = "False";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn  = GoogleSignIn(
      scopes: <String>[
        'email',
      ]
  );

  // variabels tambahan
  final deviceStorage = GetStorage();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  var verificationId = ''.obs;

  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => firebaseUser?.uid??"";

  String get getUserEmail => firebaseUser?.email?? "";

  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    // screenRedirect();
    // setInitialScreen(_firebaseUser.value);
    // ever(_firebaseUser, _setInitialScreen);
  }

  setInitialScreen (User ? user) async{
    // null means user logout
    // not null means already clik login button and been authenticated

    // if(user == null){
    //   print('CheckPoint 1');
    //   Get.offAll(()=> RegisterPage());
    // } else if(user != null){
    //   print('CheckPoint 2');
    //   if(user.emailVerified){
    //     print('CheckPoint 3');
    //     Get.offAll(HomePage());
    //   } else{
    //     Get.offAll(MailVerification());
    //     print('CheckPoint 4');
    //   }
    // }

    user == null ? Get.offAll(()=> const RegisterPage())
        : user.emailVerified ?
    Get.offAll(const HomePage()) :
        Get.offAll(const MailVerification());
    print('user authenticated : ${user?.emailVerified}');
  }

  screenRedirect()async{

    final user = _auth.currentUser;

    if(user != null){
      // if the user logged in
      if(user.emailVerified){
        // if the user's email is verified, navigate to the main menu
        Get.offAll(const HomePage());
      } else {
        // if the user's email is not verified, navigate to verification menu
        Get.offAll(const MailVerification());
      }
    } else{
      // local storage
      deviceStorage.writeIfNull('isFirstTime', true);

      // check if it's first time launching app
      deviceStorage.read('isFirstTime') != true ?
      Get.offAll(const LoginPage()) :
          // TODO
          // Nanti ubah ke onboarding screen atau splash screen
      Get.offAll(const MailVerification());
    }


    //Local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(()=> const RegisterPage()) : Get.offAll(()=> const RegisterPage());
}


  Future<void> sendEmailVerification()async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      final ex = SigninEmailAndPasswordFailure.code(e.code);
      throw ex.message;
    } catch(_){
      const ex = SigninEmailAndPasswordFailure();
      throw ex.message;
    }
  }

  // Forget Password
  Future<void> sendEmailForgetPassword(String email)async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      final ex = SigninEmailAndPasswordFailure.code(e.code);
      throw ex.message;
    } on FormatException catch (e){
      throw 'Something went wrong Format exception : $e';
    } on PlatformException catch (e){
      throw 'Something went wrong Platform exception : $e';
    } catch(_){
      const ex = SigninEmailAndPasswordFailure();
      throw ex.message;
    }
  }


  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken){
        this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
        },
        verificationFailed: (e){
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid.');
        } else{
          Get.snackbar('Error', 'Something went wrong, try again.');
        }
        },
    );
  }

  Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp));

    return credentials.user != null ? true : false;
  }

  // Password Validation
  bool isHasUpperCase(String password){
    final regExp = RegExp('(?=.*[A-Z])');
    return regExp.hasMatch(password);
  }
  // Password Validation
  bool isHasLowerCase(String password){
    final regExp = RegExp('(?=.*[a-z])');
    return regExp.hasMatch(password);
  }
  // Password Validation
  bool isHasDigit(String password){
    final regExp = RegExp('(?=.*?[0-9])');
    return regExp.hasMatch(password);
  }
  // Password Validation
  bool isHasSpecialCharacter(String password){
    final regExp = RegExp('(?=.*?[!@#\$&*~])');
    return regExp.hasMatch(password);
  }
  // Email Validation
  bool isEmailValid(String email){
    final regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(email);
  }

  String getisSuccessCreateUser(){
    return isSuccessCreateUser;
  }



  Future<void> createUserWithEmailAndPassword(String email, String password, String confirmPassword) async {
    if(!isEmailValid(email)){
      print('Email must be valid');
      // showToast(message:'Email must be valid');
      showCustomSnackbar("Error", "Email must be valid");
    } else if(password.length<8){
      // showToast(message:'Password should at least 8 character');
      showCustomSnackbar("Error", "Password should at least 8 character");
    } else if(password.length>16){
      // showToast(message:'Password should maksimum 8 character');
      showCustomSnackbar("Error", "Password can't more than 16 character");
    } else if (!isHasUpperCase(password)){
      // showToast(message:'Password should have at least one upper case');
      showCustomSnackbar("Error", "Password should have at least one upper case");
    }else if (!isHasLowerCase(password)){
      // showToast(message:'Password should have at least one Lower case');
      showCustomSnackbar("Error", "Password should have at least one Lower case");
    }else if (!isHasDigit(password)){
      // showToast(message:'Password should have at least one Number');
      showCustomSnackbar("Error", "Password should have at least one Number");
    }else if (!isHasSpecialCharacter(password)){
      // showToast(message:'Password should have at least one Special Character');
      showCustomSnackbar("Error", "Password should have at least one Special Character");
    } else if(password != confirmPassword){
      // showToast(message:'Confirm Password Should be same with Passowrd');
      showCustomSnackbar("Error", "Confirm Password Should be same with Passowrd");

    } else {
      try{
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        isSuccessCreateUser = "True";
        _firebaseUser.value == null ? Get.offAll(()=>const RegisterPage())
            : _firebaseUser.value?.emailVerified == true
        ? Get.to(()=>const LoginPage()) :
        Get.to(()=>const MailVerification());

      } on FirebaseAuthException catch(e){
        final ex = SignupEmailAndPasswordFailure.code(e.code);
        isSuccessCreateUser = "False";

        // showToast(message:'FIREBASE AUTH EXCEPTION - ${ex.message}');
        showCustomSnackbar("Error", "FIREBASE AUTH EXCEPTION - ${ex.message}");
        print('FIREBASE EXCEPTION - ${e.code}');
      } catch(_){
        const ex = SignupEmailAndPasswordFailure();
        isSuccessCreateUser = "False";
        print('EXCEPTION - ${ex.message}');
        throw ex;
      }
    }

  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {

    try{

      print("Firebase usser : ${_firebaseUser.value}");
      print("Email given : $email");
      print("Password given : $password");
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Sekarang di comment untuk menentukan apakah user udah pernah dafar atau belum
      if(_firebaseUser.value != null){
        if(UserRepository.instance.getUserModelProvince() == "ProvinsiUtama"){
          Get.to(()=>const FillProfile());
        } else{
          Get.offAll(()=>const HomePage());
        }
      } else{
        Get.to(()=>const LoginPage());
      }
      // _firebaseUser.value != null ? Get.offAll(()=>HomePage()) : Get.to(()=>LoginPage());
    } on FirebaseAuthException catch(e){
      final ex = SigninEmailAndPasswordFailure.code(e.code);
      // showToast(message:'FIREBASE AUTH EXCEPTION - ${ex.message}');
      showCustomSnackbar("Error", "FIREBASE AUTH EXCEPTION - ${ex.message}");
      print('FIREBASE AUTH EXCEPTION - ${e.code}');
    } catch(_){
      const ex = SigninEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }

  }

  Future<UserCredential?> signInWithGoogle() async {
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
       await FirebaseAuth.instance.signInWithCredential(credential);
    } catch(e){
      print('checkError2 : ');
      // isGoogleLoading.value=false;
      // showToast(message:'Error Happend : $e');
      showCustomSnackbar("Error", "Error Happend : $e");
    }
  }

  void _loginWithGoogle() async{

    try{

      final GoogleSignInAccount ? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Get.offAll(()=>const HomePage());

      }

    } catch (e){
      print('Some error accurred $e');
    }

  }

  // function to implement the google signin

// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    emailGoogleSignIn = googleSignInAccount!.email;
    print('CheckPointGoogle 1, Email udah di assign $emailGoogleSignIn');
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      // Get.offAll(()=>HomePage());

      // if (result != null) {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => HomePage()));
      // } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  String getEmailGoogleSingIn(){
    print('Email yg dikirim repo : $emailGoogleSignIn');
    return emailGoogleSignIn;
  }


  // Future<void> logout() async => await _auth.signOut();

  Future<void> logout() async {
    // await GoogleSignIn().signOut();
    await _auth.signOut();
    Get.to(()=>const LoginPage());

    // firebaseUser != null? Get.offAll(()=>HomePage()) : Get.to(()=>LoginPage());

    // AuthenticationRepository.instance.logout();
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}