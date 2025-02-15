import 'package:get_it/get_it.dart';
import 'package:oruphones_assignment/data/repository/auth.dart';
import 'package:oruphones_assignment/data/repository/products.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/domain/repository/auth.dart';
import 'package:oruphones_assignment/domain/repository/products_repository.dart';
import 'package:oruphones_assignment/domain/usecases/auth/generate_otp.dart';
import 'package:oruphones_assignment/domain/usecases/auth/get_CsrfToken.dart';
import 'package:oruphones_assignment/domain/usecases/auth/update_username.dart';
import 'package:oruphones_assignment/domain/usecases/auth/validate_otp.dart';
import 'package:oruphones_assignment/domain/usecases/products/fetch_products.dart';

final sL=GetIt.instance;

Future<void> initializeDependencies()async {

  sL.registerSingleton<ApiService>(ApiServiceImpl());
  sL.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  sL.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sL.registerSingleton<FetchProductsUseCase>(FetchProductsUseCase());
  sL.registerSingleton<GenerateOTPUseCase>(GenerateOTPUseCase());
  sL.registerSingleton<ValidateOTPUseCase>(ValidateOTPUseCase());
  sL.registerSingleton<GetScrfTokenUseCase>(GetScrfTokenUseCase());
  sL.registerSingleton<UpdateUserNameUseCase>(UpdateUserNameUseCase());


}
