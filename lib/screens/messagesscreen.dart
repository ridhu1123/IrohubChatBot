import 'package:flutter/material.dart';

class Messagesscreen extends StatefulWidget {
  final List messages;
  const Messagesscreen({super.key, required this.messages});

  @override
  State<Messagesscreen> createState() => _MessagesscreenState();
}

class _MessagesscreenState extends State<Messagesscreen> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: widget.messages[index]["isUserMessage"]
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(
                          widget.messages[index]["isUserMessage"] ? 0 : 20),
                      topLeft: Radius.circular(
                          widget.messages[index]["isUserMessage"] ? 20 : 0),
                    ),
                    color: widget.messages[index]["isUserMessage"]
                        ? Colors.grey.shade800
                        : Colors.grey.shade900.withOpacity(0.8)),
                constraints: BoxConstraints(maxWidth: width * 2 / 3),
                child: Text(
                  widget.messages[index]["message"].text.text[0],
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
