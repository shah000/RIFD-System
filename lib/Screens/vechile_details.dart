// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class VechileDetails extends StatefulWidget {
  VechileDetails({Key? key}) : super(key: key);

  @override
  _VechileDetailsState createState() => _VechileDetailsState();
}

class _VechileDetailsState extends State<VechileDetails> {
  bool selected = false;
  final databaseReference = FirebaseDatabase.instance.ref('Users');
  var rname = '';

  readData() async {
    print('read');
    DatabaseEvent event = await databaseReference.once();
    print(event.snapshot.value);
  }

  @override
  void initState() {
    // TODO: implement initState
    readData();
    print("object");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehilce Details"),
        backgroundColor: Colors.blue[800],
      ),
      backgroundColor: Colors.cyan[600],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: OutlineSearchBar(
                borderWidth: 1,
                borderRadius: BorderRadius.circular(15),
                hideSearchButton: true,
                hintText: 'Vehilce Number',
                clearButtonColor: Colors.black,
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Card(
              child: Container(
                width: 340,
                height: 400,
                child: ContainedTabBarView(
                  tabs: [
                    const Text('USER'),
                    const Text('VEHICLE'),
                    const Text('PENALTY'),
                  ],
                  tabBarProperties: TabBarProperties(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 8.0,
                    ),
                    indicator: ContainerTabIndicator(
                      radius: BorderRadius.circular(1.0),
                      color: Colors.blue,
                      borderWidth: 1.0,
                      borderColor: Colors.transparent,
                    ),
                    labelColor: Colors.yellow[600],
                    unselectedLabelColor: Colors.black,
                  ),
                  views: [
                    Container(
                      width: 330,
                      height: 400,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FirebaseAnimatedList(
                                query: databaseReference,
                                itemBuilder:
                                    (context, snapshot, animation, index) {
                                  // var x = snapshot.value!['name'];

                                  return ListTile(
                                    title: Text('hjhjk'),
                                  );
                                },
                              )
                              // Text("Name"),
                              // Text("Rehan Ali"),
                              // SizedBox(
                              //   height: 40,
                              // ),
                              // Text("Email"),
                              // Text("rehanAli@gmail.com"),
                              // SizedBox(
                              //   height: 40,
                              // ),
                              // Text("Address"),
                              // Text("House32,st11,I-8/1\nIslamabad."),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 400,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name"),
                              Text("Rehan Ali"),
                              SizedBox(
                                height: 40,
                              ),
                              Text("Email"),
                              Text("rehanAli@gmail.com"),
                              SizedBox(
                                height: 40,
                              ),
                              Text("Address"),
                              Text("House32,st11,I-8/1\nIslamabad."),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 400,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name"),
                              Text("Rehan Ali"),
                              SizedBox(
                                height: 40,
                              ),
                              Text("Email"),
                              Text("rehanAli@gmail.com"),
                              SizedBox(
                                height: 40,
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Pending"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
