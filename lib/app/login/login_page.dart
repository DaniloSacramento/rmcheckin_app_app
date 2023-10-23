import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmcheckin/app/esqueci_senha/esqueci_senha_page.dart';
import 'package:rmcheckin/app/widget/app_color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  bool isLoading = false;
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  final senhaController = TextEditingController();
  bool validarSenha(String senha) {
    if (senha.length < 6) {
      return false;
    }

    if (!senha.contains(RegExp(r'\d'))) {
      return false;
    }

    if (!senha.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    if (!senha.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    if (!senha.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    if (senha.contains(RegExp(r'\s'))) {
      return false;
    }

    return true;
  }

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
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                ),
                child: Text("Seja, bem-vindo!",
                    style: GoogleFonts.dosis(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: darkBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      // labelText: "E-mail",
                      // labelStyle: const TextStyle(
                      //   color: Colors.black,
                      // ),
                      hintText: 'E-mail', hintStyle: GoogleFonts.dosis(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor, insira um e-mail.';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)) {
                        return 'Digite um e-mail correto ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      // labelText: "Senha",
                      // labelStyle: const TextStyle(
                      //   color: Colors.black,
                      // ),
                      hintText: 'Senha', hintStyle: GoogleFonts.dosis(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: _showPassword == false ? true : false,
                    controller: senhaController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira uma senha.';
                      }
                      if (!validarSenha(value)) {
                        return 'A senha não atende aos critérios de validação.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EsqueciSenha(),
                              ));
                        },
                        child: Text(
                          "Esqueceu sua senha",
                          style: GoogleFonts.dosis(
                            textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellowColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: Text('Entrar')),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
