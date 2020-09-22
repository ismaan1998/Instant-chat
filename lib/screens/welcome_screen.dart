import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController colorController;
  Animation animation;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    colorController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    colorAnimation = ColorTween(begin: Colors.blueAccent, end: Colors.white)
        .animate(colorController);

    controller.forward();
    colorController.forward();

    colorController.addListener(() {
      setState(() {});
    });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: "Login",
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: "Register",
              function: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
