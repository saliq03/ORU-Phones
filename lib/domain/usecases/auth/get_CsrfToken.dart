import 'package:dartz/dartz.dart';
import 'package:oruphones_assignment/domain/repository/auth.dart';
import 'package:oruphones_assignment/domain/usecases/usecase.dart';
import 'package:oruphones_assignment/service_locator.dart';

class GetScrfTokenUseCase implements UseCase<Either,String>{
  @override
  Future<Either> call({String? params}) async{
    return sL<AuthRepository>().getCsrfToken(params!);
  }

}