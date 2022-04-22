import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phone_authentication/Pages/ProfilePage.dart';
import 'package:phone_authentication/Pages/clippers/custom_clippers.dart';

enum loginstate { selectLanguage, mobileForm, otpForm }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  loginstate currentState = loginstate.selectLanguage;
  final phonecontroller = TextEditingController();
  final otpcontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  bool showloading = false;

  PhoneNumber number = PhoneNumber();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : getRequiredPage(),
      ),
    );
  }

  Widget getRequiredPage() {
    if (currentState == loginstate.selectLanguage) {
      return getLanguageWiidget(context);
    } else if (currentState == loginstate.mobileForm) {
      return getMobileNumberWidget(context);
    } else {
      return getOtpNumberWidget(context);
    }
  }

  void signInwithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showloading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showloading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showloading = false;
      });

      // ignore: deprecated_member_use
      _scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text(e.message.toString())));
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
                    child: const CustomDropdown())),
            const SizedBox(
              height: 22.5,
            ),
            SizedBox(
              height: 47,
              width: 216,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    currentState = loginstate.mobileForm;
                  });
                },
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
            SizedBox(
              height: 200,
            ),
            Expanded(
              child: Stack(children: [
                ClipPath(
                  clipper: BackCliper(),
                  child: Container(color: HexColor('#93D2F3')),
                ),
                ClipPath(
                  clipper: FrontCliper(),
                  child:
                      Container(color: HexColor('#2E3B6280').withOpacity(0.5)),
                ),
              ]),
            )
          ],
        )),
      ),
    );
  }

// getting mobile number
  getMobileNumberWidget(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Please enter your mobile number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 12),
            const SizedBox(
              width: 184,
              child: Flexible(
                child: Text(
                  "You will recieve a 6 digit code to verify next",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: Border.all(
                      color: HexColor('#2E3B62'),
                      style: BorderStyle.solid,
                      width: 0.80)),
              // padding: const EdgeInsets.all(10),
              child: InternationalPhoneNumberInput(
                  isEnabled: true,
                  formatInput: true,
                  textFieldController: phonecontroller,
                  onInputChanged: (PhoneNumber number) {
                    //  number = this.number;
                    number = this.number;
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: TextButton(
                onPressed: () async {
                  setState(() {
                    showloading = true;
                  });

                  await _auth.verifyPhoneNumber(
                      phoneNumber: "+91" + phonecontroller.text,
                      timeout: const Duration(seconds: 50),
                      verificationCompleted: (phoneAuthCredential) async {
                        setState(() {
                          showloading = true;
                        });

                        signInwithPhoneAuthCredential(phoneAuthCredential);
                      },
                      verificationFailed: (verificationFailed) async {
                        setState(() {
                          showloading = false;
                        });

                        // ignore: deprecated_member_use
                        _scaffoldKey.currentState?.showSnackBar(SnackBar(
                            content:
                                Text(verificationFailed.message.toString())));
                      },
                      codeSent: (verificationId, resendingToken) async {
                        setState(() {
                          showloading = false;
                          currentState = loginstate.otpForm;

                          this.verificationId = verificationId;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationId) async {
                        this.verificationId = verificationId;
                      });
                },
                child: const Text(
                  "CONTINUE",
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
            // ignore: prefer_const_constructors
            Spacer()
          ],
        ));
  }

//otp verification
  getOtpNumberWidget(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Verify Phone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 12),
            // ignore: prefer_const_constructors
            SizedBox(
              width: 220,
              child: Flexible(
                child: Text(
                  "Code is sent to ${phonecontroller.text}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            //otpfield

            OtpTextField(
              onSubmit: (String verificationCode) async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: verificationCode);
                // print(verificationCode);

                signInwithPhoneAuthCredential(phoneAuthCredential);
              },
              numberOfFields: 6,
              fieldWidth: 48,
              showFieldAsBox: true,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 300,
              child: Flexible(
                child: Row(
                  children: [
                    const Text(
                      "Didn't receive the code?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentState = loginstate.mobileForm;
                        });
                      },
                      child: Text("Request Again"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),

            const SizedBox(
              height: 24,
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "VERIFY AND CONTINUE",
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
            // ignore: prefer_const_constructors
            Spacer()
          ],
        ));
  }
}

// Drop Down Menu
class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
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
