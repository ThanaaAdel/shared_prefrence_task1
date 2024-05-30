
import 'dart:async';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/Routing/routers.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late Timer _timer;
  _goNext() {
    _getStoreUser();
  }

  _startDelay() async {
    _timer = Timer(
      const Duration(seconds: 3, milliseconds: 300),
          () {
        _goNext();
      },
    );
  }
  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('onBoard') != null) {
      if (prefs.getString('user') != null) {
        print("the user data is done");
          Navigator.pushReplacementNamed(context, Routes.homePage);
      } else {
        print("the onboarding data is done");
        Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginPage
          ,ModalRoute.withName(
            Routes.initialRoute,
          ),
        );
      }
    } else {
      print("the onBording data is  not done");
      Navigator.pushReplacementNamed(
        context,
        Routes.onBoardingPage,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Image.asset(
              ImageManager.logo),
        ]),
      ),
    );
  }
}
