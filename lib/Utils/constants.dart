import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:tiktok_clone/Core/Auth/Service/auth_service.dart';
import 'package:tiktok_clone/Serivce/post_service.dart';
import 'package:tiktok_clone/Serivce/upload_service.dart';
import 'package:tiktok_clone/Serivce/user_service.dart';

final authService = AuthService();
final uploadService = UploadService();
final postService = PostService();

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;

final UserCollections = firestore.collection('users');
final PostCollections = firestore.collection('posts');

final FollowingCollections = firestore.collection("following");
final FollowerCollections = firestore.collection("followers");

final userService = UserService();

/// シンプルなプリローダー
const preloader = Center(child: CircularProgressIndicator());

/// user name スタイルテキストの定数
const TextStyle kUsernameTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
);

/// sub スタイルテキストの定数
const TextStyle kSubTextStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: Colors.grey,
  fontSize: 12,
);

/// AppBar スタイルテキストの定数
const TextStyle kAppBarTitleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final logger = Logger();
