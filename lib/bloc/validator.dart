import 'dart:async';

class Validator {
  // Email field validator
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    String pattern = r'(^[a-zA-Z]*$)';

    RegExp regExp = new RegExp(pattern);

    if(regExp.hasMatch(name) && name.isNotEmpty)
        sink.add(name);
    else sink.addError('Please, enter a valid name');
  });

// Validate Phone Number
  final validatePhoneNo = StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNo, sink) {
    String pattern = r"^(?:[+0]+)?[0-9]{6,14}$";
    RegExp regExp = new RegExp(pattern);
    regExp.hasMatch(phoneNo)
        ? sink.add(phoneNo)
        : sink.addError('Please, enter a valid Phone Number');
  });

  final validateBirthDate = StreamTransformer<String, String>.fromHandlers(
      handleData: (birthDate, sink) {
    if (birthDate.isEmpty || !RegExp(r"^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4})$").hasMatch(birthDate))
      sink.addError('Please enter a valid date of birth');
    else {
      List<String> date = birthDate.split('/');
      if(int.parse(date[2]) > 2003 || int.parse(date[2]) < 1840)
        sink.addError('Please enter a valid Year');
      else
        sink.add(birthDate);
    }
  });

  final validateString = StreamTransformer<String, String>.fromHandlers(
    handleData: (string, sink){ 
      if(string.isEmpty)
        sink.addError('Please enter a valid value');
       else{
         List<String> trimmed = string.split(' ');
         if(trimmed.length == 1){
          if(trimmed[0] == ' ')
            sink.addError('Please enter a valid value');
          else{
            print('adding $string');
            sink.add(trimmed[0]);
          }
         }
          }
    }
  );

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty ||
          !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
        sink.addError('Please enter a valid email address');
      else {
        List<String> emailTrimmed = email.split(' ');
        sink.add('${emailTrimmed[0]}');
      }
    },
  );

  final validateUser = StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (user, sink) {
      user.isEmpty ? sink.addError(null) : sink.add(user);
    },
  );
}
