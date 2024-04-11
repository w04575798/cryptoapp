//splash.dart
import 'package:flutter/material.dart';
import 'navbar.dart'; // Import the navbar.dart file

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFF6CE4AC),
          height: myHeight,
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/loading.gif'),
              Text(
                'Coin App',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
              ), ///text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.14),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavBar())); // Use NavBar() to navigate to the NavBar screen
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFBC700),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05, vertical: myHeight * 0.013),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SEE PRICE TRACKER  ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        RotationTransition(
                          turns: AlwaysStoppedAnimation(310 / 360),
                          child: Icon(Icons.arrow_forward_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
