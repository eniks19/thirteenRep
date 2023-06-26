import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GroceryItemTile extends StatelessWidget {
  GroceryItemTile(
      {super.key,
      required this.name,
      required this.price,
      required this.img,
      required this.kalar,
      required this.tap});
  final String name;
  final String price;
  final String img;
  final kalar;
  void Function()? tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kalar[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              img,
              height: 64,
            ),
            Text(name),
            MaterialButton(
              onPressed: tap,
              color: kalar[800],
              child: Text(
                '\$' + price,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
