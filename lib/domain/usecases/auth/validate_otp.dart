import 'package:dartz/dartz.dart';

import '../../../service_locator.dart';
import '../../repository/auth.dart';
import '../usecase.dart';

class ValidateOTPUseCase implements UseCase<Either,Map<String,dynamic>> {
  @override
  Future<Either> call({Map<String,dynamic>? params}) async {
    return await sL<AuthRepository>().validateOtp(91, params!['Mobile'], params!['OTP']);
  }
}