import 'package:design_tutorial/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Descriptions extends StatelessWidget {
  const Descriptions({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
