import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roleplaying_app/src/bloc/auth/auth_bloc.dart';
import 'package:roleplaying_app/src/services/auth_service.dart';

import '../models/user.dart';
import 'landing.dart';

class AuthScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: AuthView(),
    );
  }
}

class AuthView extends StatefulWidget {
  late TextEditingController _controller;

  AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthView();
}

class _AuthView extends State<AuthView> {
  late TextEditingController _passwordController;
  late TextEditingController _emailController;

  AuthService _authService = AuthService();
  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocProvider.value(
            value: BlocProvider.of<AuthBloc>(context),
            child: Scaffold(
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.5,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 16,
                          child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(20)),
                                  depth: 2.0,
                                  color: Theme
                                      .of(context)
                                      .primaryColor
                              ),
                              child: Center(
                                child: Text("Ролевые игры",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1),
                              )
                          )
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery
                            .of(context)
                            .size
                            .height / 2.4),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.5,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 22,
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.convex,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(10)),
                                    depth: 5.0,
                                    color: Theme
                                        .of(context)
                                        .cardColor
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.login),
                                    hintText: "Введите email",
                                  ),
                                  controller: _emailController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.5,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 22,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.convex,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(10)),
                                      depth: 5.0,
                                      color: Theme
                                          .of(context)
                                          .cardColor
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.password),
                                      hintText: "Введите пароль",
                                    ),
                                    controller: _passwordController,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.5,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 16,
                                  child: NeumorphicButton(
                                      style: NeumorphicStyle(
                                          shape: NeumorphicShape.flat,
                                          boxShape: NeumorphicBoxShape
                                              .roundRect(
                                              BorderRadius.circular(20)),
                                          depth: 15.0,
                                          color: Theme
                                              .of(context)
                                              .primaryColor
                                      ),
                                      child: Center(
                                        child: Text("Войти",
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyText1
                                        ),
                                      ),
                                      onPressed: () async {
                                        _email = _emailController.text;
                                        _password = _passwordController.text;

                                        UserModel user = await _authService
                                            .signIn(
                                            _email.trim(), _password.trim());
                                        if (user.id.isNotEmpty) {
                                          print("User id $user");
                                        }
                                        if (user.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: "Ошибка авторизации",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                          print("User id $user");
                                        } else {
                                          context.read<AuthBloc>().add(
                                              UserLoggedIn(user: state.user));
                                          print(context
                                              .read<AuthBloc>()
                                              .state);
                                        }
                                      }
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is UserAuthentificated) {
                          Navigator.pushNamed(context, '/menu_screen');
                        }
                      },
                      child: Container(),
                    )
                  ],
                )
            )
        );
      }
      );
    }
  }