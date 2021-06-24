import 'package:design_tutorial/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  final int index;

  const ItemCard({
    Key key,
    this.product,
    this.press,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: index == 0 ? kDefaultPadding / 4 : kDefaultPadding,
                horizontal: kDefaultPadding,
              ),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              product.title,
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
