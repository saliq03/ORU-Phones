import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones_assignment/presentation/auth/bloc/auth_bloc.dart';

import '../../../common/buttons/basic_app_button.dart';
import 'bottom_sheet_appbar.dart';

class NameBottomSheet extends StatefulWidget {
  const NameBottomSheet({super.key,required this.cookie});
final String cookie;
  @override
  State<NameBottomSheet> createState() => _NameBottomSheetState();
}

class _NameBottomSheetState extends State<NameBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller=TextEditingController();

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10,
          bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetAppbar(title: "Sign Up To Continue", hideBack: true,),
            Divider(),
            SizedBox(height: 40),
            nameField(),

            SizedBox(height: 40),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return BasicAppButton(title: "Confirm Name", onPress: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                        UpdateUserName(name: controller.text, context: context, cookie: widget.cookie, page: false));
                  }
                }, icon: Icons.arrow_forward_rounded,);
              },
            ),

            SizedBox(height: 30,)
          ],
        ),
      ),);
  }

  Widget nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Please Tell Us Your Name ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff282828), // Your original color
              ),
            ),
            TextSpan(
              text: "*",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Red asterisk
              ),
            ),
          ],
          ),
        ),

        SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Name",

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your name";
            }
            return null; // Valid input
          },
        )
      ],
    );
  }

}
