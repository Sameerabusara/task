import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/services/remote_services.dart';

import '../models/user.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<User>? users;
  final List<bool> _isFavorited = List.filled(10, false);

  TextEditingController txtName = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtPhone = new TextEditingController();
  TextEditingController txtWebsite = new TextEditingController();
  var isloaded = false;

  bool clicked = true;

  String name = '';
  String email = '';
  String phone = '';
  String website = '';
  late int num;

  // var name = TextEditingController();
  @override
  void initState() {
    super.initState();

    getData();
    txtName = TextEditingController();
    txtName.addListener(() {
      final isButtonActive = txtName.text.isNotEmpty;
    });
    txtEmail = TextEditingController();
    txtPhone = TextEditingController();
    txtWebsite = TextEditingController();
  }

  @override
  void dispose() {
    txtName.dispose();
    txtEmail.dispose();
    txtPhone.dispose();
    txtWebsite.dispose();
    super.dispose();
  }

  getData() async {
    users = await RemoteService().getUsers();
    if (users != null) {
      setState(() {
        isloaded = true;
      });
      // name.text = users![0].name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task"),
      ),
      body: Visibility(
        visible: isloaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: users?.length,
            itemBuilder: ((context, index) {
              return Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Container(
                        child: SvgPicture.network(
                            'https://avatars.dicebear.com/v2/avataaars/${users![index].username}.svg?options[mood][]=happy'),
                      ),
                      Container(
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          users![index].name,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.mail_outline),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          users![index].email,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone_enabled_outlined),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          users![index].phone,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.wifi),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          users![index].website,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(
                        color: Colors.grey[200],
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    _isFavorited[index] = !_isFavorited[index];
                                  });
                                },
                                icon: _isFavorited[index]
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border),
                              ),
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey[300]),
                            ),
                            Expanded(
                              child: IconButton(
                                color: Colors.grey[500],
                                icon: Icon(Icons.create_outlined),
                                onPressed: () async {
                                  this.num = index;
                                  txtName.text = users![index].name;
                                  txtEmail.text = users![index].email;
                                  txtPhone.text = users![index].phone;
                                  txtWebsite.text = users![index].website;
                                  final name = (await openDialog())!;
                                  final email = (await openDialog())!;
                                  final phone = (await openDialog())!;
                                  final website = (await openDialog())!;

                                  setState(() {
                                    txtName.text = name;
                                    this.name = name;
                                    this.email = email;
                                    this.phone = name;
                                    this.website = email;
                                  });
                                },
                              ),
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey[300]),
                            ),
                            Expanded(
                              child: IconButton(
                                color: Colors.grey[600],
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    users?.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            })),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Basic Modal'),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Name :    '),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Name",
                              ),
                              controller: txtName,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Email :     '),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Email",
                              ),
                              controller: txtEmail,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Phone :    '),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Phone",
                              ),
                              controller: txtPhone,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Website : '),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Website",
                              ),
                              controller: txtWebsite,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: cancle,
                style: TextButton.styleFrom(
                  side: BorderSide(width: 1.0),
                ),
                child: Text(
                  'Cancle',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(onPressed: ok, child: Text("Ok"))
            ],
          ));

  void cancle() {
    Navigator.pop(context);
  }

  void ok() {
    Navigator.pop(context);

    users![num].name = txtName.text;
    users![num].email = txtEmail.text;
    users![num].phone = txtPhone.text;
    users![num].website = txtWebsite.text;

    setState(() {});
  }
}
