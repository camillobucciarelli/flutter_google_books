import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/app_state/app_state_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/loggy.dart';

import 'theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: Paddings.allS,
        child: Form(
          key: formKey,
          child: Column(
            spacing: Paddings.l,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                errorBuilder: (context, errorText) {
                  return Row(
                    children: [
                      const Icon(Icons.error),
                      Text(errorText),
                    ],
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lo username è obbligatorio';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'pippo',
                  label: Text('Username'),
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La password è obbligatoria';
                  }
                  if (value.length < 8) {
                    return 'La password deve avere almeno 8 caratteri';
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'La password deve avere almeno una lettera maiuscola';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'qwer4321',
                  label: Text('Password'),
                ),
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: 'qwer4321',
                  label: Text('Confirm Password'),
                ),
                obscureText: true,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La password è obbligatoria';
                  }
                  if (value.length < 8) {
                    return 'La password deve avere almeno 8 caratteri';
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'La password deve avere almeno una lettera maiuscola';
                  }
                  if (value != passwordController.text) {
                    return 'Le password non corrispondono';
                  }
                  return null;
                }
              ),
              ElevatedButton(
                onPressed: () {
                  if(!formKey.currentState!.validate()){
                    return;
                  }
                  logDebug(usernameController.text);
                  logDebug(passwordController.text);
                  context.read<AppStateCubit>().login();
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
