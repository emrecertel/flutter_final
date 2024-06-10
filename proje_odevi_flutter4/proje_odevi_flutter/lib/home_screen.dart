import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/photoCache');
              },
              child: Text('Fotoğraf Cache Sistemi'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/themeSettings');
              },
              child: Text('Tema Ayarları'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/languageSupport');
              },
              child: Text('Dil Desteği'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/jsonData');
              },
              child: Text('Json Veri Okuma'),
            ),
          ],
        ),
      ),
    );
  }
}
