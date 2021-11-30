import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Colors.white,
        // elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        // centerTitle: true,
      ),
      body: const Center(
        child: Text("Welcome!"),
      ),
      drawer: MyDrawer(),
    );
  }
}
