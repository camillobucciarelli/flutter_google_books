import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'app_state_state.dart';

@lazySingleton
class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(const AppState());

  void login() {
    emit(state.copyWith(isUserLoggedIn: true));
  }

  void logout() {
    emit(state.copyWith(isUserLoggedIn: false));
  }

  void changeLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  void resetLocale() {
    emit(state.copyWith(locale: null));
  }
}
