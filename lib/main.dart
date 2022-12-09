import 'package:flutter/material.dart';
import 'package:tabnews/bloc/content_bloc.dart';
import 'package:tabnews/services/locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabNews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TabNews'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var contentBloc = ContentBloc();
  
  @override
  void initState() {
    super.initState();
    var contentBloc = ContentBloc();
    contentBloc.fetchContentFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ChangeNotifierProvider
        
        ListView.builder(itemCount: , itemBuilder: itemBuilder)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
