import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Core/Profile/ViewModel/profile_view_model.dart';
import 'package:tiktok_clone/Core/Root/View/splash_view.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Repository/theme_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class SettingsView extends ConsumerWidget {
  final ProfileViewModel viewModel;

  const SettingsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Settings',
          style: kAppBarTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          menuItem(menuType.darkMode, ref),
          menuItem(menuType.activeStatus, ref),
          menuItem(menuType.accessibility, ref),
          menuItem(menuType.privacyAndSafety, ref),
          menuItem(menuType.notifications, ref),
          const Divider(),
          ListTile(
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await viewModel.signOut(ref: ref);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SplashView(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Delete Account',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              // アカウント削除処理をここに書く
            },
          ),
        ],
      ),
    );
  }

  Widget menuItem(menuType type, WidgetRef ref) {
    IconData icon;
    Color color;
    String title;
    Function function;

    switch (type) {
      case menuType.darkMode:
        icon = Icons.nights_stay;
        color = Colors.black;
        title = 'ダークモード';
        ref = ref;
        function = () {
          // ダークモードの切り替え処理
          final currentTheme = ref.read(themeProvider);
          final newTheme =
              currentTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          ref.read(themeProvider.notifier).switchTheme(newTheme);
        };
        break;
      case menuType.activeStatus:
        icon = Icons.safety_divider_outlined;
        color = Colors.green;
        title = 'アクティブステータス';
        function = () {
          // アクティブステータスの切り替え処理
        };
        break;
      case menuType.accessibility:
        icon = Icons.accessibility;
        color = Colors.black;
        title = 'アクセシビリティ';
        function = () {
          // アクセシビリティ設定へのナビゲーション処理
        };
        break;
      case menuType.privacyAndSafety:
        icon = Icons.privacy_tip;
        color = Colors.blue;
        title = 'プライバシーとセキュリティ';
        function = () {
          // プライバシーとセキュリティ設定へのナビゲーション処理
        };
        break;
      case menuType.notifications:
        icon = Icons.notifications;
        color = Colors.purple;
        title = '通知';
        function = () {
          // 通知設定へのナビゲーション処理
        };
        break;
      default:
        icon = Icons.error;
        color = Colors.black;
        title = 'エラー';
        function = () {};
    }

    return ListTile(
      leading: CircleAvatar(
        radius: 14,
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
      onTap: () => function(),
    );
  }
}

enum menuType {
  darkMode,
  activeStatus,
  accessibility,
  privacyAndSafety,
  notifications
}
