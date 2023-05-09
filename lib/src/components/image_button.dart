import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final Color? color;
  final String? title;

  const ButtonImage({
    super.key,
    this.onTap,
    required this.image,
    this.color = Colors.white,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(image, color: color),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
