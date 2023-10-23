import 'package:flutter/material.dart';
import 'package:rmcheckin/app/login/login_page.dart';
import 'package:rmcheckin/app/register/register_email/register_email.dart';
import 'package:rmcheckin/app/widget/app_color.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    double telaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkBlueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: telaHeight * 0.68,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellowColor,
                  minimumSize: const Size(double.infinity, 50), // Largura total e altura mínima
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPhone(),
                    ),
                  );
                },
                child: Text('Quero me cadastrar'),
              ),
            ),
            SizedBox(
              height: telaHeight * 0.015,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: const Size(double.infinity, 50), // Largura total e altura mínima
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Já tenho conta'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
