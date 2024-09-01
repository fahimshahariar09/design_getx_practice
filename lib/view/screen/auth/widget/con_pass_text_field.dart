import 'package:flutter/material.dart';

class ConPassTextField extends StatelessWidget {
  const ConPassTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        labelText: "Con-Password",
      ),
      validator: (value){
        if(value =='' ||value ==null){
          return "con_pass can't be empty";
        }
        return null;
      },
    );
  }
}
