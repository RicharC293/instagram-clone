import 'package:flutter/material.dart';
import 'package:instagram/widgets/button.dart';
import 'package:instagram/widgets/instagram_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isShowPassword = false;

  /// 1. Stateful [x]
  /// 2. Colocar un botón [x]
  /// 3. Es crearse una variable _isShowPassword = false [x]
  /// 4. Utilizar el setState para cambiar el estado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        // EdgeInsets.all(value) -> cuatro esquinas el mismo padding
        // EdgeInsets.only() -> padding en una esquina - nos permite darles diferente valor
        // EdgeInsets.symmetric() -> padding horizontal y vertical
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          /// Es una lista de widgets
          children: [
            // SizedBox -> separar
            const SizedBox(height: 40),

            /// Extraer widgets
            /// - Para reutilizar código
            /// - Para evitar importaciones
            /// - Para darle la posibilidad de declarar el widget como const (performance)
            const Center(child: InstagramLogo()),

            // SizedBox -> separar
            const SizedBox(height: 40),

            /// Formulario - TextField - TextFormField

            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                // Nos permite definir texto como un atajo
                hintText: 'test@test.com',
                labelText: 'Correo electrónico',
              ),

              /// Definir el tipo de teclado
              keyboardType: TextInputType.emailAddress,
            ),

            /// SizedBox
            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Contraseña',
                // antes
                // prefix:
                // sufix -> después
                // Gesture Detector
                suffix: GestureDetector(
                    onTap: () {
                      /// Colocamos la lógica para mostrar o no mostrar la contraseña
                      _isShowPassword = !_isShowPassword;
                      setState(() {});
                    },
                    child: Icon(_isShowPassword
                        ? Icons.visibility
                        : Icons.visibility_off)),
              ),
              obscureText: _isShowPassword,
            ),

            /// Text button forgot password
            /// Align -> alinear widgets con respecto al padre
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),

            /// Botón Log in
            SizedBox(
              width: double.infinity,
              height: 44,
              child: Button(
                text: 'Log in',
                onPressed: () {},
              ),
            ),

            /// Espacio
            const SizedBox(height: 20),

            /// Login facebook
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Imagen
                  /// Image - Widget
                  Image.asset(
                    'assets/icons/facebook.png',
                    height: 17,
                    width: 17,
                  ),

                  /// SizedBox
                  const SizedBox(width: 10),

                  /// Text
                  const Text(
                    'Log in with Facebook',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),

            /// Divider
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Divider
                /// VerticalDivider
                SizedBox(
                  width: 132,
                  child: Divider(height: 100),
                ),

                Text(
                  "OR",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(
                  width: 132,
                  child: Divider(height: 100),
                ),
              ],
            ),


            /// Don't have accout
            /// RichText -> varios estilos al texto
            /// Hola **pepito** como estas
            /// Text - TextSpan
            RichText(
              text: const TextSpan(
                text: "Hola",
                children: [
                    TextSpan(
                      text: "pepito"
                    ),
                    TextSpan(
                      text: "como estas"
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
