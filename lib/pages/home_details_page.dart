import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/widgets/add_to_cart.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.cream,
      appBar: AppBar(
        backgroundColor: MyTheme.cream,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyTheme.darkBlue).bold.make(),
                      2.heightBox,
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed quam sit amet enim ultricies egestas. Phasellus dapibus magna a metus vulputate, vel malesuada elit porttitor. Vestibulum vel facilisis eros."
                          .text
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Vx.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.make(),
            AddToCart(catalog: catalog).wh(130, 50),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: "Add to cart".text.color(Colors.white).xl.make(),
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
            //     shape: MaterialStateProperty.all(
            //       StadiumBorder(),
            //     ),
            //   ),
            // ).wh(130, 50),
          ],
        ).p16(),
      ),
    );
  }
}
