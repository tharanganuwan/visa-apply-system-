import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 12, 5, 70),
            title: Text('News & Updates'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                text: 'Title',
              ),
              Tab(
                text: 'Date',
              )
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: Text('Tab1'),
            ),
            Center(
              child: Text('Tab1'),
            )
          ]),
        ),
      );
}
