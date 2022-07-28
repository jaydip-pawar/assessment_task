import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: DropDownTextField(
        dropDownList: gender,
        clearOption: false,
        dropDownItemCount: 3,
        textFieldDecoration: const InputDecoration(
          labelText: "Gender",
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
