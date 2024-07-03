import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/authentication/mail_verification.dart';
import 'package:skripsilocal/pages/authentication/register_page.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/profile/pickCategory.dart';
import 'package:skripsilocal/repository/authentication_repository/exception/Signin_email_password_failure.dart';
import 'package:skripsilocal/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import '../../../pages/profile/fill_profile.dart';
import '../user_repository/user_repository.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  String emailGoogleSignIn = "";
  String isSuccessCreateUser = "False";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn  = GoogleSignIn(
      scopes: <String>[
        'email',
      ]
  );

  final deviceStorage = GetStorage();
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
    Get.put(BookmarkRepository());
    // screenRedirect();
    setInitialScreen(_firebaseUser.value);
  }

  setInitialScreen (User ? user) async{
    Get.put(UserRepository());
    if(user == null){
      Get.offAll(()=> const ExplorePage());
    } else {
      // print("object : $AuthenticationRepository.instance.getUserEmail");
    }
    await Future.delayed(const Duration(milliseconds: 100));
    await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    await Future.delayed(const Duration(milliseconds: 100));
    await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    // print("object2 : $AuthenticationRepository.instance.getUserEmail");
    // String idPengguna = UserRepository.instance.getUserModelId();
    if(user != null && user.emailVerified){
      await Future.delayed(const Duration(seconds: 500));
      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
      await Future.delayed(const Duration(seconds: 500));
      await UserRepository.instance.getSingelUserDetails(firebaseUser!.email.toString());
      await Future.delayed(const Duration(seconds: 500));
      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);

      // Get.offAll(const ExplorePage());
      Get.offAll(() => const ExplorePage());
    } else{
      // Get.offAll(const MailVerification());
      Get.offAll(() => const MailVerification());
    }
  
    // print('user authenticated : ${user?.emailVerified}');
  }

  // screenRedirect() async{
  //
  //   final user = _auth.currentUser;
  //
  //   if(user != null){
  //     if(user.emailVerified){
  //       // if the user's email is verified, navigate to the main menu
  //       Get.offAll(const ExplorePage());
  //     } else {
  //       // if the user's email is not verified, navigate to verification menu
  //       Get.offAll(const MailVerification());
  //     }
  //   } else{
  //     // local storage
  //     deviceStorage.writeIfNull('isFirstTime', true);
  //     deviceStorage.read('isFirstTime') != true ?
  //     Get.offAll(const LoginPage()) :
  //     // TODO
  //     // Nanti ubah ke onboarding screen atau splash screen
  //     Get.offAll(const MailVerification());
  //   }
  //
  //
  //   //Local storage
  //   deviceStorage.writeIfNull('isFirstTime', true);
  //   deviceStorage.read('isFirstTime') != true ? Get.offAll(()=> const RegisterPage()) : Get.offAll(()=> const RegisterPage());
  // }


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

  bool isHasUpperCase(String password){
    final regExp = RegExp('(?=.*[A-Z])');
    return regExp.hasMatch(password);
  }
  bool isHasLowerCase(String password){
    final regExp = RegExp('(?=.*[a-z])');
    return regExp.hasMatch(password);
  }
  bool isHasDigit(String password){
    final regExp = RegExp('(?=.*?[0-9])');
    return regExp.hasMatch(password);
  }
  bool isHasSpecialCharacter(String password){
    final regExp = RegExp('(?=.?[!@#\$&~])');
    return regExp.hasMatch(password);
  }
  bool isEmailValid(String email){
    final regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(email);
  }

  String getisSuccessCreateUser(){
    return isSuccessCreateUser;
  }



  Future<void> createUserWithEmailAndPassword(String email, String password, String confirmPassword) async {
    if(!isEmailValid(email)){
      // print('Email must be valid');
      showCustomSnackbar("Error", "Email not valid");
    } else if(password.length<8){
      showCustomSnackbar("Error", "Password should at least 8 character");
      // } else if(password.length>16){
      //   showCustomSnackbar("Error", "Password can't more than 16 character");
    } else if (!isHasUpperCase(password)){
      showCustomSnackbar("Error", "Password should have at least one upper case");
    }else if (!isHasLowerCase(password)){
      showCustomSnackbar("Error", "Password should have at least one Lower case");
    }else if (!isHasDigit(password)){
      showCustomSnackbar("Error", "Password should have at least one Number");
    }else if (!isHasSpecialCharacter(password)){
      showCustomSnackbar("Error", "Password should have at least one Special Character");
    } else if(password != confirmPassword){
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

        showCustomSnackbar("Error", ex.message);
        // print('FIREBASE EXCEPTION - ${e.code}');
      } catch(_){
        const ex = SignupEmailAndPasswordFailure();
        isSuccessCreateUser = "False";
        // print('EXCEPTION - ${ex.message}');
        throw ex;
      }
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {

    try{
      // print("Firebase usser : ${_firebaseUser.value}");
      // print("Email given : $email");
      // print("Password given : $password");
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Sekarang di comment untuk menentukan apakah user udah pernah dafar atau belum
      if(_firebaseUser.value != null){
        if(UserRepository.instance.getUserModelProvince() == "ProvinsiUtama"){
          Get.to(()=>const FillProfile());
        } else if(UserRepository.instance.getUserModelInitScore() == "NO"){
          Get.offAll(()=> const PickCategory());
        } else{
          Get.offAll(()=>const ExplorePage());
        }
      } else{
        Get.to(()=>const LoginPage());
      }
    } on FirebaseAuthException catch(e){
      final ex = SigninEmailAndPasswordFailure.code(e.code);
      showCustomSnackbar("Error", ex.message);
      // print('FIREBASE AUTH EXCEPTION - ${e.code}');
    } catch(_){
      const ex = SigninEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      throw ex;
    }

  }

  Future<UserCredential?> signInWithGoogle() async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch(e){
      // print('checkError2 : ');
      // isGoogleLoading.value=false;
      // showToast(message:'Error Happend : $e');
      showCustomSnackbar("Error", "Something went wrong");
    }
    return null;
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
        Get.offAll(()=>const ExplorePage());
      }

    } catch (e){
      // print('Some error accurred $e');
    }

  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    emailGoogleSignIn = "";
    emailGoogleSignIn = googleSignInAccount!.email;
    // print('CheckPointGoogle 1, Email udah di assign $emailGoogleSignIn');
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(authCredential);
    // User? user = result.user;

    // Get.offAll(()=>ExplorePage());

    // if (result != null) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => ExplorePage()));
    // }
    }

  String getEmailGoogleSingIn(){
    // print('Email yg dikirim repo : $emailGoogleSignIn');
    return emailGoogleSignIn;
  }


  // Future<void> logout() async => await _auth.signOut();

  Future<void> logout() async {
    await _auth.signOut();
    Get.to(()=>const LoginPage());
    // print("User Berhasil keluar");
  }

  Future<void> reauthenticateAndDelete(String password) async {
    try {

      // print("email 1 : $getUserEmail");
      // print("Password 1 : $password");


      await _auth.signInWithEmailAndPassword(email: getUserEmail, password: password);

      final providerData = FirebaseAuth.instance.currentUser?.providerData.first;
      // print("Data email 1 : ${EmailAuthProvider.PROVIDER_ID}");
      // print("Data email 2 : ${providerData!.providerId}");
      // print("email 1 : ${providerData.providerId}");

      if (providerData != null && EmailAuthProvider.PROVIDER_ID == providerData.providerId) {
        print("Checkpoint email 1");
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(EmailAuthProvider as AuthProvider);
      } else if (providerData != null && GoogleAuthProvider().providerId == providerData.providerId) {
        print("Checkpoint email 2");
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }

      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      // print("Error yang didapat : $e");
      showCustomSnackbar("Error", "DB Auth hasn't been deleted!", isError: true);
      Get.to(()=> const LoginPage());
      return;
    }
  }

  Future<void> deleteUserGoogle() async {

    final providerData = FirebaseAuth.instance.currentUser?.providerData.first;
    if (GoogleAuthProvider().providerId == providerData?.providerId) {
      await signup();
      await FirebaseAuth.instance.currentUser?.delete();
      try{
        await FirebaseAuth.instance.currentUser?.delete();
      } catch(e){

      }
    }
    await FirebaseAuth.instance.currentUser?.delete();
  }

  String flagHapusAuth ="";
  Future<void> deleteUser(String password) async {
    flagHapusAuth ="";
    try{
      await _auth.signInWithEmailAndPassword(email: getUserEmail, password: password);
      try {
        flagHapusAuth = "TRUE";
        await Future.delayed(const Duration(milliseconds: 200));
        await FirebaseAuth.instance.currentUser!.delete();
        flagHapusAuth = "TRUE";
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          showCustomSnackbar("Error", "DB Auth hasn't been deleted!", isError: true);
        }
      }
    } on FirebaseAuthException catch(e){
      flagHapusAuth = "FALSE";
      flagHapusAuth = "FALSE";
      flagHapusAuth = "FALSE";
      final ex = SigninEmailAndPasswordFailure.code(e.code);
    }

  }

  String getFlagAuthDelete(){
    return flagHapusAuth;
  }


  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}