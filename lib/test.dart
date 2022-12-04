import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(),
            ListTile(
                leading: SizedBox(
                    // height: 50,
                    // width: 50,
                    child: SvgPicture.network(
                        'https://avatars.dicebear.com/v2/avataaars/sam.svg?options[mood][]=happy')))
          ],
        ),
      ),
    );
  }
}
