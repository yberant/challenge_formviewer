import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:formviewer/models/user_data.dart';

class UserDataProvider extends ChangeNotifier {
  UserData? userData;

  void setFullName(fullName) {
    print("settingFullName");
    userData?.setFullName(fullName);
  }

  void setRut(rut) {
    userData?.setRut(rut);
  }

  void setEmail(email) {
    userData?.setEmail(email);
  }

  void setAddress(address) {
    userData?.setAddress(address);
  }

  void setTelephone(telephone) {
    userData?.setTelephone(telephone);
  }
}
