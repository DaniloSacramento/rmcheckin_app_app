import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmcheckin/app/widget/app_color.dart';

class EsqueciSenha extends StatefulWidget {
  EsqueciSenha({super.key});

  @override
  State<EsqueciSenha> createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    double telaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: darkBlueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Esqueceu?\nTudo bem.',
                style: GoogleFonts.dosis(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: darkBlueColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: telaHeight * 0.001,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                'Digite seu endereco de e-mail para redefinir sua \nsenha. Enviaremos um e-mail com o passo a passo, portanto, não esqueça de conferir\ntambém a sua caixa de spam.',
                textAlign: TextAlign.start,
                style: GoogleFonts.dosis(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: telaHeight * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira um endereço de e-mail.';
                        }
                        if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                          return 'Por favor, insira um endereço de e-mail válido.';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: GoogleFonts.dosis(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
