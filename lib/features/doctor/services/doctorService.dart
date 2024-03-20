import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medihub/models/doctor.dart';

class DoctorService {
  static Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(Uri.parse('https://your-api-url.com/doctors'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch doctors');
    }
  }
}
