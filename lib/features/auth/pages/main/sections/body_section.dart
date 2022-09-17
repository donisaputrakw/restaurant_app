part of '../page.dart';

class _BodySection extends StatelessWidget {
  const _BodySection({
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      children: [
        const SizedBox(height: Dimens.dp16),
        Hero(
          tag: MainAssets.logo,
          child: Image.asset(
            MainAssets.logo,
            width: Dimens.dp150,
            height: Dimens.dp150,
          ),
        ),
        Text(
          'Login Form',
          style: textTheme.headline3?.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Dimens.dp50),
        RegularInput(
          controller: emailController,
          hintText: 'Email',
          prefixIcon: Icons.email_rounded,
          inputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: Dimens.dp16),
        RegularInput(
          controller: passwordController,
          prefixIcon: Icons.lock_rounded,
          obscureText: true,
          hintText: 'Password',
          inputType: TextInputType.visiblePassword,
        ),
        const SizedBox(height: Dimens.dp50),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Don\'t have an account?',
            style: textTheme.subtitle2?.copyWith(
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Register',
                style: textTheme.subtitle2?.copyWith(
                  color: AppColors.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/register', (route) => false);
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}
