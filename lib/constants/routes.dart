import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medihub/features/auth/screens/LoginScreen.dart';
import 'package:medihub/features/auth/screens/SignupScreen.dart';
import 'package:medihub/features/doctor/doctor.dart';
import 'package:medihub/features/pharmacy/screens/cart.dart';
import 'package:medihub/features/pharmacy/screens/productSelected.dart';
import 'package:medihub/features/pharmacy/screens/verticalList.dart';
import 'package:medihub/home.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());

      case SignupScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SignupScreen());

      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());

      case DoctorScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const DoctorScreen());

      case VerticalList.routeName:
        return CupertinoPageRoute(builder: (context) => const VerticalList());

      case PharmacyCart.routeName:
        return CupertinoPageRoute(builder: (context) => const PharmacyCart());

      case ProductSelected.routeName:
        return CupertinoPageRoute(
            builder: (context) => const ProductSelected());

      // case SplashScreen.routeName: return CupertinoPageRoute(
      //   builder: (context) => const SplashScreen()
      // );

      default:
        return null;
    }
  }
}
