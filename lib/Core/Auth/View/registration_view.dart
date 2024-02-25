import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tiktok_clone/Core/Auth/ViewModel/registration_view_model.dart';
import 'package:tiktok_clone/Core/Root/View/splash_view.dart';
import 'package:tiktok_clone/Widgets/dialog_widget.dart';
import 'package:tiktok_clone/Widgets/textfiled_widget.dart';

class RegistrationView extends HookWidget {
  final viewModel = RegistrationViewModel();

  RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final mailController = useTextEditingController();
    final usernameController = useTextEditingController();
    final addressController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscure = useState(true);
    final isValidation = useState(false);
    final isLoading = useState(false);

    useEffect(() {
      void listener() {
        isValidation.value = mailController.text.isNotEmpty &&
            usernameController.text.isNotEmpty &&
            addressController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      }

      mailController.addListener(listener);
      usernameController.addListener(listener);
      addressController.addListener(listener);
      passwordController.addListener(listener);
      return () {
        mailController.removeListener(listener);
        usernameController.removeListener(listener);
        addressController.removeListener(listener);
        passwordController.removeListener(listener);
      };
    }, [
      mailController,
      usernameController,
      addressController,
      passwordController
    ]);

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
              RegistrationTextFieldWidget(
                mailController: usernameController,
                labelText: "ユーザー名",
              ),
              const SizedBox(
                height: 20,
              ),
              RegistrationTextFieldWidget(
                mailController: addressController,
                labelText: "アドレス",
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextFiledWidget(
                  passwordController: passwordController,
                  obscure: obscure,
                  labelText: "パスワード"),
              const SizedBox(
                height: 30,
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
                              .signUp(
                                  email: mailController.text,
                                  username: usernameController.text,
                                  address: addressController.text,
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
                          "Sign Up",
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const Spacer(),
              const Divider(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.blue),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign In',
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

  Widget passwordTextFiled(
      {required TextEditingController controller,
      required ValueNotifier<bool> obscure,
      required Function function}) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscure.value,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: function(),
            icon: Icon(obscure.value ? Icons.visibility_off : Icons.visibility),
          ),
          labelText: 'パスワード',
        ),
      ),
    );
  }
}
