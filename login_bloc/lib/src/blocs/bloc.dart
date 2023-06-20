import 'dart:async';

import './validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //! Change Data => Step 1
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    print('Email is $validEmail');
    print('Password is $validPassword');
    return null;
  }

  //! Add data to Stream => Make a stream for StreamBuilder
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2<String, String, bool>(email, password, (e, p) => true);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}