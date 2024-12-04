import 'package:flutter/material.dart';
import 'package:login_app/screens/dashboard_screen.dart';
import 'package:login_app/widgets/custom_textfield.dart';
import 'package:login_app/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void validateLogin() {
      const String validEmail = 'test@gmail.com';
      const String validMobile = '9876543210';
      const String validPassword = 'test@123';

      if ((emailController.text == validEmail ||
              emailController.text == validMobile) &&
          passwordController.text == validPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid Credentials'),
            content: const Text('Incorrect Email or Password.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              label: 'Email / Mobile Number',
              icon: Icons.email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: validateLogin,
            ),
          ],
        ),
      ),
    );
  }
}
