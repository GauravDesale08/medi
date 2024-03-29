import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler;
import 'package:location/location.dart' as location;
class EmergencyServices{
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
    // After obtaining location, you can use _currentLocation as needed
     // Trigger a rebuild to update UI with the obtained location
  }
}