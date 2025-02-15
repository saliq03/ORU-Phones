import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/bottom_sheet_appbar.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/verifiy_otp_bottom_sheet.dart';

import '../../../common/buttons/basic_app_button.dart';

class LoginMobileBottomSheet extends StatefulWidget {
  LoginMobileBottomSheet({super.key});

  @override
  State<LoginMobileBottomSheet> createState() => _LoginMobileBottomSheetState();
}

class _LoginMobileBottomSheetState extends State<LoginMobileBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    return  Padding(
                padding: EdgeInsets.only(left: 10,right:10 ,top: 10,
                bottom:MediaQuery.of(context).viewInsets.bottom ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BottomSheetAppbar(title: "Sign In To Continue",hideBack: true,),
                      Divider(),
                      SizedBox(height: 20),
                      phoneField(),
                      SizedBox(height: 10),
                      termsAndConditionsWidget(),
                      SizedBox(height: 10),
                      BasicAppButton(
                        title: "Next",
                        onPress: () {
                          _showVerifyOTPBottomSheet(context);
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                          }
                        },
                        icon: Icons.arrow_forward_rounded,
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),);
  }

  Widget phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Your Phone Number",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff282828),
          ),
        ),
        TextFormField(

          keyboardType: TextInputType.phone,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            hintText: "Mobile Number",
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 10),
              child: Text(
                "+91",
                style: TextStyle(
                  color: Color(0xFF757474),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your mobile number";
            } else if (value.length != 10) {
              return "Mobile number must be 10 digits";
            } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
              return "Enter a valid 10-digit mobile number";
            }
            return null; // Valid input
          },
        ),
      ],
    );
  }

  Widget termsAndConditionsWidget() {
    bool checkboxvalue = true;
    return Row(
      children: [
        Checkbox(
          value: checkboxvalue,
          onChanged: (value) {
            checkboxvalue = value!;
          },
        ),
        SizedBox(width: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Accept",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 4),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Terms and Condition",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showVerifyOTPBottomSheet(BuildContext context){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))
        ),
        builder: (context)=>VerifiyOtpBottomSheet());
  }
}
