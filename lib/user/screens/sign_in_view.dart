import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/main/widgets/navigation.dart';
import 'package:restaurant_check/user/screens/sign_up_view.dart';

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

  late UserBloc userBloc;

  late Future<bool> isUserLoggedIn =
      Provider.of<UserBloc>(context, listen: false).isUserLoggedIn();

  void checkSecurityData(String email, String password) async {
    userBloc
        .fetchUserJwt(emailController.text, passwordController.text)
        .then((value) {
      switch (value) {
        case 200:
          isUserLoggedIn = userBloc.isUserLoggedIn();
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Navigation(
                      index: 0,
                    )),
          );
          break;
        default:
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Wrong email or password'),
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
    });
  }

  Widget signInForm() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoTextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: emailController,
            placeholder: "Email",
            placeholderStyle: const TextStyle(
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
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CupertinoTextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
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
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CupertinoButton(
            onPressed: () {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {

                FocusManager.instance.primaryFocus?.unfocus();


                checkSecurityData(
                    emailController.text, passwordController.text);

              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please fill in all the fields'),
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
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontFamily: "SF Pro",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  );
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget signIn() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [

          Container(
            width: width,
            height: height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Welcome to Restaurant app\n Please sign in',
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/img/ui_drawkit/drawkit_1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    signInForm(),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget handleCurrentSession() {
    return FutureBuilder<bool>(
      future: isUserLoggedIn,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error);
              return signIn();
            } else {
              if (snapshot.data == true) {
                return const Navigation(
                  index: 0,
                );
              } else {
                return signIn();
              }
            }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of<UserBloc>(context, listen: false);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return handleCurrentSession();
  }
}
