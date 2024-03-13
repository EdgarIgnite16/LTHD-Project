import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void createNewUser(String email, String username) async {
    final user = <String, dynamic>{
      'username': username,
    };
    _firebaseFirestore
        .collection('users')
        .doc(email)
        .set(user);
  }

  Future<Map> getUsername(String email) async {
    return _firebaseFirestore
        .collection('users')
        .doc(email)
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);
  }
}
