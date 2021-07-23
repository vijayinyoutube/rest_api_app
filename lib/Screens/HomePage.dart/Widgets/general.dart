import 'package:flutter/material.dart';

Widget buildHeightSpacer(double myHeight) => SizedBox(
      height: myHeight,
    );

Widget buildTextData(String myText) => Text(
      myText,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 25.00, fontWeight: FontWeight.w500, color: Colors.purple),
    );

AppBar buildAppbar() => AppBar(
      title: const Text("Rest Api"),
    );

Widget buildSnapShotData(snapshot) => SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return buildListTile(snapshot.data[index].name,
              snapshot.data[index].userName, snapshot.data[index].email);
        },
      ),
    );

Widget buildListTile(String name, String userName, String email) => ListTile(
      title: Text(name),
      subtitle: Text(userName),
      trailing: Text(email),
    );
