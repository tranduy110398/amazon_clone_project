import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextfield(
      {super.key, required this.controller, required this.hintText});
  // The constructor that requires the controller to be passed
  // when creating the CustomTextfield widget.
  @override
  Widget build(BuildContext context) {
    return Padding(
      // To ensure the TextFormField is not too close to the edge of the
      // smartphone screen, you can wrap it in a Padding or Container widget and
      // add padding. This will add space between the TextFormField and the edge of the screen.
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          hintText: hintText,
        ),
        validator: (val) {
          return null;
        },
      ),
    );
  }
}
