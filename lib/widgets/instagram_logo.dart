import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svg/instagram_logo.svg",
      // Esto sirve para cambiar el color del svg
      // colorFilter: const ColorFilter.mode(Color.fromARGB(255, 234, 196, 193), BlendMode.srcIn),
      semanticsLabel: 'Instagram',
    );
  }
}
