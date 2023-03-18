import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('title'),
      subtitle: const Text('subtitle'),
      trailing: const Icon(Icons.phone),
      onTap: () => {},
    );
  }
}
