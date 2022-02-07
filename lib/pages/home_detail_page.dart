// ignore_for_file: unnecessary_null_comparison, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  // const HomeDetailPage({ Key? key }) : super(key: key);
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) 
  : assert(catalog!=null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: (){}, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  context.theme.buttonColor,
                ),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                )
              ),
              child: "Add to cart".text.make(),
            ).wh(120,50)
          ],
        ).p32(),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog.desc.text.caption(context).xl.make(),
                      10.heightBox,
                      "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita."
                        .text
                        .caption(context)
                        .make()
                        .p16()
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
