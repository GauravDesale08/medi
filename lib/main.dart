import 'package:flutter/material.dart';
import 'package:medihub/constants/routes.dart';
import 'package:medihub/home.dart';
import 'package:medihub/home1.dart';
import 'package:medihub/utils/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/top_doctor/screens/doctor_hori.dart';

String? authToken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  authToken = sharedPreferences.getString('x-auth-token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: authToken != null ? HomeScreen() : HomeScreen(),
    );
  }
}
