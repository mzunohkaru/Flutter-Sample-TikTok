import 'package:flutter/material.dart';

class NoPostsCell extends StatelessWidget {
  const NoPostsCell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.post_add,
            size: 80,
          ),
          Text(
            "No Posts",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            "New posts you receive will appear here.",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
