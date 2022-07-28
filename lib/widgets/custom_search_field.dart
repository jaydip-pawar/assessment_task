import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) callback;
  final String label;
  const CustomSearchField({Key? key, required this.controller, required this.callback, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        onChanged: callback,
        decoration: InputDecoration(
            labelText: label,
            fillColor: Colors.white,
            labelStyle: const TextStyle(color: Colors.grey),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey,)
        ),
      ),
    );
  }
}
