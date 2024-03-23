import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medihub/models/doctor.dart';
import 'package:medihub/utils/helper.dart';

class DoctorService {
  
  Future<List<Doctor>> fetchDoctorsByCategory(String category) async {
  try {
    // Make a GET request to the API endpoint with the specified category
    final response = await http.get(Uri.parse('$uri/api/doctor-by-category?doctCategory=$category'));
    print(response.body);
    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON response body
      final List<dynamic> data = jsonDecode(response.body)['data'];
      print(data);
      // Map the JSON data to Doctor objects
      List<Doctor> doctors = data.map((json) => Doctor.fromJson(json)).toList();
      
      return doctors; // Return the list of doctors
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to fetch doctors: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors that occur during the request
    throw Exception('Error fetching doctors: $e');
  }
  }

  Future<Doctor> getDoctorDetails({required String doctId, required BuildContext context}) async {
    
    try {
      final response = await http.get(
        Uri.parse('$uri/api/doctor-details?doctId=$doctId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        Doctor doctorDetails = Doctor.fromJson(jsonData['data']);
        return doctorDetails; // Return the fetched doctor details
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to fetch doctor details'),
        ));
        throw Exception('Failed to fetch doctor details');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
      ));
      throw Exception('Error fetching doctor details: $e');
    }
  }
  

}
