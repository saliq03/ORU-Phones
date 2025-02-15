import 'package:dartz/dartz.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/domain/repository/auth.dart';
import 'package:oruphones_assignment/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> generateOtp(int countryCode, int mobileNumber) async{
    return await sL<ApiService>().generateOtp(countryCode, mobileNumber);
  }

  @override
  Future<Either> validateOtp(int countryCode, int mobileNumber, int otp) async{
    return await sL<ApiService>().validateOtp(countryCode, mobileNumber, otp);
  }

  @override
  Future<Either> getCsrfToken(String cookie) async{
   return await sL<ApiService>().getCsrfToken(cookie);
  }

  @override
  Future<bool> updateUserName({required int countryCode, required String userName, required String csrfToken,required String cookie}) async{
    return sL<ApiService>().updateUserName(countryCode: countryCode, userName: userName, csrfToken: csrfToken, cookie: cookie);
  }
  
}