import 'package:oruphones_assignment/domain/repository/auth.dart';
import 'package:oruphones_assignment/domain/usecases/usecase.dart';
import 'package:oruphones_assignment/service_locator.dart';

class UpdateUserNameUseCase implements UseCase<bool,Map<String,dynamic>>{
  @override
  Future<bool> call({Map<String, dynamic>? params}) async{
    return await sL<AuthRepository>().
    updateUserName(countryCode: 91, userName: params!['Name'], csrfToken: params!['csrfToken'], cookie: params['cookie']);
  }

}