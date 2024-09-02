import 'package:flutter/material.dart';
import 'package:test1/Home/app_colors.dart';

typedef myvalidator =String? Function(String?);

class CustomTextFormFiled extends StatelessWidget {

  String label;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  myvalidator myValidator;

  CustomTextFormFiled({required this.label,required this.controller
  ,this.keyboardType=TextInputType.text,this.obscureText =false
  ,required this.myValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
      decoration: InputDecoration(
          labelText:label,
      border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Appcolors.primarycolor
            )
          ),
      focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
            color: Appcolors.primarycolor
          )
        ),
      errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: Appcolors.primarycolor
      ),
     ),
      focusedErrorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
      color: Appcolors.primarycolor
     ),
    ),
        errorMaxLines: 2
    ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: myValidator,
   )
  );
 }
}
