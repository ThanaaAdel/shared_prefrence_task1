
import 'package:ablexa/features/home_page/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/feature_login_page/logic/cubit/login_cubit/login_cubit.dart';
import '../../features/feature_login_page/presentations/screens/feature_login_page.dart';
import '../../features/on_boarding_page/presentations/screens/on_boarding_page.dart';
import '../../features/splash_page/presentations/screens/spalash_page.dart';
import 'routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginPage()),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) =>  BlocProvider(
              create: (context) => LoginCubit(),
              child: HomePage()),
        );
      case Routes.onBoardingPage:
        return MaterialPageRoute(
          builder: (context) =>  const OnBoard(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defind ${settings.name}")),
          ),
        );
    }
  }
}
