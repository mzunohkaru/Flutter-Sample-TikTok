import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeAgo;

String formatDate(Timestamp postDate) {
  final now = DateTime.now();
  final postDateTime = postDate.toDate();
  final difference = now.difference(postDateTime);
  return timeAgo.format(now.subtract(difference), locale: "ja");
}
