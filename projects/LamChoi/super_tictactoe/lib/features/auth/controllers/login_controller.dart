import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/services/firebase_auth_service.dart';
import 'package:todo_app/features/auth/services/firebase_store_service.dart';

class LoginController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  User? _loginUser;

  Future<User?> signing(String email, String password) async {
    return _loginUser =
        await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<String> getUsername(String email) async {
    Map map = await _firebaseStoreService.getUsername(email);
    return map['username'];
  }
}
