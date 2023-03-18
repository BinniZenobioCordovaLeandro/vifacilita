import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final Color? color;

  const ButtonImage({
    super.key,
    this.onTap,
    required this.image,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(image, color: color),
      ),
    );
  }
}
