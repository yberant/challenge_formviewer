class UserData {
  String? rut;
  String? fullName;
  String? email;
  String? address;
  String? telephone;

  void setRut(rut) => this.rut = rut;
  String? getRut() => rut;
  void setFullName(fullName) => this.fullName = fullName;
  String? getFullName() => fullName;
  void setEmail(email) => this.email = email;
  String? getEmail() => email;
  void setAddress(address) => this.address = address;
  String? getAddress(address) => address;
  void setTelephone(telephone) => this.telephone = telephone;
  String? getTelephone(telephone) => telephone;

  void printUserData() {
    print(
        "rut: $rut, fullName: $fullName, email: $email, address: $address, telephone: $telephone");
  }
}
