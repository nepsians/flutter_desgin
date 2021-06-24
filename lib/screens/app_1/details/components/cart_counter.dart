import 'package:flutter/material.dart';

import '../../../../constants.dart';

class CartCounter extends StatefulWidget {
  CartCounter({Key key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  decrement() {
    if (numOfItems > 1) {
      setState(() {
        numOfItems--;
      });
    }
  }

  increament() {
    setState(() {
      numOfItems++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          buildOutlineButton(icon: Icons.remove, press: decrement),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Text(
              numOfItems.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildOutlineButton(icon: Icons.add, press: increament),
        ],
      ),
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: () => press(),
        child: Icon(icon),
      ),
    );
  }
}
