import 'package:bloc/bloc.dart';
import 'package:proje_odevi_flutter/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(isDark: false));

  void toggleTheme() {
    emit(AppState(isDark: !state.isDark));
  }
}
