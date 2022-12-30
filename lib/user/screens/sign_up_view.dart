import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/bloc/user_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
// 200 = OK, 404 = Not Found, 500 = Internal Server Error

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  late Widget body;

  @override
  initState() {
    body = userData();
    super.initState();
  }

  verifySignUpProcess() {
    UserBloc userBloc = Provider.of<UserBloc>(context, listen: false);
    userBloc
        .signUpUser(emailController.text, passwordController.text,
            nameController.text, nickNameController.text)
        .then((value) {
      switch (value) {
        case 201:
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thank you! You can sign in now:)'),
            ),
          );
          break;
        case 401:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Error signing up.Try with another email or nickname'),
            ),
          );
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Error signing up. Try with another email or nickname'),
            ),
          );
      }
    });
  }

  changeUI() {
    setState(() {
      body = credentials();
    });
  }

  Widget credentials() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoTextField(
          keyboardType: TextInputType.emailAddress,
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
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        CupertinoTextField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
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
          height: 25,
        ),
        CupertinoTextField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          controller: confirmPasswordController,
          placeholder: "Confirm password",
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
          height: 25,
        ),
        CupertinoButton.filled(
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onPressed: () {
            if (emailController.text.isEmpty ||
                passwordController.text.isEmpty ||
                confirmPasswordController.text.isEmpty) {
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
            } else {
              if (passwordController.text == confirmPasswordController.text) {
                FocusManager.instance.primaryFocus?.unfocus();
                verifySignUpProcess();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Passwords do not match'),
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }

  Widget userData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoTextField(
          controller: nameController,
          placeholder: "Name",
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
          height: 25,
        ),
        CupertinoTextField(
          controller: nickNameController,
          placeholder: "Nickname",
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
          height: 25,
        ),
        CupertinoButton.filled(
          child: const Text(
            'Continue',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            if (nameController.text.isNotEmpty &&
                nickNameController.text.isNotEmpty) {
              changeUI();
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: width,
            height: height * 0.45,
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
                          image:
                              AssetImage("assets/img/ui_drawkit/drawkit_1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Form(
                      child: body,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
