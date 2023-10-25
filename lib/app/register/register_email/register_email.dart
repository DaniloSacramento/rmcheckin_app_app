import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rmcheckin/app/register/register_codigo/register_codigo_page.dart';
import 'package:rmcheckin/app/widget/app_color.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
  static String verify = '';
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController telefoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  sendOtp() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: "+55${telefoneController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) {});
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'Codigo invalido') {
            print('Erro');
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          MyPhone.verify = verificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterCodigo(
                        verificationId: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: Duration(seconds: 120));
  }

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: darkBlueColor,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Antes de tudo,\nvamos criar\nsua conta.",
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(color: darkBlueColor, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Informe seu numero de telefone",
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: darkBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: telefoneController,
                  keyboardType: TextInputType.phone,
                  // inputFormatters: [maskFormatter],
                  cursorColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite um numero de telefone válido';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "(00) 00000-0000",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yellowColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        sendOtp();
                      }
                    },
                    child: Text(
                      'Continuar',
                      style: GoogleFonts.dosis(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
