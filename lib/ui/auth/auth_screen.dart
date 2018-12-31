import 'package:flutter/material.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_app_epics/ui/auth/auth_form.dart';
import 'package:flutter_app_epics/ui/auth/auth_screen_vm.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, AuthScreenVM>(
      converter: (store) => AuthScreenVM.fromStore(store),
      builder: (context, state) {

        return Scaffold(
          backgroundColor: Color.fromARGB(255, 10, 54, 95),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 80, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _logo(),
                      AuthForm(
                        isLoading: state.isLoading,
                        onClickLogin: state.onLoginPressed,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: _forgotPassword(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _facebookSignIn(),
                            _googleSignIn()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: _fingerprintSignIn(),
                      )
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }

  Widget _logo() {
    return Image.asset(
      "assets/images/livecom_logo.png",
      width: 200,
    );
  }

  Widget _forgotPassword() {
    return Text(
      "Esqueci minha senha",
      style: TextStyle(
          color: Color.fromARGB(255, 0,132,197),
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _facebookSignIn() {
    return GestureDetector(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset("assets/images/facebook_logo.png", width: 60, height: 60),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Entrar com\nFacebook",
              style: TextStyle(
                  color: Color.fromARGB(255, 130,151,180),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _googleSignIn() {
    return GestureDetector(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset("assets/images/google+.png", width: 60, height: 60),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Entrar com\nGoogle+",
              style: TextStyle(
                  color: Color.fromARGB(255, 130,151,180),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _fingerprintSignIn() {
    return Text(
      "Entrar com sua digital\nToque no sensor",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color.fromARGB(255, 130,151,180),
          fontSize: 14
      ),
    );
  }

}
