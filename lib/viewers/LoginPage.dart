import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:app_tinterview/models/LoginLogoutGoogle.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323232),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                (Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      "images/logo.png",
                      width: 120,
                      height: 120,
                    ))),
                Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: SignInButton(
                      Buttons.Google,
                      text: "Login com o Google",
                      onPressed: () async {
                        await _loginController.signInWithGoogle();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaPrincipal()),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: SignInButton(
                      Buttons.GitHub,
                      text: "Login com o GitHUb",
                      onPressed: () {
                        //instanciar a função de login com o github
                      },
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Login com o Facebook",
                      onPressed: () {
                        //instanciar a função de login com o facebook
                      },
                    )),
                Padding(padding: EdgeInsets.only(top: 16, bottom: 4)),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaPrincipal()));
                  },
                  child: Text('Iniciar como convidado',
                      style: TextStyle(
                          color: Color(0xFFE7D110),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                )),
              ],
            ),
          ))),
    );
  }
}
