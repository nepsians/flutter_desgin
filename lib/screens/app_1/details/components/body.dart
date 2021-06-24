import 'package:design_tutorial/constants.dart';
import 'package:design_tutorial/models/Product.dart';
import 'package:design_tutorial/screens/app_1/details/components/product_title_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_button.dart';
import 'descriptions.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height - 94,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height / 3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.1,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  // height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      Descriptions(product: product),
                      CounterWithFavBtn(),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTtitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
