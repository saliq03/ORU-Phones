import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://40.90.224.241:5000";

  // Generate OTP
  static Future<http.Response> generateOtp(int countryCode, int mobileNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/otpCreate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
      }),
    );
    return response;
  }

  // Validate OTP
  static Future<http.Response> validateOtp(int countryCode, int mobileNumber, int otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/otpValidate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
        'otp': otp,
      }),
    );
    return response;
  }

  // Fetch Products
  static Future<http.Response> fetchProducts(Map<String, dynamic> filters) async {
    final response = await http.post(
      Uri.parse('$baseUrl/filter'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(filters),
    );
    return response;
  }


}