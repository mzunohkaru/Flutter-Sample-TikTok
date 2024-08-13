import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Core/Root/View/splash_view.dart';
import 'package:tiktok_clone/Provider/theme_provider.dart';
import 'package:tiktok_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 画面の向きを縦に固定
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  FlexScheme usedScheme = FlexScheme.blueWhale;

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok',
      themeMode: ref.watch(themeProvider),
      theme: FlexThemeData.light(
        scheme: usedScheme,
        appBarElevation: 0.5,
        useMaterial3: true,
        typography: Typography.material2021(platform: defaultTargetPlatform),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: usedScheme,
        appBarElevation: 2,
        useMaterial3: true,
        typography: Typography.material2021(platform: defaultTargetPlatform),
      ),
      home: SplashView(),
    );
  }
}
