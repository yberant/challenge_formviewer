import 'package:flutter/material.dart';
import 'package:formviewer/view/widgets/data_form.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
            "FORMULARIO",
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [DataForm()]),
      ),
    );
  }
}
