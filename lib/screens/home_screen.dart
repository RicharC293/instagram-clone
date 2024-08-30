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
          FutureBuilder(
            future: Services().getAllCharacters(),
            builder: (context, snapshot) {
              /// Como mostrar un loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child:  CircularProgressIndicator());
              }

              /// Controlar el request
              /// ListView.builder renderizar desde una lista de elementos
              if (snapshot.hasData) {
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    /// dirección - Vertical - Horizontal
                    scrollDirection: Axis.horizontal,

                    /// itemBuilder
                    itemBuilder: (context, index) {
                      /// index -> define la posición del elemento en la lista
                      /// data[index].image -> imagen es una url - imagen remota
                      final data = snapshot.data!.results;
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(2.0),
                            padding: const EdgeInsets.all(0.5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 3),
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(data[index].image),
                              radius: 30,
                            ),
                          ),
                          const SizedBox(height: 2),
                          SizedBox(
                            width: 70,
                            child: Text(
                              data[index].name,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      );
                    },

                    /// itemCount -> lenght
                    itemCount: snapshot.data!.results.length,
                  ),
                );
              }

              return Text("Ha ocurrido un error");
            },
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
