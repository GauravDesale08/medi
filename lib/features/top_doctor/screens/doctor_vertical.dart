// import 'package:flutter/material.dart';
// import 'package:medihub/models/doctor.dart';
// import '../services/doctor_service.dart';

// class DoctorVertical extends StatefulWidget {
//   const DoctorVertical({Key? key}) : super(key: key);

//   @override
//   State<DoctorVertical> createState() => _DoctorVerticalState();
// }

// class _DoctorVerticalState extends State<DoctorVertical> {
//   late List<Doctor> doctors;

//   @override
//   void initState() {
//     super.initState();
//     _fetchDoctors();
//   }

//   Future<void> _fetchDoctors() async {
//     try {
//       final List<Doctor> fetchedDoctors = await DoctorService.fetchDoctors();
//       setState(() {
//         doctors = fetchedDoctors;
//       });
//     } catch (e) {
//       print('Error fetching doctors: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Center(child: const Text("Top Doctor"))),
//       body: doctors == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return Card(
//             elevation: 2, // Set the elevation for the card
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Set margin
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12), // Set border radius
//               side: BorderSide(color: Colors.grey.shade300, width: 1), // Set border
//             ),
//             child: ListTile(
//               leading: Image.network(doctor.imgUrl),
//               title: Text(doctor.name),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(doctor.position),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.yellow),
//                       Text(doctor.rating.toString()),
//                     ],
//                   ),
//                   Text('${doctor.distance} km away'),
//                 ],
//               ),
//             ),
//           );
//         },

//       ),
//     );
//   }
// }
