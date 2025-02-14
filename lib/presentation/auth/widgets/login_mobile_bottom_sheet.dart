import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/bottom_sheet_appbar.dart';

import '../../../common/buttons/basic_app_button.dart';


class LoginMobileBottomSheet extends StatelessWidget {
  LoginMobileBottomSheet({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7, // Initial height of the bottom sheet
      minChildSize: 0.3, // Minimum height of the bottom sheet
      maxChildSize: 1, // Maximum height of the bottom sheet
      expand: false, // Ensures the bottom sheet only expands as needed
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BottomSheetAppbar(title: "Sign In To Continue"),
                  Divider(),
                  SizedBox(height: 20),
                  phoneField(),
                  SizedBox(height: 10),
                  termsAndConditionsWidget(),
                  SizedBox(height: 10),
                  BasicAppButton(
                    title: "Next",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                      }
                    },
                    icon: Icons.arrow_forward_rounded,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
              padding: const EdgeInsets.only(
                  left: 15, top: 15, bottom: 15, right: 10),
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
    bool checkboxvalue = false;
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
}
