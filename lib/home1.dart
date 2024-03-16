import 'package:flutter/material.dart';
import 'package:medihub/constants/colors.dart';
import 'package:medihub/features/top_doctor/screens/doctor_hori.dart';
import 'package:medihub/utils/customBanner.dart';
import 'package:medihub/utils/customContainer.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        width: 150,
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
                            '/hospital', // Replace '/hospital' with the actual named route
                      ),
                      CustomContainer(
                        text: 'Ambulance',
                        imagePath: 'assets/Ambulance.png',
                        routeName:
                            '/ambulance', // Replace '/ambulance' with the actual named route
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
                              width: 190,
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: shadowColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        HorizontalDoctorList(),
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
