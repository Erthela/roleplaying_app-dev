import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Utils.dart';

class MenuScreen extends StatefulWidget{

  MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  final List<String> _containersNames = ["Открытые чаты", "Мои анкеты", "Мои чаты"];

  GenerateBlock(String _containersName, String route, [bool? _buttonFlag, String? _route, IconData? icon]){ //Как сделать дефолтные значения?
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 5.2,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 2.0,
          color: Theme.of(context).cardColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Text(_containersName,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 35),
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 8.4,
                      child: NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                          depth: 5.0,
                          color: Theme.of(context).accentColor,
                        ),
                        child: Icon(Icons.image_outlined,
                            size: sqrt((MediaQuery.of(context).size.height + MediaQuery.of(context).size.width)*3),
                        ),
                        onPressed: () => Navigator.pushNamed(context, route),
                      )
                  )
                ],
              ),
            ),
            if (_buttonFlag == true)
              Positioned(
                  right: 15,
                  top: 15,
                  child: Utils.GenerateButton(_route!, icon!, context)
              )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: Utils.GenerateButton('/profile_screen', Icons.account_circle_sharp, context),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Utils.GenerateButton('/auth_screen', Icons.logout, context)
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.5),
            child: Center(
              child: Column(
                children: [
                  GenerateBlock(_containersNames[0], '/chat_screen'),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: GenerateBlock(_containersNames[1], '/form_screen', true, '/form_screen', Icons.add),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: GenerateBlock(_containersNames[2], '/chat_screen', true, '/chat_edit_screen', Icons.add),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}