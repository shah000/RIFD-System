// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:expansion_widget/expansion_widget.dart';

import 'package:flutter/material.dart';
import 'package:fyp/Screens/email_screen.dart';
import 'package:get/get.dart';

class ChallenScreen extends StatefulWidget {
  ChallenScreen({Key? key}) : super(key: key);

  @override
  _ChallenScreenState createState() => _ChallenScreenState();
}

class _ChallenScreenState extends State<ChallenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Container(
            alignment: Alignment.center,
            width: 260,
            height: 40,
            color: Colors.blue[800],
            child: const Text(
              "RIFD Challans for Today",
              style: TextStyle(color: Colors.yellow),
            )),
        backgroundColor: Colors.cyan[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 480,
                margin: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    ExpansionWidget(
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 170.0),
                            child: const Text(
                              'Address:xyz sssssss\nEmail:xyz@gmail.com',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(EmailPage());
                              },
                              child: const Text("Send Email"))
                        ],
                      ),
                      titleBuilder: (double animationValue, _, bool isExpaned,
                          toogleFunction) {
                        var math;
                        return InkWell(
                            onTap: () => toogleFunction(animated: true),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                      // ignore: unnecessary_const
                                      child: const ListTile(
                                    leading: Text(
                                      "Suzuki Mehran,silver ",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    trailing: Icon(Icons.remove_red_eye_sharp),
                                    title: Padding(
                                      padding: EdgeInsets.only(left: 34.0),
                                      child: Text(
                                        'Rs.500 ',
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ));
                      },
                    ),
                    ExpansionWidget(
                      content: Column(
                        children: [
                          const Text(
                            'Address:xyz sssssss\nEmail:xyz@gmail.com',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Send"))
                        ],
                      ),
                      titleBuilder: (double animationValue, _, bool isExpaned,
                          toogleFunction) {
                        var math;
                        return InkWell(
                            onTap: () => toogleFunction(animated: true),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                      // ignore: unnecessary_const
                                      child: const ListTile(
                                    trailing: Icon(Icons.remove_red_eye_sharp),
                                    title: Text(
                                      'xxxxxxxxxxxxxxxxxxxxxx ',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                                ],
                              ),
                            ));
                      },
                    ),
                    const Divider(),
                    ExpansionWidget(
                      content: Column(
                        children: [
                          const Text(
                            'Address:xyz sssssss\nEmail:xyz@gmail.com',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Send"))
                        ],
                      ),
                      titleBuilder: (double animationValue, _, bool isExpaned,
                          toogleFunction) {
                        var math;
                        return InkWell(
                            onTap: () => toogleFunction(animated: true),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                      // ignore: unnecessary_const
                                      child: const ListTile(
                                    trailing: Icon(Icons.remove_red_eye_sharp),
                                    title: Text(
                                      'xxxxxxxxxxxxxxxxxxxxxx',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                                ],
                              ),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "50",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text(
                    "Load More",
                  )),
            )
          ],
        ),
      ),
    );
  }
}
