import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:formviewer/models/user_data.dart';
import 'package:formviewer/providers/user_data_provider.dart';
import 'package:formviewer/utils/field_type_enum.dart';
import 'package:formviewer/utils/validation_locale_es.dart';
import 'package:formviewer/view/widgets/form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';

class DataForm extends StatefulWidget {
  const DataForm({super.key});

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  //key for accesing form state
  final _formKey = GlobalKey<FormState>();

  final locale = const LocaleEs();
  final rutRegExp = RegExp(r"^(\d{1,2}(?:\.\d{1,3}){2}-[\dkK])$");
  String rutMsg = "Ingrese un RUT válido, con puntos y guión";
  final fullNameRegExp = RegExp(
      r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)");
  String fullNameMsg =
      "Ingrese nombre válido y apellido válido, separados \npor un espacio";
  final notEmptyRegExp = RegExp(r"(.|\s)*\S(.|\s)*");
  String notEmptyMsg = "El campo es obligatorio";
  //final trimRegExp = RegExp(r"^[^\s]+(\s+[^\s]+)*$");
  //String trimMsg = "Hay espacios al inicio o al final del campo";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserDataProvider>(context, listen: false).userData =
          UserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: true);

    return Container(
      padding: EdgeInsets.all(screenHeight * 0.02),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            FormFieldWidget(
              labelText: 'Nombre y Apellido',
              icon: const Icon(Icons.person_rounded),
              validator: ValidationBuilder(locale: locale)
                  .required()
                  .regExp(notEmptyRegExp, notEmptyMsg)
                  .regExp(fullNameRegExp, fullNameMsg)
                  //.regExp(trimRegExp, trimMsg)
                  .build(),
              onSave: (field) => userDataProvider.setFullName(field),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            FormFieldWidget(
                labelText: 'RUT (con puntos y guión)',
                hintText: 'ej: XX.XXX.XXX-X',
                icon: const Icon(Icons.person_rounded),
                fieldType: FieldType.rut,
                validator: ValidationBuilder(locale: locale)
                    .required()
                    .regExp(rutRegExp, rutMsg)
                    .regExp(notEmptyRegExp, notEmptyMsg)
                    .build(),
                onSave: (field) => userDataProvider.setRut(field)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            FormFieldWidget(
                labelText: 'Correo Electrónico',
                icon: const Icon(Icons.email_rounded),
                validator: ValidationBuilder(locale: locale)
                    .required()
                    .regExp(notEmptyRegExp, notEmptyMsg)
                    //.regExp(trimRegExp, trimMsg)
                    .email()
                    .build(),
                onSave: (field) => userDataProvider.setEmail(field)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            FormFieldWidget(
                labelText: 'Dirección',
                icon: const Icon(Icons.home_rounded),
                validator: ValidationBuilder(locale: locale)
                    .required()
                    .regExp(notEmptyRegExp, notEmptyMsg)
                    //.regExp(trimRegExp, trimMsg)
                    .build(),
                onSave: (field) => userDataProvider.setAddress(field)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            FormFieldWidget(
                labelText: 'Teléfono',
                hintText: '9XXXXXXXX ',
                icon: const Icon(Icons.phone_rounded),
                fieldType: FieldType.phone,
                validator: ValidationBuilder(locale: locale)
                    .required()
                    .regExp(notEmptyRegExp, notEmptyMsg)
                    .minLength(9, "El número no tiene suficientes dígitos")
                    .maxLength(9, "El número tiene demasiados dígitos")
                    .phone()
                    .build(),
                onSave: (field) => userDataProvider.setTelephone(field)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!
                      .save(); //guardará todos los valores en el objeto de usuario
                  userDataProvider.userData?.printUserData();
                  GoRouter.of(context).pushReplacement("/result");
                }
                ;
              },
              child: const Text('GUARDAR'),
            )
          ],
        ),
      ),
    );
  }
}
