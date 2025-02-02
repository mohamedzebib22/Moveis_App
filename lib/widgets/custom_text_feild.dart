import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild(
      {super.key,
      required this.hintText,
      this.prefix,
      this.text,
      this.sufix,
      this.borderColor = Colors.yellow,
      this.maxLines = 1,
      this.onChanged,
      this.security = false,
      this.validator});

  MyValidator? validator;
  String hintText;
  String? text;
  Widget? prefix;
  Widget? sufix;
  
  Color? borderColor;
  int maxLines;
  bool security;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white,),
      obscureText: security,
      initialValue: text,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff282A28),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: prefix,
        suffixIcon: sufix,
        disabledBorder: makeAllBorder(color: Colors.grey, radius: 16),
        enabledBorder: makeAllBorder(color: borderColor!, radius: 16),
        focusedBorder:
            makeAllBorder(color: Colors.yellow, radius: 16),
        focusedErrorBorder:
            makeAllBorder(color: Colors.red, radius: 16),
        errorBorder: makeAllBorder(color: Colors.red, radius: 16),
      ),
      
    );
  }

  OutlineInputBorder makeAllBorder(
      {required Color color, required double radius}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(radius));
  }
}
