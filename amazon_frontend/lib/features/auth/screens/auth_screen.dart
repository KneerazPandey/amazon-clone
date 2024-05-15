import 'package:amazon_frontend/core/common/custom_elevated_button.dart';
import 'package:amazon_frontend/core/common/widget.dart';
import 'package:amazon_frontend/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:amazon_frontend/core/constant/constant.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthType _authType;
  late GlobalKey<FormState> _signUpFormKey;
  late GlobalKey<FormState> _signInFormKey;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late AuthService _authService;

  @override
  void initState() {
    _authType = AuthType.signUp;
    _signUpFormKey = GlobalKey<FormState>();
    _signInFormKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authService = AuthService();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    await _authService.register(
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColor.greyBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(height: 8),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  RadioListTile(
                    tileColor: _authType == AuthType.signUp
                        ? Colors.white
                        : AppColor.greyBackgroundColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: AuthType.signUp,
                    groupValue: _authType,
                    title: const Text("Create Account."),
                    onChanged: (AuthType? type) {
                      if (type != null) {
                        setState(() {
                          _authType = type;
                        });
                      }
                    },
                  ),
                  if (_authType == AuthType.signUp)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.white,
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: <Widget>[
                            CustomTextFormField(
                              controller: _nameController,
                              hintText: "Name",
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              hintText: "Password",
                            ),
                            const SizedBox(height: 20),
                            CustomElevatedButton(
                              onPressed: () {
                                register();
                              },
                              text: 'Sign Up',
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  RadioListTile(
                    tileColor: _authType == AuthType.signIn
                        ? Colors.white
                        : AppColor.greyBackgroundColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: AuthType.signIn,
                    groupValue: _authType,
                    title: const Text("Sign-In."),
                    onChanged: (AuthType? type) {
                      if (type != null) {
                        setState(() {
                          _authType = type;
                        });
                      }
                    },
                  ),
                  if (_authType == AuthType.signIn)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.white,
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: <Widget>[
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _passwordController,
                              hintText: "Password",
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            CustomElevatedButton(
                              onPressed: () {},
                              text: 'Sign In',
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
