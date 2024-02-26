import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_clone/Utils/constants.dart';

String formatDate(Timestamp postDate) {
  final now = DateTime.now();
  final postDateTime = postDate.toDate();
  final difference = now.difference(postDateTime);

  logger.t(
      "s$postDate : ${difference.inDays}, ${difference.inHours}, ${difference.inMinutes}");

  // 差が30日以上の場合
  if (difference.inDays >= 30) {
    return '1month';
  }
  // 差が7日以上、30日未満の場合
  else if (difference.inDays >= 7) {
    return '1w';
  }
  // 差が1日以上、7日未満の場合
  else if (difference.inDays >= 1) {
    return '${difference.inDays}d';
  }
  // 差が1時間以上、1日以内の場合
  else if (difference.inHours >= 1) {
    return '${difference.inHours}h';
  }
  // 差が1分以上、1時間以内の場合
  else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes}m';
  }
  // 差が1分以内の場合
  else if (difference.inSeconds < 60) {
    return 'just now';
  } else {
    return DateFormat('yyyy/MM/dd HH:mm').format(postDateTime);
  }
}
