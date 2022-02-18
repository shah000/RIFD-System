import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/user.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class SerachScreen extends StatefulWidget {
  SerachScreen({Key? key}) : super(key: key);

  @override
  State<SerachScreen> createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
  List<UserModel> dataList = [];
  Map? user;
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('Users');

  @override
  void initState() {
    // TODO: implement initState
    print('.............LLL' + dataList.length.toString());
    // var d = FirebaseDatabase.instance.ref('Users').orderByChild('name').once();
    // print(d.toString());

    // var query = databaseReference.child('Users').orderByChild('name');

    // query.onChildAdded
    //     .forEach((event) =>
    //     {print(event.snapshot.value.toString())});
    var firstPageItems;

    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child('User')
        .orderByChild('name')
        .once()
        .then((snapshot) {
      setState(() {
        user = snapshot.snapshot.value as Map?;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: OutlineSearchBar(
              onKeywordChanged: (text) {
                serachMethod(text);
              },
              onTap: () {},
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    user!['name'],
                  ),
                  subtitle: Text(dataList[index].vehNum),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void serachMethod(String text) async {
    var d = FirebaseDatabase.instance
        .ref('Users')
        .orderByKey()
        .equalTo('name')
        .once();
    //   dataList.forEach((element) {
    //     UserModel userModel = UserModel(
    //         model: element.model,
    //         address: element.address,
    //         email: element.email,
    //         id: element.id,
    //         name: element.name,
    //         vehNum: element.vehNum);
    //     if (userModel.name.contains(text) || userModel.name.contains(text)) {
    //       dataList.add(userModel);
    //     }
    //   });
    // });
  }
}
