import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Item> _data = generateItems(10);
  final List<Item> _data2 = generateItems2(10);

  // Widget _listContact(List<Item> items) {
  //   return
  // }

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _data[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: _data.map((item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(title: Text(item.headerValue));
          },
          body: ListTile(
            title: Text(item.expandedValue),
            onTap: () {
              setState(() {
                _data.removeWhere((element) => item == element);
              });
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Danh bạ khẩn cấp')),
      body: SingleChildScrollView(child: _buildListPanel()),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.isExpanded,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index',
        isExpanded: true);
  });
}

List<Item> generateItems2(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
        headerValue: 'detail $index',
        expandedValue: 'detail This is item number $index',
        isExpanded: true);
  });
}
