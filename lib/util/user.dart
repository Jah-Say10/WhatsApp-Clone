import 'package:flutter/material.dart';

class User
{
  String name;
  String phoneNumber;
  String about;
  AssetImage? profilePicture;

  User({this.name = "", this.phoneNumber = "", this.about = "", this.profilePicture});
}

List<User> contacts =
[
  User(name: "Astou Seck", phoneNumber: "77 245 23 65", about: "I using WhatsApp", profilePicture: const AssetImage("")),
  User(name: "Saliou Dione", phoneNumber: "78 445 93 05", about: "I using WhatsApp", profilePicture: const AssetImage("")),
  User(name: "Issa Pouye", phoneNumber: "75 146 72 74", about: "I using WhatsApp", profilePicture: const AssetImage("")),
  User(name: "Awa Daf", phoneNumber: "76 248 30 85", about: "I using WhatsApp", profilePicture: const AssetImage("")),
  User(name: "Safiatou Sadji", phoneNumber: "70 925 49 01", about: "I using WhatsApp", profilePicture: const AssetImage(""))
];