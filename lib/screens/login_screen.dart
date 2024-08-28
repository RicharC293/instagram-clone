import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/widgets/instagram_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = 'login-screen';

  /// 1. Stateful
  /// 2. Colocar un botón
  /// 3. Es crearse una variable _isShowPassword = false
  /// 4. Utilizar el setState para cambiar el estado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
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
                  },
                  child: const Icon(Icons.remove_red_eye)),
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
