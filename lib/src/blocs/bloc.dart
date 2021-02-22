import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final StreamController<String> _email = StreamController();
  final StreamController<String> _password = StreamController();

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Add dat to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submitButton() {
    _email.stream.listen((value) {});

    _password.stream.listen((value) {});
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();
