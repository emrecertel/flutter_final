import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proje_odevi_flutter/home_screen.dart';
import 'board_screen.dart';
import 'utils/cache_helper.dart';
import 'cubit/app_cubit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Splash ekranının 2 saniye görünmesi
    bool isFirstTime = CacheHelper.getData(key: 'isFirstTime') ?? true;

    if (isFirstTime) {
      CacheHelper.saveData(key: 'isFirstTime', value: false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BoardScreen()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PROJE SPLASH SCREEN"),
            SizedBox(height: 15,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Image.network("https://picsum.photos/200/300"),
              ),
            ),
               SizedBox(height: 15,),
            Container(
              child:CircularProgressIndicator() ,
            )
          ],
        ),
      ),
    );
  }
}
