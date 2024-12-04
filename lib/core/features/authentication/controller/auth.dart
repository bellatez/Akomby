import 'package:Akombi/core/features/authentication/models/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  late Rx<User?> firebaseUser;
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit(){
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);

    // Bind firebaseUser changes.
    firebaseUser.bindStream(auth.authStateChanges());
    // ever(firebaseUser, )
  }

  // Register a user.
Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Registe successful");
    } catch (e){
      Get.snackbar("Error", e.toString());
    }
  }

  // Login a user.
  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Login successful");

    } catch (e){
      Get.snackbar("Error", e.toString());
    }
  }

  // Logout
  Future<void> logout() async{
    try {
      await auth.signOut();
    } catch (e){
      Get.snackbar("Error", e.toString());
    }
  }
}