
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones_assignment/core/configs/constants/status.dart';
import 'package:oruphones_assignment/data/models/user.dart';
import 'package:oruphones_assignment/data/sources/user_prefrences/user_prefrences.dart';
import 'package:oruphones_assignment/domain/usecases/auth/generate_otp.dart';
import 'package:oruphones_assignment/domain/usecases/auth/get_CsrfToken.dart';
import 'package:oruphones_assignment/domain/usecases/auth/update_username.dart';
import 'package:oruphones_assignment/domain/usecases/auth/validate_otp.dart';
import 'package:oruphones_assignment/presentation/auth/pages/name.dart';
import 'package:oruphones_assignment/presentation/home/bloc/home_bloc.dart';
import 'package:oruphones_assignment/service_locator.dart';

import '../../home/pages/home.dart';
import '../pages/verify_otp.dart';
import '../widgets/name_bottom_sheet.dart';
import '../widgets/verifiy_otp_bottom_sheet.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final UserPreferences userPreferences=UserPreferences();
  AuthBloc() : super(AuthState()){
    on<GenerateOTP>(_generateOTP);
    on<ValidateOTP>(_validateOTP);
    on<UpdateUserName>(_updateUserName);




  }
  void _generateOTP(GenerateOTP event,Emitter<AuthState> emit)async{
    emit(state.copyWith(mobileLoading: true));
    var result=await sL<GenerateOTPUseCase>().call(params: event.number);
    result.fold((l){
      ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(content: Text(l),backgroundColor: Colors.red,
            behavior: SnackBarBehavior.fixed, // Ensures it's fixed at the bottom
            duration: Duration(seconds: 3),));
      emit(state.copyWith(message: l,mobileLoading: false));
    }, (r){
      if(event.page){
        Navigator.push(event.context,
            MaterialPageRoute(builder: (_)=>VerifyOtpPage(mobile: event.number,)));

      }
      else{
        _showVerifyOTPBottomSheet(event.context,event.number);
        emit(state.copyWith(mobileLoading: false));
      }

      
    });
  }

  void _validateOTP(ValidateOTP event, Emitter<AuthState> emit) async {
    emit(state.copyWith(otpLoading: true));

    Map<String, dynamic> parms = {
      'Mobile': event.number,
      'OTP': event.otp,
    };

    var result = await sL<ValidateOTPUseCase>().call(params: parms);
    await result.fold(
          (l) async {
        emit(state.copyWith(message: l, otpLoading: false));
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(l),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.fixed,
            duration: Duration(seconds: 3),
          ),
        );
      },
          (r) async {
        UserModel user = r;
        await userPreferences.setLoginKey(true);
        await userPreferences.saveCookie(user.cookies);
        await userPreferences.saveUserName(user.userName);
        var result = await sL<GetScrfTokenUseCase>().call(params: user.cookies);
        await result.fold(
              (l) async {},
              (r) async {
                await userPreferences.saveCsrfToken(r);
               });

        event.context.read<HomeBloc>().add(FetchUser());

        if (user.userName == '') {
          if (event.page) {
            await Navigator.of(event.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => NamePage(cookie: user.cookies)),
                  (route) => false,
            );
          } else {
            Navigator.pop(event.context);
            Navigator.pop(event.context);
            _showNameBottomSheet(event.context, user.cookies);
          }
        } else {
          if (event.page) {
            await Navigator.of(event.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
            );
          } else {
            Navigator.pop(event.context);
            Navigator.pop(event.context);
          }
        }

        emit(state.copyWith(otpLoading: false));
      },
    );

    // Ensure no emit is called after handler completion
    emit(state.copyWith(mobileLoading: false));
  }

  void _updateUserName(UpdateUserName event, Emitter<AuthState> emit) async {
    print('update username called');
    emit(state.copyWith(nameLoading: true));
    String? cookie=await userPreferences.getCookie();
    print(cookie);

    var result = await sL<GetScrfTokenUseCase>().call(params: cookie);

    await result.fold(
          (l) async {
        emit(state.copyWith(message: l, nameLoading: false));
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(l),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.fixed,
            duration: Duration(seconds: 3),
          ),
        );
      },
          (r) async {

            print('csrf: $r');
        Map<String, dynamic> parms = {
          'Name': event.name,
          'csrfToken': r,
          'cookie':cookie
        };
        bool isNameUpdated = await sL<UpdateUserNameUseCase>().call(params: parms);

        if (isNameUpdated) {
          await userPreferences.saveUserName(event.name);
          if(event.page){
            Navigator.of(event.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,);
          }
          else{
            Navigator.pop(event.context);
          }

        } else {
          emit(state.copyWith(nameLoading: false));
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(
              content: Text("Couldn't update name"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.fixed,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
    );
     emit(state.copyWith(nameLoading: false));
  }

  void _showVerifyOTPBottomSheet(BuildContext context,int number) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))
        ),
        builder: (context) => VerifiyOtpBottomSheet(number: number,));
  }

  void _showNameBottomSheet(BuildContext context,String cookie){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))
        ),
        builder: (context)=>NameBottomSheet(cookie: cookie,));
  }
}
