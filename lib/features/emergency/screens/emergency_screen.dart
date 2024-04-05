import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:medihub/features/emergency/services/emergency_services.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler;
import 'package:location/location.dart' as location;
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatefulWidget {
  static const String routeName = '/emergency';
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  final EmergencyServices  emergencyServices = EmergencyServices();
  List<Hospital>? fetchList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchHospitals();
  }

  void fetchHospitals() async{

    await emergencyServices.getCurrentLocation();
    // bool? res = await FlutterPhoneDirectCaller.callNumber('+919579483461');
    // print(res);
    // Accessing _currentLocation using the getter method
    final locationData = emergencyServices.getCurrentLocationData();
    print(locationData);

    if (locationData != null) {
      double? latitude = locationData.latitude;
      double? longitude = locationData.longitude;

      final userlocation = LatLng(latitude!, longitude!);

      print('$latitude $longitude');

      try {

      fetchList = await emergencyServices.fetchNearbyHospitals(userlocation);



      }catch(e){
        print("Fetch hospital error $e");
      }

      print(" listvalue: $fetchList");

      final address = await emergencyServices.getAddress(latitude, longitude);

      // if (address != null) {
      //   print('Emergency at: $address');
      //   List<String> recipients = ["+919579483461"];
      //   String message = "Emergency at: $address";
      
      // } else {
      //   print('Failed to get address');
      // }



    } else {
      print('Failed to get current location');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Emergency Button"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () { // Call method to get current location// Make emergency call to 911 (or your local emergency number)

          },
          child: Text("Emergency"),
        ),
      ),
    );
  }
}
