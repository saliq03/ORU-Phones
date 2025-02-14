import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oruphones_assignment/data/models/product.dart';
import 'package:dartz/dartz.dart';
abstract class ApiService{
  Future<Either> fetchProducts(Map<String, dynamic> filters);
}

class ApiServiceImpl extends ApiService{
  static const String baseUrl = "http://40.90.224.241:5000";

  // Generate OTP
  // static Future<http.Response> generateOtp(int countryCode, int mobileNumber) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/login/otpCreate'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'countryCode': countryCode,
  //       'mobileNumber': mobileNumber,
  //     }),
  //   );
  //   return response;
  // }
  //
  // // Validate OTP
  // static Future<http.Response> validateOtp(int countryCode, int mobileNumber, int otp) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/login/otpValidate'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'countryCode': countryCode,
  //       'mobileNumber': mobileNumber,
  //       'otp': otp,
  //     }),
  //   );
  //   return response;
  // }

  @override
  Future<Either> fetchProducts(Map<String, dynamic> filters) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/filter'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(filters),
      );


      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody);
        final List<dynamic> productListJson = responseBody['data']['data'];

        List<ProductModel> productList =
        productListJson.map((json) => ProductModel.fromJson(json)).toList();

        return Right(productList);
      } else {
        return Left('Failed to load products');

      }
    }catch(e){
      return Left('An Error Occured');
    }

  }


}