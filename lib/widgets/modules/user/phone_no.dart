import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_codes.dart';
import 'package:eesand/bloc/phone_no/phone_no_bloc.dart';
import 'package:eesand/bloc/phone_no/phone_no_provider.dart';
import 'package:eesand/shared/Loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_view/pin_view.dart';

class PhoneNo extends StatefulWidget {
  @override
  PhoneNoState createState() => PhoneNoState();
}

class PhoneNoState extends State<PhoneNo> {
  PhoneNoBloc _bloc;
  Locale _myLocale;

  bool load = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = PhoneNoBlocProvider.of(context);

    _myLocale = Localizations.localeOf(context);

    /// We need to reflect the initial selection of the dialcode, in case the phone's selected locale
    /// matches the phone dial code, which is the majority of the cases.
    /// We do this by loading up a list of dialcodes and their respected country code, from there
    /// we find the matching dialcode for the phone's locale.
    List<CountryCode> elements = codes
        .map((s) => CountryCode(
              name: "",
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: "",
            ))
        .toList();
    String dialCode =
        elements.firstWhere((c) => c.code == _myLocale.countryCode).dialCode;
    _bloc.changeDialCode(dialCode);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.changeDialCode('+251');
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: _bloc.authStatus,
                builder: (context, snapshot) {
                  switch (snapshot.data) {
                    case (AuthStatus.phoneAuth):
                      return _authForm();
                      break;
                    case (AuthStatus.smsSent):
                      return _smsCodeInputField();
                      break;
                    case (AuthStatus.isLoading):
                      return Loading(title: Text('Checking your phone number'));
                      break;
                    default:
                      // By default we will show the email auth form
                      return _authForm();
                      break;
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget _authForm() {
    return StreamBuilder(
        stream: _bloc.phoneNumber,
        builder: (context, snapshot) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 85,
                    width: 100,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage('assets/images/user.png'))),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Enter your phone and you will recieve a confirmation code via SMS.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'RobotoMono'),
                    ),
                  ),
                  _phoneInputField(snapshot.error),
                ],
              ),
              RaisedButton(
                color: Colors.blue,
                disabledColor: Colors.grey,
                onPressed: snapshot.hasData && !snapshot.hasError
                    ? _authenticateUserWithPhone
                    : null,
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  /// Besides the user entering their phone number, we also need to know the user's country code
  /// for that we are going to use a library CountryCodePicker.
  /// The method takes in an [error] message from our validator.
  Widget _phoneInputField(String error) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.8,
      decoration: BoxDecoration(
        // color: Color(0xfff5f8fd),
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: CountryCodePicker(
              onChanged: (code) {
                // print(code.dialCode);
                _bloc.changeDialCode(code.dialCode);
              },
              initialSelection: '+251',
              favorite: [_myLocale.countryCode, '+251'],
              showCountryOnly: false,
              alignLeft: true,
              textStyle: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
            flex: 8,
            child: TextFormField(
              style: Theme.of(context).textTheme.subtitle2,
              onChanged: _bloc.changePhoneNo,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  hintText: "Phone number",
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smsCodeInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0, left: 15, right: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(
                Icons.sms,
                size: 55,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We've sent a verification code via SMS to +251 ${_bloc.getPhoneNumber}, please enter the code on the field below.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30,
            ),
            PinView(
                inputDecoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                count: 6, // describes the field number
                margin: EdgeInsets.all(2.5), // margin between the fields
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                submit: (String smsCode) {
                  AuthCredential credential = PhoneAuthProvider.getCredential(
                      verificationId: _bloc.getVerificationId,
                      smsCode: smsCode);
                  _bloc.signInWithCredential(credential).then((result) {
                    _bloc.credential = _bloc.getVerificationId;
                    _bloc.sms = smsCode;
                    _authCompleted(result);
                  });
                  setState(() => load = true);
                }),
            load ? Loading(title: Text('Authenticating')) : Container(),
          ]),
    );
  }

  void _authenticateUserWithPhone() {
    _bloc.changeAuthStatus(AuthStatus.isLoading);
    PhoneVerificationFailed verificationFailed = (AuthException authException) {
      _bloc.changeAuthStatus(AuthStatus.phoneAuth);
      _showSnackBar('Failed to verify ' +
          _bloc.getDialCode +
          _bloc.getPhoneNumber +
          ', due to ' +
          authException.message);
      // Show error to user.
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _bloc.signInWithCredential(phoneAuthCredential).then((result) {
        _bloc.credential = _bloc.getVerificationId;
        _authCompleted(result);
      });
      print('Received phone auth credential: $phoneAuthCredential');
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _bloc.changeVerificationId(verificationId);
      _bloc.changeAuthStatus(AuthStatus.smsSent);
      print(
          'Please check your phone for the verification code. $verificationId');
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("auto retrieval timeout");
    };

    _bloc.verifyPhoneNumber(codeAutoRetrievalTimeout, codeSent,
        verificationCompleted, verificationFailed);
  }

  _showSnackBar(String error) {
    final snackBar = SnackBar(content: Text(error));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _authCompleted(result) {
    _bloc.submit().then(() => Navigator.pushNamed(context, '/home'));
  }
}
