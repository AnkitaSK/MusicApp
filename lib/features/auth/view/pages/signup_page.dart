import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_textfield.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authViewmodelProvider)?.isLoading == true;
    ref.listen(
      authViewmodelProvider,
      (_, next) {
        next?.when(
            data: (data) {
              showSnackBar(
                  context, 'Account created successfully! Please login.');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            error: (error, stackTrace) {
              showSnackBar(context, error.toString());
            },
            loading: () {});
      },
    );
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Loader()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextfield(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextfield(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextfield(
                      hintText: 'Password',
                      controller: passwordController,
                      isObsecure: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthGradientButton(
                      title: 'Sign Up',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(authViewmodelProvider.notifier)
                              .signupUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: Pallete.gradient2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}