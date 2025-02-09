import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme{
  static final lightTheme=ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffCCCCCC)),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(

              borderSide: const BorderSide(
                  color: Color(0xffCCCCCC),
                  width: 1
              )
          ),
          enabledBorder:  OutlineInputBorder(

              borderSide: const BorderSide(
                  color: Color(0xffCCCCCC),
                  width: 1
              )
          ),
          focusedBorder: OutlineInputBorder(

              borderSide: const BorderSide(
                  color: Color(0xffCCCCCC),
                  width: 1
              )
          ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ))
      ),

      checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // Optional: rounded corners
              side: BorderSide(
                  color: Color(0xFFABABAB), // Border color
                  width: 1, // Border weight
              ),
          ),
      ),
  );

}