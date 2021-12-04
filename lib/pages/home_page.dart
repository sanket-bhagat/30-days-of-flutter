import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = json.decode(catalogJson);
    var producstData = decodedData["products"];
    CatalogModel.items =
        List.from(producstData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, a, b) => FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cart);
            },
            backgroundColor: MyTheme.darkBlue,
            child: Icon(
              CupertinoIcons.cart,
              color: Vx.white,
            ),
          ).badge(
            color: Vx.red500,
            size: _cart.items.isNotEmpty ? 20 : 0,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: Vx.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
