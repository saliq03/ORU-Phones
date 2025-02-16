import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/data/sources/user_prefrences/user_prefrences.dart';

class FloatingButtonHome extends StatelessWidget {
  const FloatingButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0), // Bottom padding
      child: SizedBox(
        width: 105,
        height: 51,
        child: FloatingActionButton(
          onPressed: () {
            UserPreferences().removeUser();
          },
          backgroundColor: Color(0xff363636),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(44),
              side: BorderSide(
                  color: Color(0xffF6C018),
                  width: 4
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sell",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:  Color(0xffF6C018)),),
              Icon(Icons.add,color:  Color(0xffF6C018),)
            ],), // Custom icon
        ),
      ),
    );
  }
}
