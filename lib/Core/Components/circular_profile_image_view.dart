import 'package:flutter/material.dart';

class CircularProfileImageView extends StatefulWidget {
  final String? profileImageUrl;
  final double radius;

  const CircularProfileImageView({super.key, this.profileImageUrl, required this.radius});

  @override
  State<CircularProfileImageView> createState() =>
      _CircularProfileImageViewState();
}

class _CircularProfileImageViewState extends State<CircularProfileImageView> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundImage: widget.profileImageUrl != null
          ? NetworkImage(widget.profileImageUrl!)
          : null,
      child: widget.profileImageUrl == null ? const Icon(Icons.person) : null,
    );
  }
}
