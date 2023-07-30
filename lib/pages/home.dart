import 'package:flutter/material.dart';
import 'package:whatsapp/util/search.dart';
import 'package:whatsapp/util/user.dart';
import "package:whatsapp/pages/chat.dart";

class HomeScreen extends StatefulWidget
{
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  IconData homeScreenFloatingBtnIcon = Icons.message;
  int btnPressedIndex = 1;

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController
    (
      initialIndex: 1,
      length: 4,
      child: Scaffold
      (
        appBar: AppBar
        (
          title: const Text("WhatsApp"),
          backgroundColor: const Color.fromRGBO(27, 152, 82, 1),
          automaticallyImplyLeading: false, // Get rid of the route left arrow
          actions: <Widget>
          [
            IconButton(icon: const Icon(Icons.search), onPressed: () => {showSearch(context: context, delegate: MyDelegate())}),
            PopupMenuButton
            (
              itemBuilder: (context)
              {
                return
                [
                  const PopupMenuItem<int>(value: 1, child: Text("New Group")),
                  const PopupMenuItem<int>(value: 2, child: Text("New Broadcast")),
                  const PopupMenuItem<int>(value: 3, child: Text("Linked Device")),
                  const PopupMenuItem<int>(value: 4, child: Text("Starred Messages")),
                  const PopupMenuItem<int>(value: 5, child: Text("Settings"))
                ];
              },
              onSelected: (value) =>
              {
                if(value == 1)
                {

                }
                else if(value == 2)
                {

                }
                else if(value == 3)
                {

                }
                else if(value == 4)
                {

                }
                else
                {
                  Navigator.pushNamed(context, "/setting")
                }
              },
            )
          ],
          // The tab bar
          bottom: TabBar
          (
            tabs: const <Widget>
            [
              Tab(icon: Icon(Icons.camera_alt_rounded)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS")
            ],
            indicatorColor: Colors.grey[200],
            indicatorWeight: 4.0,
            onTap: (value) =>
            {
              if(value == 0)
              {

              }
              else if(value == 1)
              {
                setState(()
                {
                  homeScreenFloatingBtnIcon = Icons.message;
                  btnPressedIndex = value;
                })
              }
              else if(value == 2)
              {
                setState(()
                {
                  homeScreenFloatingBtnIcon = Icons.camera_alt_rounded;
                  btnPressedIndex = value;
                })
              }
              else
              {
                setState(()
                {
                  homeScreenFloatingBtnIcon = Icons.add_call;
                  btnPressedIndex = value;
                })
              }
            },
          )
        ),

        body: TabBarView
        (
          children: <Widget>
          [
            const Center(child: Text("Take a picture")),
            ListView.builder
            (
              itemCount: contacts.length,
              itemBuilder: (context, index)
              {
                return Column
                (
                  children:
                  [
                    ListTile
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
                    ),
                    const Divider(height: 4)
                  ],
                );
              }
            ),
            const Center(child: Text("STATUS")),
            const Center(child: Text("CALLS"))
          ],
        ),

        floatingActionButton: FloatingActionButton
        (
          onPressed: ()
          {
            if(btnPressedIndex == 1)
            {
              Navigator.pushNamed(context, "/contact");
            }
          },
          backgroundColor: const Color.fromRGBO(27, 152, 82, 1),
          child: Icon(homeScreenFloatingBtnIcon),
        )
      )
    );
  }
}