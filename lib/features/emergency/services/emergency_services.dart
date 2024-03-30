import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler;
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as location;
import 'dart:convert';
// import 'package:flutter_sms/flutter_sms.dart';


class EmergencyServices {
  location.LocationData? _currentLocation;

  Future<void> requestPermissions() async {
    await permission_handler.Permission.location.request();
    await permission_handler.Permission.phone.request();
  }

  Future<void> getCurrentLocation() async {
    var locationService = location.Location();
    bool serviceEnabled = await locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationService.requestService();
      if (!serviceEnabled) {
        // Handle if user denies enabling location services
        return;
      }
    }

    var permission = await permission_handler.Permission.location.status;
    if (permission != permission_handler.PermissionStatus.granted) {
      permission = await permission_handler.Permission.location.request();
      if (permission != permission_handler.PermissionStatus.granted) {
        // Handle if user denies location permission
        return;
      }
    }

    _currentLocation = await locationService.getLocation();
  }

  // Getter method to access _currentLocation
  location.LocationData? getCurrentLocationData() {
    return _currentLocation;
  }

  Future<String?> getAddress(double? latitude, double? longitude) async {
  final url =
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final displayName = decoded['display_name'];
      final mapLink = 'https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude';
      return '$displayName\n\nLocation: $mapLink';
    }
  } catch (e) {
    print('Error getting address: $e');
  }
  return null;
}

// void _sendSMS(String message, List<String> recipents) async {
//  String _result = await sendSMS(message: message, recipients: recipents)
//         .catchError((onError) {
//       print(onError);
//     });
// print(_result);
// }

}
