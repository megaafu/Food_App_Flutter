import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String name;
  final Color? color;
  final TextStyle style;

  const CategoryContainer({
    super.key,
    required this.name,
    required this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Text(name, style: style),
    );
  }
}
