import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// SafeArea -> Area de seguridad para que los widgets no desaparezcan
    /// distribución de los dispositivos
    /// 1. Container
    /// 2. Text
    /// 3. Button - GestureDetector
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
            color: Colors.grey,
            width: 1,
          )),
        ),
        height: 50,
        child: child,
      ),
    );
  }
}
