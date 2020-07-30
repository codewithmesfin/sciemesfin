import 'package:eesand/bloc/validator.dart';
import 'package:eesand/services/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Define all possible states for the auth form.
enum AuthStatus { phoneAuth, smsSent, isLoading }

class PhoneNoBloc with Validator {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool infoPage = true;
  String credential;
  String sms;

  final _repository = Repository();
  final _dialCode = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _authStatus = BehaviorSubject<AuthStatus>();
  final _verificationId = BehaviorSubject<String>();

// Add data to stream, validate inputs
  Observable<String> get dialCode => _dialCode.stream;
  Observable<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNo);

  Observable<String> get verificationID => _verificationId.stream;
  Observable<AuthStatus> get authStatus => _authStatus.stream;

  Stream<bool> get submitValid => Observable.combineLatest2(
      phoneNumber, phoneNumber, (phoneNo, code) => true);

// get values
  String get getDialCode => _dialCode.value;
  String get getPhoneNumber => _phoneNumber.value;
  String get getVerificationId => _verificationId.value;
  AuthStatus get getAuthStatus => _authStatus.value;

  //change data
  Function(String) get changeDialCode => _dialCode.sink.add;
  Function(String) get changePhoneNo => _phoneNumber.sink.add;
  Function(String) get changeVerificationId => _verificationId.sink.add;
  Function(AuthStatus) get changeAuthStatus => _authStatus.sink.add;

  Future<FirebaseUser> getCurrentUser() => _repository.getCurrentUser();

  Future<AuthResult> signInWithCredential(AuthCredential credential) {
    return _repository.signInWithCredential(credential);
  }

  // onAuthStateChanged
  Stream<String> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
  }

  //logout user
  Future<void> signOut() async {
    return _auth.signOut();
  }

  Future<void> verifyPhoneNumber(
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
      PhoneCodeSent codeSent,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed) {
    // For the full phone number we need to concat the dialcode and the number entered by the user

    String fullPhoneNumber =
        _dialCode.value + _phoneNumber.value.replaceAll(" ", "");

    return _repository.verifyPhoneNumber(
        fullPhoneNumber,
        codeAutoRetrievalTimeout,
        codeSent,
        Duration(seconds: 120),
        verificationCompleted,
        verificationFailed);
  }

  submit() async {
    final validPhoneNo =
        _dialCode.value + _phoneNumber.value.replaceAll(" ", "");
    print(validPhoneNo);
  }

  void dispose() async {
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _verificationId.drain();
    _verificationId.close();
    await _dialCode.drain();
    _dialCode.close();
    await _authStatus.drain();
    _authStatus.close();
  }
}
