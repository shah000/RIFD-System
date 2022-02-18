// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:expansion_widget/expansion_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallenScreen extends StatefulWidget {
  const ChallenScreen({Key? key}) : super(key: key);

  @override
  _ChallenScreenState createState() => _ChallenScreenState();
}

DatabaseReference databaseReference = FirebaseDatabase.instance.ref('Users');
void sendEmail(String email) => launch("mailto:$email");

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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            margin: const EdgeInsets.all(2),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FirebaseAnimatedList(
                  defaultChild: Center(child: CircularProgressIndicator()),
                  query: databaseReference,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, snapshot, animation, index) {
                    Map? user = snapshot.value as Map?;
                    if (user!.isEmpty) {
                      return Center(
                        child: Text("Not Data"),
                      );
                    } else {
                      return _listChallen(list: user);
                    }
                  },
                )),
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
                onPressed: () {
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
                child: Text(
                  "Load More",
                )),
          )
        ],
      ),
    );
  }

  Widget _listChallen({Map? list}) {
    assert(list != null);
    return ExpansionWidget(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 130.0),
            child: Text(
              'Address: ' + list!['address'],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 160.0),
            child: Text(
              'Email: ' + list['email'],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                sendEmail('pfroject87@gmail.com');
                // var db = FirebaseDatabase.instance.ref('Users');
                // db.set({
                //   "Model": "Suzuki Mehran",
                //   "address": "H#21,st#4,G-8/2,ISB",
                //   "email": "admin@gmail.com",
                //   "id": "0A3D5519",
                //   "name": "Asif",
                //   "vehNum": "AZB 2099",
                //   "pending": "5"
                // }).catchError((onError) {
                //   Scaffold.of(context)
                //       .showSnackBar(SnackBar(content: Text(onError)));
                // });
              },
              child: const Text("Send Email"))
        ],
      ),
      titleBuilder: (double animationValue, _, bool isExpaned, toogleFunction) {
        var math;
        return InkWell(
            onTap: () => toogleFunction(animated: true),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      // ignore: unnecessary_const
                      child: ListTile(
                    leading: Text(list['Model']),
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
    );
  }
}
