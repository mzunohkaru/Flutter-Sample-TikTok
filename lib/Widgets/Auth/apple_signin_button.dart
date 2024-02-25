import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/Core/Auth/ViewModel/login_view_model.dart';
import 'package:tiktok_clone/Core/Root/View/splash_view.dart';
import 'package:tiktok_clone/Widgets/dialog_widget.dart';

class AppleSignInButton extends HookWidget {
  final LoginViewModel viewModel;

  const AppleSignInButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: !isLoading.value
            ? () async {
                isLoading.value = true;

                await viewModel.signInWithApple().then((result) {
                  if (result != null) {
                    showAuthErrorDialog(
                        context: context, title: "ログインエラー", content: result);
                  }
                });

                isLoading.value = false;

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SplashView()));
              }
            : null,
        icon: const FaIcon(
          FontAwesomeIcons.apple,
          color: Colors.white,
        ),
        label: isLoading.value
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: CircularProgressIndicator(color: Colors.white),
              )
            : const Text(
                'Sign in with Apple',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
