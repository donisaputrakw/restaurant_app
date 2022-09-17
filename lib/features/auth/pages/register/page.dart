import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

part 'sections/body_section.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    _nameController.addListener(() {
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
          nameController: _nameController,
          emailController: _emailController,
          passwordController: _passwordController,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          child: ElevatedButton(
            onPressed: (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _nameController.text.isNotEmpty)
                ? () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/main',
                      (route) => false,
                    );
                  }
                : null,
            child: Text(
              'Register',
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
