import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/widgets/button.dart';
import 'package:instagram/widgets/footer.dart';
import 'package:instagram/widgets/instagram_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// 1. Stateful [x]
  /// 2. Colocar un botón [x]
  /// 3. Es crearse una variable _isShowPassword = false [x]
  /// 4. Utilizar el setState para cambiar el estado
  bool _isShowPassword = false;

  /// 1. Crearnos 2 variables _email, _password
  /// 2. Guardar los datos del input con las variables
  /// 3. Detonar el botón para loguearse
  String _email = '';
  String _password = '';

  /// Todo form necesita un key que va a ser la referencia a cada uno de los inputs
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          // EdgeInsets.all(value) -> cuatro esquinas el mismo padding
          // EdgeInsets.only() -> padding en una esquina - nos permite darles diferente valor
          // EdgeInsets.symmetric() -> padding horizontal y vertical
          padding: const EdgeInsets.all(16),

          /// Column debe ser de tipo scrolleable para remover el error
          /// de overflow
          /// SingleChildScrollView
          child: SingleChildScrollView(
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
                /// TextFormField -> debe estar dentro de un Form

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // Nos permite definir texto como un atajo
                    hintText: 'test@test.com',
                    labelText: 'Correo electrónico',
                  ),

                  /// Definir el tipo de teclado
                  keyboardType: TextInputType.emailAddress,

                  onChanged: (String value) {
                    _email = value;
                  },

                  onSaved: (newValue) {
                    _email = newValue ?? '';
                  },

                  validator: (value) {
                    //1. si está vacío retorna un mensaje de Requerido
                    if (value == null || value.isEmpty) {
                      return "Requerido";
                    }
                    // 2. si no una @ no es un email
                    if (!value.contains('@')) {
                      return "Ingresa un email";
                    }

                    /// Regex
                    // if(!value.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")))

                    // 3. permitele avanzar
                    return null;
                  },

                  /// Formatos de entrada
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                ),

                /// SizedBox
                const SizedBox(height: 10),
                TextFormField(
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
                  onChanged: (value) {
                    _password = value;
                  },
                  onSaved: (newValue) {
                    _password = newValue ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Requerido";
                    }
                    return null;
                  },
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
                    onPressed: () {
                      /// bool validate()
                      /// Ese bool te dice si pasó todas las validaciones
                      if (_formKey.currentState!.validate()) {
                        /// Guardar los datos - recomiendo usar siempre
                        _formKey.currentState!.save();
                        // esto se ejecuta se llama un servicio y se loguea
                        print("EMAIL: $_email");
                        print("PASSWORD: $_password");
                        /// JWT -> secureStorage
                        // Navigator.pushReplacementNamed(context, HomeScreen.routeName);

                        /// predicate
                        /// callback que tiene un argumento que se llama route
                        /// route -> cada una de las rutas del stack
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routeName,
                          (route) => false,
                          arguments: _email,
                        );
                      }
                    },
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
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "Sign up.",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            /// A EJECUTAR
                            print("Redirection");
                          },
                      ),
                      // TextSpan(
                      //   text: " como estas",
                      //   style: TextStyle(color: Colors.red),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const Footer(
      //   child: Center(child: Text("Instagram or Facebook")),
      // ),
    );
  }
}
