import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getMobileNumberWidget(context),
      ),
    );
  }
}

getMobileNumberWidget(context) {
  return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Spacer(),
          TextFormField(),
          ElevatedButton(onPressed: () {}, child: Text("Send Code")),
          Spacer()
        ],
      ));
}
