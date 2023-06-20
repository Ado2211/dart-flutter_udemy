
import 'package:flutter/material.dart';
import "../blocs/bloc.dart";
import "../blocs/provider.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  emailField(bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, emailSnapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              hintText: "you@example.com",
              labelText: "Email address",
              errorText: 'Invalid email'),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  passwordField(bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, emailSnapshot) {
        return TextField(
          obscureText: true,
          decoration: const InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText: 'Invalid password'),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, AsyncSnapshot<bool> submitValidSnapshot) {
          return ElevatedButton(
            onPressed: submitValidSnapshot.hasData ? bloc.submit : null,
            child:  const Text("Login"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ]));
  }
}
