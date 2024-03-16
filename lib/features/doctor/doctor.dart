import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medihub/utils/customContainer.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  static const String routeName = "doctor";

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Doctor'),
        centerTitle: true, // Center the title
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "Search doctor, drug, article...",
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 5),
                  child: Row(
                    children: [
                      CustomContainer(
                        text: 'General',
                        imagePath: 'assets/Doctor.png',
                        routeName: 'doctor',
                      ),
                      CustomContainer(
                        text: 'Lungs',
                        imagePath: 'assets/Pharmacy.png',
                        routeName: 'pharmacy',
                      ),
                      CustomContainer(
                        text: 'Dentist',
                        imagePath: 'assets/Hospital.png',
                        routeName:
                            '/hospital', // Replace '/hospital' with the actual named route
                      ),
                      CustomContainer(
                        text: 'Psychiatrist',
                        imagePath: 'assets/Ambulance.png',
                        routeName:
                            '/ambulance', // Replace '/ambulance' with the actual named route
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 5),
                  child: Row(
                    children: [
                      CustomContainer(
                        text: 'Covid-19',
                        imagePath: 'assets/Doctor.png',
                        routeName: 'doctor',
                      ),
                      CustomContainer(
                        text: 'Surgeon',
                        imagePath: 'assets/Pharmacy.png',
                        routeName: 'pharmacy',
                      ),
                      CustomContainer(
                        text: 'Cardiologist',
                        imagePath: 'assets/Hospital.png',
                        routeName:
                            '/hospital', // Replace '/hospital' with the actual named route
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
