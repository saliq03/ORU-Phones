part of 'auth_bloc.dart';

 class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];

 }
 class GenerateOTP extends AuthEvent{
   final int number;
   final BuildContext context;
   final bool page;
  GenerateOTP({required this.number,required this.context,required this.page});

   @override
   List<Object?> get props => [number,context,page];

 }
class ValidateOTP extends AuthEvent{
  final int number,otp;
  final BuildContext context;
  final bool page;
  ValidateOTP({required this.number,required this.context,required this.page,required this.otp});

  @override
  List<Object?> get props => [number,context,page,otp];

}

class UpdateUserName extends AuthEvent{
   final String name;
   final BuildContext context;
   final String cookie;
   final bool page;

  UpdateUserName({required this.name,required this.context,required this.cookie,required this.page});

   @override
   List<Object?> get props => [name,context,cookie,page];

}
