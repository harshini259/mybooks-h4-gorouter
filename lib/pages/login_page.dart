import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/auth/auth_bloc.dart';
import 'package:myapp/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
          onPressed: () {
            context.read<AuthBloc>().add(LoginEvent());
          },
          child: const Text("Login")),
    );
  }
}
