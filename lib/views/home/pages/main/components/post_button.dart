import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function() onTap;

  const PostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 45.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 4.0),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
