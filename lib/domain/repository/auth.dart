import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> generateOtp(int countryCode, int mobileNumber);
  Future<Either> validateOtp(int countryCode, int mobileNumber, int otp);
  Future<Either> getCsrfToken(String cookie);
  Future<bool> updateUserName({required int countryCode, required String userName, required String csrfToken,required String cookie});

}