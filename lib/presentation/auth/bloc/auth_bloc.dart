
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/core/configs/constants/status.dart';
import 'package:oruphones_assignment/data/models/user.dart';
import 'package:oruphones_assignment/domain/usecases/auth/generate_otp.dart';
import 'package:oruphones_assignment/domain/usecases/auth/get_CsrfToken.dart';
import 'package:oruphones_assignment/domain/usecases/auth/update_username.dart';
import 'package:oruphones_assignment/domain/usecases/auth/validate_otp.dart';
import 'package:oruphones_assignment/presentation/auth/pages/name.dart';
import 'package:oruphones_assignment/service_locator.dart';

import '../../home/pages/home.dart';
import '../pages/verify_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
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
        emit(state.copyWith(mobileLoading: false));
      }

      
    });
  }

  void _validateOTP(ValidateOTP event,Emitter<AuthState> emit)async{
    emit(state.copyWith(otpLoading: true));
    Map<String,dynamic> parms={
      'Mobile':event.number,
      'OTP':event.otp
      };
    var result=await sL<ValidateOTPUseCase>().call(params: parms);
    result.fold((l){
      emit(state.copyWith(message: l,otpLoading: false));
      ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(content: Text(l),backgroundColor: Colors.red,
            behavior: SnackBarBehavior.fixed, // Ensures it's fixed at the bottom
            duration: Duration(seconds: 3),));
    }, (r){
      if(event.page){
        UserModel user=r;
        if(user.userName==''){// new user
          Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => NamePage(cookie: user.cookies,),
            ),
                (route) => false,
          );
        }
        else{
          Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
                (route) => false,
          );
        }
        emit(state.copyWith(otpLoading: false));
      }


    });
  }

  void _updateUserName(UpdateUserName event, Emitter<AuthState> emit) async {
    print('update username called');
    emit(state.copyWith(nameLoading: true));

    var result = await sL<GetScrfTokenUseCase>().call(params: event.cookie);

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
          'cookie':event.cookie
        };
        bool isNameUpdated = await sL<UpdateUserNameUseCase>().call(params: parms);

        if (isNameUpdated) {
          Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
          );
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
  }

}
