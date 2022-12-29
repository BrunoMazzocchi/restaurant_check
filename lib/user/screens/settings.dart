import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Text('Change your password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: width,
            height: height - 500,
            child:  Form(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: const  [
                    CupertinoTextField(
                      placeholder: 'Old password',
                    ),
                    CupertinoTextField(
                      placeholder: 'New password',
                    ),
                    CupertinoTextField(
                      placeholder: 'Repeat new password',
                    ),

                  ],
                )),
          ),
          CupertinoButton.filled(
            child: const Text('Save'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}
