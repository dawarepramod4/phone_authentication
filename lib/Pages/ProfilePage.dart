import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:phone_authentication/presentation/my_flutter_app_icons.dart';

enum selected { shipper, transporter }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var select;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 112,
          ),
          const Text(
            "Please select your profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Center(child: const SizedBox(height: 26)),
          InkWell(
            onTap: () {
              setState(() {
                select = selected.shipper;
              });
            },
            child: Container(
                height: 89,
                width: 328,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    border: Border.all(
                        color: HexColor('#2E3B62'),
                        style: BorderStyle.solid,
                        width: 0.80)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    select == selected.shipper
                        ? Image.asset(
                            "lib/presentation/Group 3.png",
                            height: 24,
                          )
                        : Icon(
                            Icons.circle_outlined,
                            size: 24,
                          ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      MyIcon.group_1,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 155,
                          child: Text(
                            "Shipper",
                            style: TextStyle(
                                color: HexColor("#2F3037"), fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          width: 155,
                          height: 30,
                          child: Flexible(
                            child: Text(
                              "Consetetur no diam et ipsum vero voluptua..",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              setState(() {
                select = selected.transporter;
              });
            },
            child: Container(
                height: 89,
                width: 328,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    border: Border.all(
                        color: HexColor('#2E3B62'),
                        style: BorderStyle.solid,
                        width: 0.80)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    select == selected.transporter
                        ? Image.asset(
                            "lib/presentation/Group 3.png",
                            height: 24,
                          )
                        : Icon(
                            Icons.circle_outlined,
                            size: 24,
                          ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      MyIcon.vector__3_,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 155,
                          child: Text(
                            "Transporter",
                            style: TextStyle(
                                color: HexColor("#2F3037"), fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          width: 155,
                          height: 30,
                          child: Flexible(
                            child: Text(
                              "Consetetur no diam et ipsum vero voluptua..",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 60,
            width: 340,
            padding: const EdgeInsets.all(5),
            child: TextButton(
              onPressed: () {},
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
          const Spacer()
        ],
      )),
    );
  }
}
