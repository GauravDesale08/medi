import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medihub/constants/colors.dart';
import 'package:medihub/features/news/pages/home.dart';
import 'package:medihub/features/news/pages/vertHome.dart';
import 'package:medihub/features/top_doctor/screens/doctor_hori.dart';
import 'package:medihub/providers/user_provider.dart';
import 'package:medihub/utils/customBanner.dart';
import 'package:medihub/utils/customContainer.dart';
import 'package:provider/provider.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    print(user.toJson());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Find your desire \nhealth solution",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: SearchBar(
                    leading: Icon(Icons.search),
                    hintText: "Search doctor, drug, article...",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 5),
                  child: Row(
                    children: [
                      CustomContainer(
                        text: 'Doctor',
                        imagePath: 'assets/Doctor.png',
                        routeName: 'doctor',
                      ),
                      CustomContainer(
                        text: 'Pharmacy',
                        imagePath: 'assets/Pharmacy.png',
                        routeName: 'pharmacy',
                      ),
                      CustomContainer(
                        text: 'Hospital',
                        imagePath: 'assets/Hospital.png',
                        routeName:
                            '/exercise-types', // Replace '/hospital' with the actual named route
                      ),
                      CustomContainer(
                        text: 'Ambulance',
                        imagePath: 'assets/Ambulance.png',
<<<<<<< HEAD
                        routeName:'/symptom', // Replace '/ambulance' with the actual named route
=======
                        routeName:
                            '/ambulance', // Replace '/ambulance' with the actual named route
>>>>>>> 6b2877b40829ea4506af4baf15aac4c5ef606e85
                      ),
                    ],
                  ),
                ),
                CustomBanner(
                  text: 'Early protection for \nyour family health',
                  buttonText: 'Learn More',
                  imagePath: 'assets/img_2.png',
                  onPressed: () {
                    // Add your button action here
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 18, right: 5),
                  child: SizedBox(
                    width: 383,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Top Doctors",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: shadowColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(user.name),
                        // HorizontalDoctorList(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 18, right: 5),
                  child: SizedBox(
                    width: 383,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Health Articles",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Home.routeName);
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: shadowColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(user.name),
                        // HorizontalDoctorList(),
                          VertHome(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
