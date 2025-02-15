import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/name_bottom_sheet.dart';
import 'package:pinput/pinput.dart';

import '../../../common/buttons/basic_app_button.dart';
import 'bottom_sheet_appbar.dart';

class VerifiyOtpBottomSheet extends StatefulWidget {
  const VerifiyOtpBottomSheet({super.key});

  @override
  State<VerifiyOtpBottomSheet> createState() => _VerifiyOtpBottomSheetState();
}

class _VerifiyOtpBottomSheetState extends State<VerifiyOtpBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.only(left: 10,right:10 ,top: 10,
          bottom:MediaQuery.of(context).viewInsets.bottom ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetAppbar(title: "Verify OTP",),
            Divider(color: Colors.grey,),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Please enter the 4 digit verification code sent\nto your mobile number ",
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "+91-7587329682",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: " via ",
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "SMS",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Pinput(
              length: 4,
              validator: (value){

              },
              defaultPinTheme: PinTheme(
                width: 42,
                height: 44,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                decoration: BoxDecoration(
                  color: Colors.transparent, // ✅ Background transparent
                  border: Border.all(color: Color(0xffCCCCCC)), // Border color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
            ),
            SizedBox(height: 30),
            resendOptWidget(),
            SizedBox(height: 20),
            BasicAppButton(title: "Verify OTP", onPress: (){
             Navigator.pop(context);
             Navigator.pop(context);
             _showNameBottomSheet(context);
            }),
            SizedBox(height: 30,)
          ],
        ),
      ),);
  }

  Widget resendOptWidget(){
    return Column(
      children: [
        Text("Didn’t receive OTP?",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff757474)),),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Resend OTP",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor:Color(0xff191919),
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff191919)
                ),
              ),
            ),
            SizedBox(width: 4),
            Text("in 0:23 Sec",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff191919)),),


          ],
        ),      ],
    );
  }

  void _showNameBottomSheet(BuildContext context){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))
        ),
        builder: (context)=>NameBottomSheet());
  }
}
