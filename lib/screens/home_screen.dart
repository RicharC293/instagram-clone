import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/services/services.dart';
import 'package:instagram/widgets/instagram_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    final email = (ModalRoute.of(context)?.settings.arguments)?.toString();
    return Scaffold(
      appBar: AppBar(
        // Widget que indica un icono o botón al lado izquierdo
        // Automaticamente la flecha de atrás - maneja automaticamente
        leading: IconButton(
          icon: const Icon(CupertinoIcons.camera),
          onPressed: () {},
        ),
        title: const InstagramLogo(height: 30),
        // title: Text(email ?? 'null'),
        centerTitle: true,

        /// Color hexadecimal
        /// Color -> Decir que necesitas un color
        /// 0xff -> Opacidad
        /// FAFAFA -> clave del color
        backgroundColor: const Color(0xffFAFAFA),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.plus_bubble),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: () async {
              final data = await Services().getAllCharacters();
              print(data);
            },
            child: const Text('Servicio'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // iconSize: 24,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 0,
        backgroundColor: const Color(0xffFAFAFA),
        onTap: (value) {
          /// On tap retorna el indice del item que se seleccionó
          print(value);
          //0
          //1
          //2
          // if - switch
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
