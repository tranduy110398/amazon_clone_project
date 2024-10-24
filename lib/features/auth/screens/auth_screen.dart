import 'package:amazon_clone_project/common/widgets/custom_button.dart';
import 'package:amazon_clone_project/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_project/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  // This line defines an instance of an Auth enum or class, which likely
  // represents different authentication states, like signing up or signing in.
  // Auth.signup indicates that the _auth variable is currently set to a signup
  // state. This is useful for managing different views or behaviors in your app
  // depending on whether the user is trying to sign up or sign in.

  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  // In Flutter, you use a TextEditingController to manage the state of a text
  // field. It keeps track of the input's current value and allows you to listen
  // for changes or update the value programmatically.

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  // In Flutter, you need to dispose of the TextEditingController when it's no
  // longer needed (typically in the dispose method) to prevent memory leaks.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: _nameController,
                      hintText: "Name",
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: _emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: _passwordController,
                      hintText: "Password",
                    ),
                    const SizedBox(height: 10),
                    CustomButton(text: 'Sign Up', onTap: () {})
                  ],
                ),
              ),
            ListTile(
              title: const Text(
                "Sign-In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Form(
                key: _signInFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: _emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: _passwordController,
                      hintText: "Password",
                    ),
                    const SizedBox(height: 10),
                    CustomButton(text: 'Sign In', onTap: () {})
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
