import 'package:flutter/material.dart';
import 'package:profinder/common/constants.dart';
import 'package:profinder/domain/auth/auth_service.dart';
import 'package:profinder/presentation/components/atoms/button.dart';
import 'package:profinder/presentation/components/atoms/input.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading = false;

  _onValidate(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    AuthPayload payload = AuthPayload(
      mail: mailController.value.text,
      password: passwordController.value.text,
    );

    await AuthService().login(payload);

    setState(() {
      _loading = false;
      Navigator.of(context).pushNamed(appRoute);
    });
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSection('Login'),
                  const SizedBox(height: 40),
                  Input(
                    type: InputType.text,
                    label: "Email",
                    controller: mailController,
                  ),
                  const SizedBox(height: 20),
                  Input(
                    type: InputType.password,
                    label: "Password",
                    controller: passwordController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Button(
              onPressed: () => _onValidate(context),
              text: "Valider",
              isLoading: _loading,
            )
          ],
        ),
      ),
    );
  }
}

enum AuthView { signup, login }
