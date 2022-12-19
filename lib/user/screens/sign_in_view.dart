import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/main/widgets/navigation.dart';

import '../domain/bloc/user_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late int statusCode;
  late double width;
  late double height;

  late Future<int> isValid =
      Provider.of<UserBloc>(context, listen: false).isValid();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = Provider.of<UserBloc>(context);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    void checkSecurityData(String email, String password) async {
      userBloc
          .fetchUserJwt(emailController.text, passwordController.text)
          .then((value) {
        statusCode = value;
        switch (statusCode) {
          case 200:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Navigation()));
            break;
          case 401:
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Username or password incorrect'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                });
            break;
        }
      });
    }

    Widget signIn() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width,
                  height: height * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          height: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/img/ui_drawkit/drawkit_1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Sign in",
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoTextField(
                          textInputAction: TextInputAction.go,
                          controller: emailController,
                          placeholder: "Email",
                          placeholderStyle: const TextStyle(
                            fontFamily: "SF Pro",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          style: const TextStyle(
                            fontFamily: "SF Pro",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CupertinoTextField(
                          textInputAction: TextInputAction.go,
                          controller: passwordController,
                          placeholder: "Password",
                          placeholderStyle: const TextStyle(
                            fontFamily: "SF Pro",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          style: const TextStyle(
                            fontFamily: "SF Pro",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CupertinoButton(
                          onPressed: () {
                            checkSecurityData(
                                emailController.text, passwordController.text);
                          },
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontFamily: "SF Pro",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      );
    }

    Widget handleCurrentSession() {
      return FutureBuilder(
        future: isValid,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            statusCode = snapshot.data!;
            switch (statusCode) {
              case 200:
                return const Navigation();
              case 401:
                return signIn();
            }
            return const SignInView();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    return handleCurrentSession();
  }
}
