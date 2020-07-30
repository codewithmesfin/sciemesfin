import 'package:firebase_auth/firebase_auth.dart';

class FirestoreProvider {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<int> authenticateUser(String phoneNo, String code) async {
    return null;
  }

  // Future<void> registerUser(
  //     String firstName, String middleName, String lastName) async {
  //   return _firestore.collection("psuUsers").document(firstName).setData({
  //     'firstName': firstName,
  //     'middleName': middleName,
  //     'lastName': lastName
  //   });
  // }

  Future<FirebaseUser> getCurrentUser() => _auth.currentUser();

  Future<AuthResult> signInWithCredential(AuthCredential credential) async =>
      await _auth.signInWithCredential(credential);

  Future<void> verifyPhoneNumber(
      String phone,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
      PhoneCodeSent codeSent,
      Duration duration,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed) async {
    return _auth.verifyPhoneNumber(
        phoneNumber: phone,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        codeSent: codeSent,
        timeout: duration,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed);
  }
}
