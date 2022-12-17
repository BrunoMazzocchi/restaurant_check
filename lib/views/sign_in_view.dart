import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/navigation.dart';

import '../bloc/restaurant_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RestaurantMenuBloc menuBloc = BlocProvider.of(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    int statusCode;
    void checkSecurityData(String email, String password) async {
      menuBloc
          .checkSecurityData(emailController.text, passwordController.text)
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
                          height: 10,
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
                          height: 10,
                        ),
                        CupertinoButton(
                          onPressed: () {
                            if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                              checkSecurityData(emailController.text, passwordController.text);
                            }else{
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
                            }
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
        future: menuBloc.checkSecurityData(
            emailController.text, passwordController.text),
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    }

    return handleCurrentSession();
  }
}
