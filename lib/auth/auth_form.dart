import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  Function(String login, String password) onClickLogin;
  bool isLoading;

  AuthForm({
    @required this.isLoading,
    @required this.onClickLogin
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController(text: "juillianlee@livetouch.com.br");
    final _passwordController = TextEditingController(text: "abc123");


    final styleFields = TextStyle(
        height: 1.5,
        color: Colors.black
    );

    _onWidgetDidBuild(Function callback) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        callback();
      });
    }

    Widget _usernameField() {
      return TextFormField(
          controller: _usernameController,
          decoration: InputDecoration(
              hintText: "Digite seu login",
              filled: true,
              fillColor: Colors.white
          ),
          style: styleFields
      );
    }

    Widget _passwordField() {
      return TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
            hintText: "Digite sua senha",
            filled: true,
            fillColor: Colors.white
        ),
        obscureText: true,
        style: styleFields,
      );
    }

    _onLoginButtonPressed() {
      if(_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
        _onWidgetDidBuild(() {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Informe seu login ou senha\npara realizar o login',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.red,
            ),
          );
        });
      } else {
        widget.onClickLogin(_usernameController.text, _passwordController.text);
      }
    }


    Widget _btnLogin() {
      Widget child = Text("Entrar",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),
      );

      if(widget.isLoading) {
        child = CircularProgressIndicator(
          backgroundColor: Colors.white,
        );
      }

      return RaisedButton(
        onPressed: !widget.isLoading ? _onLoginButtonPressed : null,
        color: Color.fromARGB(255, 58,177,230),
        child: child,
      );
    }

    Widget _form() {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40),
              child: _usernameField(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: _passwordField(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: _btnLogin(),
            )
          ],
        ),
      );
    }

    return _form();
  }
}
