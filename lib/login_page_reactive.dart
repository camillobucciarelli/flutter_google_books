import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/app_state/app_state_cubit.dart';
import 'package:loggy/loggy.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'theme/app_theme.dart';

class LoginPageReactive extends StatelessWidget {
  const LoginPageReactive({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup(
      {
        'username': FormControl<String>(validators: [Validators.required]),
        'password': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
            Validators.pattern(r'[A-Z]'),
          ],
        ),
        'confirmPassword': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
            Validators.pattern(r'[A-Z]'),
          ],
        ),
        'terms': FormControl<bool>(value: true),
        'lightIntensity': FormControl<double>(value: 50.0),
      },
      validators: [Validators.mustMatch('password', 'confirmPassword')],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: Paddings.allS,
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            spacing: Paddings.l,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReactiveTextField(
                formControlName: 'username',
                decoration: const InputDecoration(
                  hintText: 'pippo',
                  label: Text('Username'),
                ),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Username is required',
                },
              ),
              ReactiveTextField(
                formControlName: 'password',
                decoration: const InputDecoration(
                  hintText: 'qwer4321',
                  label: Text('Password'),
                ),
                obscureText: true,
                autocorrect: false,
                validationMessages: {
                  ValidationMessage.required: (_) => 'Password is required',
                  ValidationMessage.minLength: (_) =>
                      'Password must be at least 8 characters',
                  ValidationMessage.pattern: (_) =>
                      'Password must contain at least one uppercase letter',
                },
              ),
              ReactiveTextField(
                formControlName: 'confirmPassword',
                decoration: const InputDecoration(
                  hintText: 'qwer4321',
                  label: Text('Confirm Password'),
                ),
                obscureText: true,
                autocorrect: false,
                validationMessages: {
                  ValidationMessage.pattern: (_) =>
                      'Password must contain at least one uppercase letter',
                  ValidationMessage.mustMatch: (_) => 'Passwords do not match',
                },
              ),
              ReactiveValueListenableBuilder<double>(
                formControlName: 'lightIntensity',
                builder: (context, control, child) {
                  return Text('lights at ${control.value?.toStringAsFixed(0)}%');
                },
              ),
              ReactiveSlider(
                formControlName: 'lightIntensity',
                max: 100.0,
              ),
              ElevatedButton(
                onPressed: () {
                  form.markAllAsTouched();
                  if (!form.valid) {
                    return;
                  }
                  form.control('terms').patchValue(true);
                  logDebug(form.rawValue);
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
