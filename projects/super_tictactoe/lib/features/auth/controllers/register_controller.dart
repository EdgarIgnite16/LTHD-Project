
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/services/firebase_auth_service.dart';
import 'package:todo_app/features/auth/services/firebase_store_service.dart';

class RegisterController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  User? signupUser;
  DocumentReference? newUserDoc;

  Future<User?> signup(username, email, password) async {
    signupUser = await _authService.signUpWithEmailAndPassword(email, password);
    if (signupUser == null) {
      return null;
    }
    _firebaseStoreService.createNewUser(email, username);
    return signupUser;
  }
}
