import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        isInCart
            ? RemoveMutation(catalog: catalog)
            : AddMutation(catalog: catalog);
      },
      child: isInCart
          ? Icon(
              Icons.done,
              color: Vx.white,
            )
          : Icon(
              Icons.add,
              color: Vx.white,
            ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
    );
  }
}
