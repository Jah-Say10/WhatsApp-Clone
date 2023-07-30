import 'package:flutter/material.dart';
import 'package:whatsapp/util/user.dart';

class ChatScreen extends StatefulWidget
{
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
{
  // Index
  int cIndex = 0;

  // User message
  TextEditingController userMessage = TextEditingController();

  // Icons
  IconData textFieldIcon1 = Icons.emoji_emotions;
  IconData? textFieldIcon2 = Icons.attach_file;
  IconData textFieldIcon3 = Icons.camera_alt_rounded;
  IconData textFieldIcon4 = Icons.mic;
  int iconSendTracker = 0;

  // The chat
  List<Card> chat = [];

  @override
  Widget build(BuildContext context)
  {
    // Get the user name from last route
    String userName = (ModalRoute.of(context)!.settings.arguments as String);

    return Scaffold
    (
      backgroundColor: Colors.grey[400],

      appBar: AppBar
      (
        title: Row
        (
          children:
          [
            const CircleAvatar(backgroundColor: Colors.grey),
            const SizedBox(width: 10),
            Text(userName)
          ],
        ),
        backgroundColor: const Color.fromRGBO(27, 152, 82, 1),
        actions: <Widget>
        [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () => { }),
          IconButton(icon: const Icon(Icons.call), onPressed: () => { }),
          PopupMenuButton
          (
            itemBuilder: (context)
            {
              return
              [
                const PopupMenuItem<int>(value: 1, child: Text("View contact")),
                const PopupMenuItem<int>(value: 2, child: Text("Media, links and docs")),
                const PopupMenuItem<int>(value: 3, child: Text("Search")),
                const PopupMenuItem<int>(value: 1, child: Text("Mute notifications")),
                const PopupMenuItem<int>(value: 2, child: Text("Disappearing messages")),
                const PopupMenuItem<int>(value: 3, child: Text("Wallpaper")),
                const PopupMenuItem<int>(value: 4, child: Text("More"))
              ];
            },
          )
        ],
      ),

      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>
        [
          SizedBox
          (
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.end,
                children: chat
              ),
            ),
          ),
          const Divider(height: 20),
          Row
          (
            children:
            [
              SizedBox
              (
                width: MediaQuery.of(context).size.width - 55,
                child: Card
                (
                  margin: const EdgeInsets.fromLTRB(4, 0, 8, 4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                  child: TextField
                  (
                    controller: userMessage,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration
                    (
                      border: InputBorder.none,
                      hintText: "Message...",
                      prefixIcon: IconButton(onPressed: () {}, icon: Icon(textFieldIcon1, color: Colors.grey)),
                      suffixIcon: Row
                      (
                        mainAxisSize: MainAxisSize.min,
                        children:
                        [
                          IconButton(onPressed: () {}, icon: Icon(textFieldIcon2, color: Colors.grey)),
                          IconButton(onPressed: () {}, icon: Icon(textFieldIcon3, color: Colors.grey)),
                        ],
                      )
                    ),
                    onChanged: (textValue)
                    {
                      if(textValue.isEmpty)
                      {
                        setState(()
                        {
                          textFieldIcon2 = Icons.attach_file;
                          textFieldIcon3 = Icons.camera_alt_rounded;
                          textFieldIcon4 = Icons.mic;
                          iconSendTracker = 0;
                        });
                      }
                      else
                      {
                        setState(()
                        {
                          textFieldIcon2 = null;
                          textFieldIcon4 = Icons.send;
                          textFieldIcon3 = Icons.attach_file;
                          iconSendTracker = 1;
                        });
                      }
                    },
                    onSubmitted: (textValue)
                    {
                      setState(()
                      {
                        chat.add
                        (
                          Card
                          (
                            color: Colors.lightGreenAccent[200],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Padding
                            (
                              padding: const EdgeInsets.all(8.0),
                              child: Text(textValue, style: const TextStyle(fontSize: 16)),
                            )
                          )
                        );
                        userMessage.clear();

                        // Set icons
                        textFieldIcon2 = Icons.attach_file;
                        textFieldIcon3 = Icons.camera_alt_rounded;
                        textFieldIcon4 = Icons.mic;
                      });
                    },
                  ),
                ),
              ),
              CircleAvatar
              (
                backgroundColor: const Color.fromRGBO(27, 152, 82, 1),
                child: IconButton(onPressed: ()
                {
                  setState(()
                  {
                    if(iconSendTracker == 1)
                    {
                      chat.add
                        (
                          Card
                            (
                              color: Colors.lightGreenAccent[200],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding
                                (
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userMessage.text, style: const TextStyle(fontSize: 16)),
                              )
                          )
                      );
                      userMessage.clear();

                      // Set icons
                      textFieldIcon2 = Icons.attach_file;
                      textFieldIcon3 = Icons.camera_alt_rounded;
                      textFieldIcon4 = Icons.mic;
                    }
                  });
                }, icon: Icon(textFieldIcon4, color: Colors.white))
              )
            ],
          )
        ],
      ),
    );
  }
}
