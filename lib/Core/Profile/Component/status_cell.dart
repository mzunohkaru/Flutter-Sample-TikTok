import 'package:flutter/material.dart';
import 'package:tiktok_clone/Model/User/user.dart';

class StatusCell extends StatelessWidget {
  final User? user;

  const StatusCell({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(user!.following.toString()),
              const Text("Following")
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(user!.followers.toString()),
                const Text("Followers")
              ],
            ),
          ),
          Column(
            children: [Text(user!.likes.toString()), const Text("Likes")],
          ),
        ],
      ),
    );
  }
}
