import 'package:flutter/material.dart';
import "package:whatsapp/pages/loading.dart";
import "package:whatsapp/pages/home.dart";
import "package:whatsapp/pages/contact.dart";
import "package:whatsapp/pages/setting.dart";
import "package:whatsapp/pages/chat.dart";

void main()
{
  runApp
  (
    MaterialApp
    (
      initialRoute: "/home",
      routes:
      {
        "/": (context) => const LoadingScreen(),
        "/home": (context) => const HomeScreen(),
        "/contact": (context) => const ContactScreen(),
        "/chat": (context) => const ChatScreen(),
        "/setting": (context) => const SettingScreen()
      }
    )
  );
}

