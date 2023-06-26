import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:totpri/model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                              leading: Image.network(
                                value.cartItems[index][2],
                                height: 36,
                              ),
                              title: Text(value.cartItems[index][0]),
                              subtitle: Text('\$' + value.cartItems[index][1]),
                              trailing: IconButton(
                                onPressed: () =>
                                    Provider.of<Cart>(context, listen: false)
                                        .removeItemFromCart(index),
                                icon: Icon(Icons.cancel),
                              )),
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$' + value.calculateTotal(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            'Pay Now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
