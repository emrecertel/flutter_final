
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proje_odevi_flutter/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(isDark: false));
   
  void toggleTheme() {
    emit(AppState(isDark: !state.isDark));
  }
   void changeLanguage(BuildContext context, Locale locale) {
    context.setLocale(locale);
  }
}
