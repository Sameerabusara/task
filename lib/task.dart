import 'package:flutter/material.dart';

class task extends StatefulWidget {
  const task({Key? key}) : super(key: key);

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(color: Colors.black, child: Text("Hello World!!!")),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: const [
              TextField(),
            ],
          ),
        ),
      ),
    ));
  }
}
