import 'package:chat_app/components/auth_button.dart';
import 'package:chat_app/components/confirm_button.dart';
import 'package:chat_app/components/custom_input.dart';
import 'package:chat_app/views/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.message_outlined,
              size: 120,
              color: Colors.green,
            ),
            CustomInput(
              labelText: 'Email',
            ),
            CustomInput(
              labelText: 'Password',
              isObscure: true,
            ),
            ConfirmButton(labelText: 'Entrar'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ainda não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('Inscreva-se'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthButton(
                  image:
                      'https://cdn-icons-png.flaticon.com/512/2702/2702602.png',
                ),
                AuthButton(
                  image:
                      'https://static.vecteezy.com/system/resources/previews/016/716/481/original/facebook-icon-free-png.png',
                ),
                AuthButton(
                  image: 'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
