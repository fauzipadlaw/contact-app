import 'package:contact_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  const SectionTitle({
    super.key,
    required this.title,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: blue,
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
