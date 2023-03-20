import 'package:flutter/material.dart';
import 'package:vifacilita/src/helper/launcher_link.helper.dart';

class ListTileButton extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? category;
  final String? phone;
  final String? email;
  final void Function()? onTap;

  const ListTileButton({
    super.key,
    this.title,
    this.subtitle,
    this.category,
    this.phone,
    this.email,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title'),
      subtitle: Text('$subtitle'),
      trailing: const Icon(Icons.phone),
      onTap: onTap,
    );
  }
}
