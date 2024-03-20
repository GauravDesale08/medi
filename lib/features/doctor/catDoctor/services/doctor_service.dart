import 'package:http/http.dart' as http;
import 'package:medihub/features/doctor/services/doctorModel.dart';
import 'dart:convert';

class DoctorService {
  static Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(Uri.parse('http://192.168.163.96:3000/api/get-doctors'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}
