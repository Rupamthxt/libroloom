import 'package:flutter/material.dart';

class CardGenerator extends StatelessWidget {
  const CardGenerator({super.key, required this.url, required this.name});

  final String name, url;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Expanded(
          child: Column(
            children: [
              Image.network(url),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
