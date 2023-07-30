import 'package:flutter/material.dart';
import 'package:whatsapp/util/search.dart';
import 'package:whatsapp/util/user.dart';
import "package:whatsapp/pages/chat.dart";

class ContactScreen extends StatefulWidget
{
  const ContactScreen({Key? key}) : super(key: key);
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Select contact"),
        backgroundColor: const Color.fromRGBO(27, 152, 82, 1),
        actions: <Widget>
        [
          IconButton(icon: const Icon(Icons.search), onPressed: () => {showSearch(context: context, delegate: MyDelegate())}),
          PopupMenuButton
          (
            itemBuilder: (context)
            {
              return
                [
                  const PopupMenuItem<int>(value: 1, child: Text("Invite a friend")),
                  const PopupMenuItem<int>(value: 2, child: Text("Contacts")),
                  const PopupMenuItem<int>(value: 3, child: Text("Refresh")),
                  const PopupMenuItem<int>(value: 4, child: Text("Help"))
                ];
            }
          )
        ],
      ),
      body: ListView.builder
      (
        itemCount: contacts.length,
        itemBuilder: (context, index)
        {
          return ListTile
          (
            leading: const CircleAvatar(backgroundColor: Colors.grey),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].about),
            onTap: ()
            {
              Navigator.push
              (
                context,
                MaterialPageRoute
                  (
                    builder: (context) => const ChatScreen(),
                    settings: RouteSettings(arguments: contacts[index].name)
                ),
              );
            }
          );
        }
      ),
    );
  }
}
