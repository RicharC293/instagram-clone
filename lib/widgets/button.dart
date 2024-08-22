import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, this.onPressed});

  /// Crear un atributo llamado text que va a ser de tipo String
  final String text;

  /// Acción - callback
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            /// El color cambia cuando presionamos el botón
            if (states.contains(WidgetState.pressed)) {
              return Colors.blue;
            }
            return Colors.blue;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
