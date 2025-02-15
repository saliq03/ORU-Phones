part of 'auth_bloc.dart';

 class AuthState extends Equatable{
   final bool mobileLoading,otpLoading,nameLoading;
   final String message;
   final Status mobileStatus;

   const AuthState({
     this.mobileLoading=false,
     this.otpLoading=false,
     this.nameLoading=false,
     this.message='',
     this.mobileStatus=Status.loading
 });

   AuthState copyWith({bool? mobileLoading, bool? otpLoading, bool? nameLoading,String? message,Status? mobileStatus }){
     return AuthState(
       mobileLoading: mobileLoading??this.mobileLoading,
       otpLoading: otpLoading?? this.otpLoading,
       nameLoading: nameLoading?? this.nameLoading,
       message: message?? this.message,
       mobileStatus: mobileStatus?? this.mobileStatus
     );
   }
  @override
  List<Object?> get props => [mobileLoading,otpLoading,nameLoading,message,mobileStatus];
}


