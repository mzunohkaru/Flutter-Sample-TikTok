import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FeedIcon extends HookWidget {
  final VoidCallback voidCallBack;
  final Icon icon;
  final String countText;

  const FeedIcon(
      {super.key,
      required this.voidCallBack,
      required this.icon,
      required this.countText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              voidCallBack();
            },
            child: icon),
        const SizedBox(height: 3),
        Text(
          countText,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
