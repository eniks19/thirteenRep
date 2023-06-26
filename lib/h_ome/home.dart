import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:totpri/page/main_page.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80, bottom: 80, right: 80, top: 160),
            child: Image.network(
              'https://github.com/mitchkoko/GroceryStoreApp/blob/main/lib/images/avocado.png?raw=true',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'We deliver groceries to your doorstep',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Fresh items everyday',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage())),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(24),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
