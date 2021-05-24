import 'package:firebase_database/firebase_database.dart';

class Contact {
  String _id;
  String _name;
  String _fatherName;
  String _phone;
  String _address;
  String _age;
  String _gender;
  String _medicine;

  Contact(this._name, this._fatherName, this._phone, this._address, this._age,
      this._gender, this._medicine);

  Contact.withId(this._id, this._name, this._fatherName, this._phone,
      this._address, this._age, this._gender, this._medicine);

  String get id => this._id;
  String get name => this._name;
  String get fatherName => this._fatherName;
  String get phone => this._phone;
  String get address => this._address;
  String get age => this._age;
  String get gender => this._gender;
  String get medicine => this._medicine;

  set name(String name) {
    this._name = name;
  }

  set fatherName(String fatherName) {
    this._fatherName = fatherName;
  }

  set phone(String phone) {
    this._phone = phone;
  }

  set address(String address) {
    this._address = address;
  }

  set age(String age) {
    this._age = age;
  }

  set gender(String gender) {
    this._gender = gender;
  }

  set bloodGroup(String bloodGroup) {
    this._medicine = medicine;
  }

  Contact.fromSnapshot(DataSnapshot snapshot) {
    this._id = snapshot.key;
    this._name = snapshot.value['name'];
    this._fatherName = snapshot.value['fatherName'];
    this._phone = snapshot.value['phone'];
    this._address = snapshot.value['address'];
    this._age = snapshot.value['age'];
    this._gender = snapshot.value['gender'];
    this._medicine = snapshot.value['medicine'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "fatherName": _fatherName,
      "phone": _phone,
      "address": _address,
      "age": _age,
      "gender": _gender,
      "medicine": _medicine
    };
  }
}
