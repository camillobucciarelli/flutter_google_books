part of 'app_state_cubit.dart';

class AppState extends Equatable {
  const AppState({this.isUserLoggedIn = false, this.locale});

  final bool isUserLoggedIn;
  final Locale? locale;

  AppState copyWith({bool? isUserLoggedIn, Locale? locale}) {
    return AppState(
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      locale: locale,
    );
  }

  @override
  List<Object?> get props => [isUserLoggedIn, locale];
}
