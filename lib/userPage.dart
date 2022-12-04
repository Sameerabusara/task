import 'package:flutter/material.dart';

class userPage extends StatefulWidget {
  const userPage({Key? key}) : super(key: key);

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(color: Colors.black, child: Text("Hello World!!!")),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Image.network(
                      'https://avatars.dicebear.com/v2/avataaars/{{username}}.svg?options[mood][]=happy'),
                  Text("Name"),
                  ListTile(
                    title: Text("sam@g.com"),
                    leading: Icon(Icons.mail),
                  ),
                  ListTile(
                    title: Text("1700-99-88-77"),
                    leading: Icon(Icons.phone),
                  ),
                  ListTile(
                    title: Text("http://hildegard.org"),
                    leading: Icon(Icons.web_sharp),
                  ),
                ],
              ),
            ),
            const ListTile(
                title: Text("Battery Full"),
                leading: Icon(Icons.battery_0_bar_sharp),
                trailing: Icon(Icons.star)),
            // ListTile(
            //     title: Text("Anchor"),
            //     leading: Icon(Icons.anchor),
            //     trailing: Icon(Icons.star)),
            // ListTile(
            //     title: Text("Alarm"),
            //     leading: Icon(Icons.access_alarm),
            //     trailing: Icon(Icons.star)),
            // ListTile(
            //     title: Text("Ballot"),
            //     leading: Icon(Icons.ballot),
            //     trailing: Icon(Icons.star))
          ],
        ),
      ),
    ));
  }
}
