import 'package:flutter/material.dart';
import 'package:proje_odevi_flutter/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      isLastPage = (page == 2);
    });
  }

  void _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              _buildPage(
                image: 'assets/mood_dairy_image.png',
                title: 'Welcome to Our App',
                description: 'This is the first page of the onboarding screen.',
              ),
              _buildPage(
                image: 'assets/relax_image.png',
                title: 'Discover Features',
                description: 'This is the second page of the onboarding screen.',
              ),
              _buildPage(
                image: 'assets/welcome.png',
                title: 'Get Started',
                description: 'This is the third page of the onboarding screen.',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text('Skip'),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor:
                              _pageController.hasClients && _pageController.page?.round() == i
                                  ? Colors.blue
                                  : Colors.grey,
                        ),
                      ),
                  ],
                ),
                TextButton(
                  onPressed: isLastPage
                      ? _completeOnboarding
                      : () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                  child: Text(isLastPage ? 'Get Started' : 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
