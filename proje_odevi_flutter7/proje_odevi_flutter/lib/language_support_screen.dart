
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'cubit/app_cubit.dart';

class LanguageSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('languageHelp').tr(),
      ),
      body: Center(
        child: DropdownButton<Locale>(
          value: context.locale,
          hint: Text('select_language').tr(),
          onChanged: (Locale? locale) {
            if (locale != null) {
              BlocProvider.of<AppCubit>(context).changeLanguage(context, locale);
            }
          },
          items: [
            DropdownMenuItem(
              value: Locale('en', 'US'),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: Locale('tr', 'TR'),
              child: Text('Türkçe'),
            ),
          ],
        ),
      ),
    );
  }
}
