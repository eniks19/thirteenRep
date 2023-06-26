import 'package:flutter/material.dart';
import 'package:totpri/h_ome/home.dart';
import 'package:provider/provider.dart';
import 'package:totpri/model/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    );
  }
}
