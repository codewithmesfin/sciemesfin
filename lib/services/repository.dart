import 'package:eesand/services/firestore_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Future<AuthResult> signInWithCredential(AuthCredential credential) =>
      _firestoreProvider.signInWithCredential(credential);

  Future<void> verifyPhoneNumber(
          String phone,
          PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
          PhoneCodeSent codeSent,
          Duration duration,
          PhoneVerificationCompleted verificationCompleted,
          PhoneVerificationFailed verificationFailed) =>
      _firestoreProvider.verifyPhoneNumber(phone, codeAutoRetrievalTimeout,
          codeSent, duration, verificationCompleted, verificationFailed);

  Future<int> authenticateUser(String phoneNo, String code) =>
      _firestoreProvider.authenticateUser(phoneNo, code);

  Future<FirebaseUser> getCurrentUser() => _firestoreProvider.getCurrentUser();

  Future<void> registerUser() async {
    print('sending');
  }
}
