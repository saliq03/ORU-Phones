import 'package:dartz/dartz.dart';
import 'package:oruphones_assignment/domain/repository/auth.dart';
import 'package:oruphones_assignment/domain/usecases/usecase.dart';

import '../../../service_locator.dart';

class GenerateOTPUseCase implements UseCase<Either,int> {
  @override
  Future<Either> call({int? params}) async {
    return await sL<AuthRepository>().generateOtp(91, params!);
  }
}