import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:roleplaying_app/src/ui/Utils.dart';

class ChatScreen extends StatefulWidget {

  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: Utils.GenerateBackButton(context),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Utils.GenerateButton('/chat_description_screen', Icons.menu, context),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.24,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                    depth: 2.0,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                          child: Column(
                            children: [
                              Utils.GenerateMessageContainer('/profile_screen', Icons.account_circle_sharp, context, 'Пользователь 2'),
                              Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2, left: MediaQuery.of(context).size.width / 90),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width / 1.35,
                                            height: MediaQuery.of(context).size.height / 22.8,
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width / 1.5,
                                              height: MediaQuery.of(context).size.height / 50,
                                              child: Neumorphic(
                                                  style: NeumorphicStyle(
                                                      shape: NeumorphicShape.convex,
                                                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                                                      depth: 5.0,
                                                      color: Theme.of(context).accentColor
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: TextField(
                                                        decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            hintText: "Сообщение",
                                                            hintStyle: TextStyle(
                                                                color: Theme.of(context).textTheme.bodyText2?.color
                                                            )
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Utils.GenerateButton('', Icons.arrow_forward_ios_rounded, context),
                                        )
                                      ],
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}