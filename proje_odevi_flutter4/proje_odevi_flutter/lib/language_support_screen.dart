import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('languageHelp').tr(),
      ),
      body: Center(
        child: Text('Dil Desteği Sayfası'),
      ),
    );
  }
}
