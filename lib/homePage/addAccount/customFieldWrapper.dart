import 'package:flutter/material.dart';

class CustomFieldWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomFieldWrapper(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 0, right: 0, bottom: 0),
            child: child,
          )
        ],
      ),
    );
  }
}
