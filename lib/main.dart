import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'addData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget _drawerHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: ClipOval(
        child: Image(
            image: AssetImage('assets/images/orang1.png'), fit: BoxFit.cover),
      ),
      accountName: Text('Fajar Aji Kusuma'),
      accountEmail: Text('20.240.0044'),
    );
  }

  Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(),
            _drawerItem(
              icon: Icons.document_scanner,
              text: 'Data Barang',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ),
            ),
            _drawerItem(
              icon: Icons.add,
              text: 'Input Barang',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddData()),
              ),
            ),
            Divider(height: 25, thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Text("Close The App",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  )),
            ),
            _drawerItem(
              icon: Icons.exit_to_app,
              text: 'Exit App',
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/orang1.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Selamat Datang di Aplikasi Inventory Barang",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
