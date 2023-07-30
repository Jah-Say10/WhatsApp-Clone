import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget
{
  const SettingScreen({Key? key}) : super(key: key);
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Settings"),
        backgroundColor: const Color.fromRGBO(27, 152, 82, 1),
      ),
      body: Column
      (
        children: <Widget>
        [
          Container
          (
            padding: const EdgeInsets.all(2),
            child: ListTile
            (
              leading: const CircleAvatar(backgroundColor: Colors.grey, radius: 32),
              title: const Text("Malick DIOUF", style: TextStyle(fontSize: 22)),
              subtitle: const Text("The boss Serere"),
              trailing: IconButton(icon: const Icon(Icons.qr_code, color: Color.fromRGBO(27, 152, 82, 1)), onPressed: () {}),
              onTap: () {},
            ),
          ),
          const Divider(height: 8, color: Colors.grey),
          Column
          (
            children: <Widget>
            [
              ListTile
              (
                leading: const Icon(Icons.key, color: Color.fromRGBO(27, 152, 82, 1)),
                title: const Text("Account"),
                subtitle: const Text("Privacy, Security, Chance number"),
                onTap: () {},
              ),
              ListTile
              (
                leading: const Icon(Icons.message, color: Color.fromRGBO(27, 152, 82, 1)),
                title: const Text("Chats"),
                subtitle: const Text("Theme, wallpapers, chat histoty"),
                onTap: () {},
              ),
              ListTile
              (
                leading: const Icon(Icons.notifications, color: Color.fromRGBO(27, 152, 82, 1)),
                title: const Text("Notifications"),
                subtitle: const Text("Message, group & call tones"),
                onTap: () {},
              ),
              ListTile
              (
                leading: const Icon(Icons.circle_outlined, color: Color.fromRGBO(27, 152, 82, 1)),
                title: const Text("Storage and data"),
                subtitle: const Text("Network usage, auto-download"),
                onTap: () {},
              ),
              ListTile
              (
                leading: const Icon(Icons.help_outline, color: Color.fromRGBO(27, 152, 82, 1)),
                title: const Text("Help"),
                subtitle: const Text("Help center, contact us, privacy policy"),
                onTap: () {},
              ),
              ListTile
              (
                leading: const Icon(Icons.group, color: Color.fromRGBO(27, 152, 82, 1)),
                title: const Text("Invite a friend"),
                onTap: () {},
              ),
              const Center
              (
                child: Icon(Icons.whatsapp, color: Color.fromRGBO(27, 152, 82, 1)),
              )
            ],
          )
        ],
      )
    );
  }
}
