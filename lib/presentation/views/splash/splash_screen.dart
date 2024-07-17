import 'package:flutter/material.dart';
import 'package:profinder/common/constants.dart';
import 'package:profinder/domain/auth/auth_service.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  rememberMe(context) async {
    bool isRemembered = await AuthService().rememberMe();
    final routeToRedirect = isRemembered == true ? appRoute : authRoute;

    Navigator.of(context).pushNamed(routeToRedirect);
  }

  @override
  Widget build(BuildContext context) {
    rememberMe(context);

    return Scaffold(
      body: Center(
        child: ContentWrapper(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              color: const Color.fromARGB(255, 213, 57, 57),
              child: const CircularProgressIndicator(),
            ),
            const TitleSection('Pro Finder')
          ],
          // child: Image.asset('logoPath'),
        ),
      ),
    );
  }
}
