import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tiktok_clone/Core/Auth/View/registration_view.dart';
import 'package:tiktok_clone/Core/Auth/ViewModel/login_view_model.dart';
import 'package:tiktok_clone/Core/Root/View/splash_view.dart';
import 'package:tiktok_clone/Widgets/Auth/apple_signin_button.dart';
import 'package:tiktok_clone/Widgets/Auth/google_signin_button.dart';
import 'package:tiktok_clone/Widgets/dialog_widget.dart';
import 'package:tiktok_clone/Widgets/textfiled_widget.dart';

class LoginView extends HookWidget {
  final viewModel = LoginViewModel();
  final enabled = false;

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    //　画面幅の取得
    // final width = MediaQuery.of(context).size.width;
    final mailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscure = useState(true);
    final isValidation = useState(false);
    final isLoading = useState(false);

    useEffect(() {
      void listener() {
        isValidation.value = mailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      }

      mailController.addListener(listener);
      passwordController.addListener(listener);
      return () {
        mailController.removeListener(listener);
        passwordController.removeListener(listener);
      };
    }, [mailController, passwordController]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                "assets/logo.png",
                scale: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              RegistrationTextFieldWidget(
                mailController: mailController,
                labelText: "メールアドレス",
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextFiledWidget(
                  passwordController: passwordController,
                  obscure: obscure,
                  labelText: "パスワード"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: isValidation.value && !isLoading.value
                      ? () async {
                          isLoading.value = true;

                          await viewModel
                              .login(
                                  email: mailController.text,
                                  password: passwordController.text)
                              .then((result) {
                            if (result != null) {
                              showAuthErrorDialog(
                                  context: context,
                                  title: "ログインエラー",
                                  content: result);
                            }
                          });

                          isLoading.value = false;

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SplashView(),
                            ),
                          );
                        }
                      : null,
                  child: isLoading.value
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text(
                          "Log In",
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GoogleSignInButton(viewModel: viewModel,),
              const SizedBox(
                height: 15,
              ),
              AppleSignInButton(viewModel: viewModel,),
              const Spacer(),
              const Divider(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            RegistrationView(),
                      ));
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.blue),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
