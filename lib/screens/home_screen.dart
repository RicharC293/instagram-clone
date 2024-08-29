import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widgets/instagram_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.camera),
          onPressed: () {},
        ),
        title: const InstagramLogo(height: 30),
        backgroundColor: const Color(0xffFAFAFA),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.chat_bubble_text),
            onPressed: () {},
          ),
        ],
      ),
      body: const Placeholder(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 0,
        backgroundColor: const Color(0xffFAFAFA),
        onTap: (value) {
          /// On tap retorna el indice del item que se seleccionó
          print(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/avatars/1.png'),
              radius: 10,
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
