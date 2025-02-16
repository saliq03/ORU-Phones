import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oruphones_assignment/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:oruphones_assignment/data/sources/user_prefrences/user_prefrences.dart';
import 'package:oruphones_assignment/service_locator.dart';

import '../models/user.dart';
abstract class ApiService{
  Future<Either> fetchProducts(Map<String, dynamic> filters);
  Future<Either> generateOtp(int countryCode, int mobileNumber);
  Future<Either> validateOtp(int countryCode, int mobileNumber, int otp);
  Future<Either> getCsrfToken(String cookie);
  Future<bool> updateUserName({required int countryCode, required String userName, required String csrfToken,required String cookie});
  Future<bool> toggleFavorite(String listingId,bool isFav,);
  Future<List<String>> fetchUserFavorites();
}

class ApiServiceImpl extends ApiService{
  final UserPreferences userPreferences=UserPreferences();
  static const String baseUrl = "http://40.90.224.241:5000";

  @override
   Future<Either> generateOtp(int countryCode, int mobileNumber) async {
    try{


     final response = await http.post(
      Uri.parse('$baseUrl/login/otpCreate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
      }),
    );
    if(response.statusCode==200){
      final decodedResponse = jsonDecode(response.body);
      String mobileNumber = decodedResponse['dataObject']['mobileNumber'];
      print("Mobile Number: ${mobileNumber.replaceFirst('91','')}");

      return Right(mobileNumber.replaceFirst('91',''));
    }
    else{
      print(response.statusCode.toString());
      return Left("Something went wrong");
    }
    }catch(e){
      return Left("An error occurred");
    }
  }
  @override
   Future<Either> validateOtp(int countryCode, int mobileNumber, int otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/otpValidate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
        'otp': otp,
      }),
    );
    if(response.statusCode==200){
      final decodedResponse = jsonDecode(response.body);
      final cookies = response.headers['set-cookie'];

      UserModel user = UserModel.fromJson(decodedResponse,cookies);
      return Right(user);
    }
    else{
      print(response.statusCode.toString());
      return Left("Something went wrong");
    }

  }

  @override
  Future<Either> getCsrfToken(String cookie) async {
    final url = Uri.parse('$baseUrl/isLoggedIn');
    final response = await http.get(
      url,
      headers: {
        'Cookie': cookie, // Include the stored cookies here
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['isLoggedIn'] == true) {
        final csrfToken = responseData['csrfToken'];
        return Right(csrfToken);
      } else {
        return Left("User is not logged in");
      }
    } else {
      throw Left('Failed to fetch CSRF token: ${response.statusCode}');
    }
  }
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


  @override
   Future<bool> updateUserName({required int countryCode, required String userName, required String csrfToken,required String cookie}) async {
    try {
      final Map<String, dynamic> requestBody = {
        "countryCode": 91,
        "userName": userName,
      };

      final response = await http.post(
        Uri.parse('$baseUrl/update'),
        headers: {
          'Content-Type': 'application/json',
          'X-Csrf-Token': csrfToken,
          'Cookie': cookie,
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        // Successfully updated the user name
        print('User name updated successfully.');
        print(response.body);
        return true;
      } else {
        // Handle errors
        print('Failed to update user name. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  Future<bool> toggleFavorite(String listingId,bool isFav,) async
  {
    String? csrfToken=await userPreferences.getCsrfToken();
    String? cookie=await userPreferences.getCookie();
    print(csrfToken);
  try {
  final response = await http.post(
  Uri.parse('$baseUrl/favs'),
  headers: {
  'Content-Type': 'application/json',
  'X-Csrf-Token': csrfToken!,
    'Cookie': cookie!,// Add CSRF token for authentication
  },
  body: jsonEncode({
  'listingId': listingId,
  'isFav': isFav,
  }),
  );

  if (response.statusCode == 200) {

  print('Favorite status updated successfully.');
  print(response.body);
  return true;
  } else {
  // Handle errors
  print('Failed to update favorite status. Status code: ${response.statusCode}');
  print('Response body: ${response.body}');
  return false;
  }
  } catch (e) {
  print('Error: $e');
  return false;
  }
  }

  @override
  Future<List<String>> fetchUserFavorites() async
  {
    String? csrfToken=await userPreferences.getCsrfToken();
    String? cookie=await userPreferences.getCookie();
  try {
  final response = await http.get(
    Uri.parse('$baseUrl/favs'),
  headers: {
    'X-Csrf-Token': csrfToken!,
    // 'Cookie': cookie!
  },
  );

  if (response.statusCode == 200) {
  // Decode the response body
  final data = jsonDecode(response.body);
  print(data);

  // Print the JSON response for debugging
  print('Favorites API Response:');
  print(jsonEncode(data));

  // Return the list of favorite products
  return data['data'] ?? [];
  } else {
  // Handle errors
  print('Failed to fetch favorites. Status code: ${response.statusCode}');
  print('Response body: ${response.body}');
  return [];
  }
  } catch (e) {
  print('Error: $e');
  return [];
  }
  }


}