import 'package:flutter/material.dart';
import 'package:instagram/screens/authorization_screen.dart';
import 'package:instagram/utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      // home: AuthorizationScreen(),
      routes: routes,
      initialRoute: AuthorizationScreen.routeName,
      // A - B
      /// Callbacks [x]
      /// A - animacion - B
    );
  }
}
