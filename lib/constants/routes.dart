import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medihub/features/auth/screens/LoginScreen.dart';
import 'package:medihub/features/auth/screens/SignupScreen.dart';
import 'package:medihub/features/doctor/catDoctor/screens/doctor_details.dart';
import 'package:medihub/features/doctor/catDoctor/screens/doctor_vertical.dart';
import 'package:medihub/features/doctor/doctor.dart';
import 'package:medihub/features/doctor/services/doctorService.dart';
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
        final medName = settings.arguments as String;
        return CupertinoPageRoute(
            builder: (context) => ProductSelected(medName: medName));

      case DoctorVertical.routeName:
        final doctCategory = settings.arguments as String;
        return CupertinoPageRoute(
            builder: (context) => DoctorVertical(doctCategory: doctCategory,));

      case DoctorDetails.routeName:
        final doctId = settings.arguments as String;
        return CupertinoPageRoute(
            builder: (context) => DoctorDetails(doctId: doctId,));

      

      

      // case SplashScreen.routeName: return CupertinoPageRoute(
      //   builder: (context) => const SplashScreen()
      // );

      default:
        return null;
    }
  }
}
