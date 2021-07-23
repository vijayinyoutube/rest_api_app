import 'package:flutter/material.dart';
import 'package:rest_api_app/Models/demomodel.dart';
import 'package:rest_api_app/Repository/API/api.dart';
import 'package:rest_api_app/Screens/HomePage.dart/Widgets/general.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<DemoModel>>? futureModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppbar(),
      body: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) => SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeightSpacer(25.00),
              buildBtn(),
              buildHeightSpacer(25.00),
              buildFutureTextData(context),
            ],
          ),
        ),
      );

  buildFutureTextData(BuildContext context) => FutureBuilder<List<DemoModel>>(
        future: futureModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildSnapShotData(snapshot);
          } else if (snapshot.hasError) {
            return buildTextData("Error");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return buildTextData("Getting Data...");
          }
          return const CircularProgressIndicator();
        },
      );

  Widget buildBtn() => ElevatedButton(
        child: const Text("Get Data"),
        onPressed: () => setState(() {
          futureModel = fetchData();
        }),
      );
}
