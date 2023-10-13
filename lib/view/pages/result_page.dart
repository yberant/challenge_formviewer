import 'package:flutter/material.dart';
import 'package:formviewer/providers/user_data_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final displayTextStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "RESULTADO",
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.07,
              ),
              Container(
                //height: screenHeight * 0.65,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 165, 196, 211),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nombre y Apellido"),
                      Text(
                        "${userDataProvider.userData?.fullName?.toUpperCase()}",
                        style: displayTextStyle,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text("RUT"),
                      Text(
                        "${userDataProvider.userData?.rut}",
                        style: displayTextStyle,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text("Correo Electrónico"),
                      Text(
                        "${userDataProvider.userData?.email}",
                        style: displayTextStyle,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text("Dirección"),
                      Text(
                        "${userDataProvider.userData?.address}",
                        style: displayTextStyle,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text("Teléfono"),
                      Text(
                        "+56 ${userDataProvider.userData?.telephone}",
                        style: displayTextStyle,
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).pushReplacement("/home");
                              //userDataProvider.userData?.printUserData();
                            },
                            child: const Text('ACEPTAR'),
                          ))
                    ]),
              )
            ],
          ),
        ));
  }
}
