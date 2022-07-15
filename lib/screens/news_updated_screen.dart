import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsUpdatesScreen extends StatefulWidget {
  const NewsUpdatesScreen({Key? key}) : super(key: key);

  @override
  State<NewsUpdatesScreen> createState() => _NewsUpdatesScreenState();
}

class _NewsUpdatesScreenState extends State<NewsUpdatesScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('News & Updates'),
            backgroundColor: Colors.blue,
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                text: 'News',
              ),
              Tab(
                text: 'Updates',
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
