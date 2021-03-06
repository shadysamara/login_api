import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:login_api_project/employeesApp/ui/screens/test_my_api.dart';
import 'package:login_api_project/newsApp/providers/news_provider.dart';
import 'package:login_api_project/newsApp/screens/screens/news_home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (BuildContext context) {
        return NewsProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: NewsHome(),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult result;
  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        this.result = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('CONNECTIVITY'),
        ),
        body: Center(
          child: Text(
            result.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}
