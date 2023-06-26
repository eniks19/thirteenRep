import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:totpri/components/grocery_item_tile.dart';
import 'package:totpri/model/cart_model.dart';
import 'package:totpri/page/cart_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Good morning',
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Lets order fresh items for you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresh items',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(child: Consumer<Cart>(
              builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        name: value.shopItems[index][0],
                        price: value.shopItems[index][1],
                        img: value.shopItems[index][2],
                        kalar: value.shopItems[index][3],
                        tap: () => Provider.of<Cart>(context, listen: false)
                            .addItemToCart(index),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
