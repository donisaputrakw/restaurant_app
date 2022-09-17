import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

part 'sections/body_section.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: _BodySection(
          emailController: _emailController,
          passwordController: _passwordController,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          child: ElevatedButton(
            onPressed: (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty)
                ? () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/main',
                      (route) => false,
                    );
                  }
                : null,
            child: Text(
              'Login',
              style: textTheme.subtitle2?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
