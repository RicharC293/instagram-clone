import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/widgets/button.dart';
import 'package:instagram/widgets/footer.dart';
import 'package:instagram/widgets/instagram_logo.dart';

// Scaffold [x]
// Column [x]
// Text [x]
// Image [x]
// Text [x]
// Buttons 2 - FilledButton - TextButton [x]
// BottomNavigationBar
class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  /// Siempre colocar esto -> poder interpretar que es un screen y
  /// no un widget
  static String routeName = 'authorization-screen';

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
            // const Text(
            //   "Instagram",

            //   /// style es la propiedad que nos permite actualizar los estilos del texto
            //   style: TextStyle(
            //     /// fontSize: tamaño del texto
            //     fontSize: 50,

            //     /// fontWeight: peso de la fuente
            //     fontWeight: FontWeight.w500,

            //     /// color
            //     color: Colors.black,
            //   ),
            // ),

            const InstagramLogo(),

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
            const ClipOval(
              child: Image(
                image: AssetImage('assets/avatars/1.png'),
                height: 85,
                width: 85,
              ),
            ),

            /// ClipOval
            // const ClipOval(
            //   child: Image(
            //     image: AssetImage('assets/images/post.png'),
            //     height: 85,
            //     width: 85,
            //   ),
            // ),
            /// ClipRRect
            // ClipRRect(
            //   /// Solo en el top izquierdo se coloca un radio
            //   // borderRadius: BorderRadius.only(
            //   //   topLeft: Radius.circular(10)
            //   // ),
            //   borderRadius: BorderRadius.circular(100),
            //   child: const Image(
            //     image: AssetImage('assets/images/post.png'),
            //     height: 85,
            //     width: 85,
            //   ),
            // ),
            /// Avatar
            // const CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/post.png'),
            //   radius: 42.5,
            // ),

            /// Widget 4
            /// SizedBox
            const SizedBox(height: 10),

            /// Widget 5
            /// Text
            const Text(
              'richar293',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

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
            TextButton(
              onPressed: () {
                /// Navigator - estrategia 1
                /// Push
                /// A - B -> Pero la pantalla A se queda en el stack
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const LoginScreen(),
                //   ),
                // );
                /// pushNamed -> Navegación por nombre
                Navigator.pushNamed(context, LoginScreen.routeName);

                /// Reemplazar el pushNamed
                /// Navigator.pushReplacementNamed(context, routeName);
                /// 1. Qué cambio en el stack.
                /// 2. Qué paso con el appbar.
                /// 3. Como podría regresar a la pantalla anterior. Authorization screen
              },

              /// Otra forma WidgetStatePropertyAll()
              // style: ButtonStyle(
              //   foregroundColor: WidgetStateProperty.all(Colors.yellow),
              // ),
              child: const Text(
                "Switch accounts",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Footer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Dont't have an account? ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            GestureDetector(
              /// onTap: Detecta un click o un tap simple
              onTap: () {
                print("Sing Up"); // flutter logs
              },
              child: const Text(
                "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
