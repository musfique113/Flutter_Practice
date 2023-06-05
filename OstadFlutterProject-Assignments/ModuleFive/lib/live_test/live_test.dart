import 'package:flutter/material.dart';

class LiveTest extends StatefulWidget {
  const LiveTest({super.key});

  @override
  State<LiveTest> createState() => _LiveTestState();
}

class _LiveTestState extends State<LiveTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black54,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Live test"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ]),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    'Custom Message',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'This app is for live test Module Five',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Icon(
            Icons.add,
            size: 45,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
