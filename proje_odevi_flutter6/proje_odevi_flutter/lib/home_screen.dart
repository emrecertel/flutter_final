import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_page').tr()
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/photoCache');
              },
              child: Text('photo_cache_system').tr()
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/themeSettings');
              },
              child: Text('theme_settings').tr(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/languageSupport');
              },
              child: Text('language_support').tr(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/jsonData');
              },
              child: Text('json_data_reading').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
