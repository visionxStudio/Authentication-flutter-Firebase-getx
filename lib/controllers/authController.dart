import 'package:firebaseAuthentication/screens/homepage.dart';
import 'package:firebaseAuthentication/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>(); // Making the user observable
  // final somthing = 0.obs;

  String get user => _firebaseUser.value?.email; // Observables have values :D

  // static AuthController get to => Get.find<AuthController>();

  // Listening to the authentication changes using stream
  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // creating the new user
  void createUser(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => Get.offAll(
              Homepage(),
            ),
          );
    } catch (error) {
      Get.snackbar("Error Creating account", error.message,
          snackPosition: SnackPosition.BOTTOM);
      if (error.code == "email-already-in-use") {
        print("Email adress already in use");
      }
    }
  }

  // Logging the  user

  void login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => Get.offAll(
              Homepage(),
            ),
          );
    } catch (error) {
      Get.snackbar("Unable to sign in!", error.message,
          snackPosition: SnackPosition.BOTTOM);
      print(error.code);
    }
  }

  // sign out the user

  void signOut() async {
    try {
      await _auth.signOut().whenComplete(
            () => Get.offAll(
              Login(),
            ),
          );
    } catch (error) {
      print(error.code);
    }
  }
}
