import 'package:chat_app/components/auth_button.dart';
import 'package:chat_app/components/confirm_button.dart';
import 'package:chat_app/components/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.app_registration,
              size: 120,
              color: Colors.green,
            ),
            const Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              labelText: 'Nome',
            ),
            CustomInput(
              labelText: 'Email',
            ),
            CustomInput(
              labelText: 'Telefone',
            ),
            CustomInput(
              labelText: 'Senha',
              isObscure: true,
            ),
            ConfirmButton(
              labelText: 'Cadastrar',
            ),
          ],
        ),
      ),
    );
    ;
  }
}
