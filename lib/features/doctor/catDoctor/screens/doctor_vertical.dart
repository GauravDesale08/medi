import 'package:flutter/material.dart';
import 'package:medihub/models/doctor.dart';
import 'package:medihub/features/doctor/services/doctorService.dart';

class DoctorVertical extends StatefulWidget {
  final String doctCategory;
  const DoctorVertical({Key? key,required this.doctCategory}) : super(key: key);

  static const routeName = 'category';

  @override
  State<DoctorVertical> createState() => _DoctorVerticalState();
}

class _DoctorVerticalState extends State<DoctorVertical> {
  late Future<List<Doctor>> futureDoctors;

  @override
  void initState() {
    super.initState();
    futureDoctors = DoctorService.fetchDoctors() as Future<List<Doctor>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Top Doctor"))),
       body: Text(widget.doctCategory),
       //FutureBuilder<List<Doctor>>(
      //   future: futureDoctors,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else {
      //       List<Doctor> doctors = snapshot.data!;
      //       return ListView.builder(
      //         itemCount: doctors.length,
      //         itemBuilder: (context, index) {
      //           final doctor = doctors[index];
      //           return Card(
      //             elevation: 2,
      //             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(12),
      //               side: BorderSide(color: Colors.grey.shade300, width: 1),
      //             ),
      //             child: ListTile(
      //               leading: Image.network(doctor.doctImage!),
      //               title: Text(doctor.doctName!),
      //               subtitle: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(widget.doctCategory!),
      //                   Row(
      //                     children: [
      //                       Icon(Icons.star, color: Colors.yellow),
      //                       Text(doctor.doctDesc!),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
    );
  }
}
