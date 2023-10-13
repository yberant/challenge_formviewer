//import 'package:extended_phone_number_input/phone_number_input.dart';
//import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:formviewer/utils/field_type_enum.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final Widget icon;
  final FieldType fieldType;
  final String? Function(String?)? validator;
  final void Function(String?) onSave; //will update values to the provider

  const FormFieldWidget(
      {super.key,
      required this.labelText,
      required this.icon,
      this.validator,
      this.hintText,
      this.fieldType = FieldType.normal,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        width: screenWidth * 0.9,
        margin: EdgeInsets.only(bottom: screenHeight * 0.017),
        child: fieldType == FieldType.phone
            ? TextFormField(
                validator: validator,
                keyboardType: TextInputType.number,
                onSaved: onSave,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: labelText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: hintText,
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixIcon: Container(
                      width: screenWidth * 0.15,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          icon,
                          const Text("+56",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16))
                        ],
                      ),
                    )),
              )
            : TextFormField(
                validator: validator,
                onSaved: onSave,
                keyboardType: fieldType == FieldType.rut
                    ? TextInputType.number
                    : TextInputType.text,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: labelText,
                  labelStyle: const TextStyle(fontSize: 20),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: icon,
                  errorStyle: TextStyle(height: 0),
                )));
  }
}
