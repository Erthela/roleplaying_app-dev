import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:roleplaying_app/src/ui/Utils.dart';

class FormScreen extends StatefulWidget {

  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 15,
              left: 15,
              child: Utils.GenerateBackButton(context)
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Utils.GenerateButton('', Icons.check, context),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.15,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                    depth: 2.0,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height / 22,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                                  depth: 5.0,
                                  color: Theme.of(context).cardColor
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
                                child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Название анкеты",
                                    )
                                ),
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.38,
                              height: MediaQuery.of(context).size.height / 3.07,
                              child: NeumorphicButton(
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                  depth: 5.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                child: Center(
                                  child: Icon(Icons.image_outlined,
                                    size: sqrt((MediaQuery.of(context).size.height + MediaQuery.of(context).size.width)*60),
                                  ),
                                ),
                                onPressed: () => Navigator.pushNamed(context, ''),
                              )
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 60),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.27,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                depth: 2.0,
                                color: Theme.of(context).accentColor,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50, left: MediaQuery.of(context).size.width / 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Текст:",
                                            style: Theme.of(context).textTheme.bodyText2,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
                                            child: SizedBox(
                                              width:  MediaQuery.of(context).size.width / 2,
                                              height: MediaQuery.of(context).size.height / 28,
                                              child: Neumorphic(
                                                style: NeumorphicStyle(
                                                  shape: NeumorphicShape.flat,
                                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                                  depth: 2.0,
                                                  color: Theme.of(context).accentColor,
                                                ),
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Текст",
                                                      hintStyle: TextStyle(
                                                        color: Theme.of(context).textTheme.bodyText1?.color,
                                                      )
                                                    )
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width / 1.5,
                                          height: MediaQuery.of(context).size.height / 30,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                              depth: 2.0,
                                              color: Theme.of(context).cardColor,
                                            ),
                                            child: Center(
                                              child: Icon(Icons.add,
                                                size: sqrt((MediaQuery.of(context).size.height + MediaQuery.of(context).size.width) / 3),
                                              ),
                                            ),
                                            onPressed: () => {},
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            height: MediaQuery.of(context).size.height / 3.4,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                depth: 2.0,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
