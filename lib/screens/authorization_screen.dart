import 'package:flutter/material.dart';
import 'package:instagram/widgets/button.dart';

// Scaffold [x]
// Column [x]
// Text [x]
// Image
// Text
// Buttons 2 - FilledButton - TextButton
// BottomNavigationBar
class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// El column debe estar envuelto en un center
      body: Center(
        child: Column(
          /// Y debe ocupar el tamaño mínimo
          mainAxisSize: MainAxisSize.min,
          // Son los hijos del column que son Widgets
          children: [
            /// Widget 1
            /// Text -> nos sirve para renderizar un texto
            const Text(
              "Instagram",

              /// style es la propiedad que nos permite actualizar los estilos del texto
              style: TextStyle(
                /// fontSize: tamaño del texto
                fontSize: 50,

                /// fontWeight: peso de la fuente
                fontWeight: FontWeight.w500,

                /// color
                color: Colors.black,
              ),
            ),

            /// Widget 2
            /// SizedBox -> solamente crea una caja vacía
            /// Limitar espacios -> del hijo
            const SizedBox(height: 40),

            /// Widget 3
            /// Colocar una imagen
            /// 1. Imagen [x]
            /// 2. Colocar la imagen dentro del proyecto [x]
            /// 3. Referenciar la imagen pubspec [x]
            /// 4. Utilizarla con los widgets
            /// Renderizar una imagen
            /// 1. Image
            ///   assets - imagenes en los assets
            ///   network - url
            const Image(
              image: AssetImage('assets/avatars/1.png'),
              height: 85,
              width: 85,
            ),

            /// Widget 4
            /// SizedBox
            const SizedBox(height: 10),

            /// Widget 5
            /// Text
            const Text('richar293'),

            /// Widget 6
            /// SizedBox
            const SizedBox(height: 10),

            /// Widget 7
            /// Botones
            /// FilledButton -> es un botón con relleno
            SizedBox(
              width: 300,
              height: 44,
              child: Button(
                text: 'Log in',
                onPressed: () {},
              ),
            ),
            
            /// TextButton
          ],
        ),
      ),
    );
  }
}
