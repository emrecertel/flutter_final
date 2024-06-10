import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proje_odevi_flutter/api_example_screen.dart';
import 'package:proje_odevi_flutter/json_read_screen.dart';
import 'package:proje_odevi_flutter/splash_screen.dart';
import 'package:proje_odevi_flutter/theme_settings.dart';
import 'home_screen.dart';
import 'theme/app_theme.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';
import 'utils/cache_helper.dart';
import 'photo_cache_screen.dart';
import 'language_support_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
 runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('tr', 'TR'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/photoCache': (context) => PhotoCacheScreen(),
              '/themeSettings': (context) => ThemeSettingsScreen(),
              '/languageSupport': (context) => LanguageSupportScreen(),
              '/jsonData': (context) => JsonDataScreen(),
             '/apiExample': (context) => ApiExampleScreen(),
            },
          );
        },
      ),
    );
  }
}
