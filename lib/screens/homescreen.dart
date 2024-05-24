import 'package:chatbot/screens/messagesscreen.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController _controller = TextEditingController();
  late DialogFlowtter dialogflowtter;
  List<Map<String, dynamic>> messages = [];
  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogflowtter = instance);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          "CHATbot",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messagesscreen(
              messages: messages,
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 234, 232, 232),
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: () {
                              sendMessage(_controller.text);
                              _controller.clear();
                            }, icon: Icon(Icons.send)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text)async {
    if (text.isEmpty) {
      print("Message  is empty");
    } else {
      setState(() {
        addMessage(Message(
          text: DialogText(
            text: [text]
          )
        ),true);
      });
      DetectIntentResponse response=await dialogflowtter.detectIntent(queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message==null) {
        return;
      }
      else{
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({"message": message, "isUserMessage": isUserMessage});
  }
}
