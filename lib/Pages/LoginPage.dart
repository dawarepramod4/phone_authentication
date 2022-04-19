import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum loginstate { selectLanguage, mobileForm, otpForm }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final currentState = loginstate.selectLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getLanguageWiidget(context),
      ),
    );
  }
}

getLanguageWiidget(context) {
  return Scaffold(
    body: SafeArea(
      child: Container(
          child: Column(
        children: [
          const SizedBox(
            height: 135,
          ),
          const SizedBox(
              height: 42,
              child: Icon(
                Icons.image,
                size: 42,
              )),
          const SizedBox(
            height: 42,
          ),
          const Text(
            "Please Select Your Language",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 12),
          const SizedBox(
            width: 184,
            child: Flexible(
              child: Text(
                "You can change he Language at any time",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(height: 24.4),
          Center(
              child: Container(
                  width: 215,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border: Border.all(
                          color: HexColor('#2E3B62'),
                          style: BorderStyle.solid,
                          width: 0.80)),
                  //padding: const EdgeInsets.fromLTRB(75.2, 0, 75.2, 0),
                  child: const MyStatefulWidget())),
          const SizedBox(
            height: 22.5,
          ),
          SizedBox(
            height: 47,
            width: 216,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "NEXT",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor('#2E3B62')),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.blueGrey)))),
            ),
          ),
        ],
      )),
    ),
  );
}

// Drop Down Menu
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      itemHeight: 50,
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 0,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['English', 'Marathi', 'Hindi']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text("  " + value),
        );
      }).toList(),
    );
  }
}

// getting mobile number
getMobileNumberWidget(context) {
  return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Spacer(),
          const TextField(
              decoration: InputDecoration(hintText: "Phone Number")),
          ElevatedButton(onPressed: () {}, child: const Text("Send Code")),
          // ignore: prefer_const_constructors
          Spacer()
        ],
      ));
}
