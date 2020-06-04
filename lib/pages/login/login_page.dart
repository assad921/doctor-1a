import 'package:doctor_companion/models/user.dart';
import 'package:flutter/material.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
        @override
        _LoginPageState createState() => new _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> implements LoginPageContract {
        BuildContext _ctx;
        bool _isLoading = false;
        final formKey = new GlobalKey<FormState>();
        final scaffoldKey = new GlobalKey<ScaffoldState>();

        String _email, _password;

        LoginPagePresenter _presenter;

        _LoginPageState() {
        _presenter = new LoginPagePresenter(this);
        }

        void _register() {
        Navigator.of(context).pushNamed("/register");
        }

        void _submit() {
        final form = formKey.currentState;

        if (form.validate()) {
        setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
        });
        }
        }

        void _showSnackBar(String text) {
        scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(text),
        ));
        }
        @override
        Widget build(BuildContext context) {
        _ctx = context;

        var loginBtn = new RaisedButton(
        onPressed: _submit,
        child: new Text("Login"),
        color: Colors.green,
        );


        var registerBtn = new RaisedButton(
        padding: const EdgeInsets.all(10.0),
        onPressed: _register,
        child: new Text("Register"),
        color: Colors.green,
        );
        var loginForm = new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//        new Text(
//          "Alshabibi-Test",
//          textScaleFactor: 2.0,
//        ),
        Image.network(
          'https://4.bp.blogspot.com/-CNYbMBs1WZE/Ws-2jFG7jjI/AAAAAAAABYE/LUmMkyr84DkRMoyYoVB4kWuelc2BnYcFwCLcBGAs/s1600/%25D8%25A5%25D8%25B9%25D8%25AF%25D8%25A7%25D8%25AF%2B%25D8%25A7%25D9%2584%25D8%25AA%25D9%2582%25D8%25A7%25D8%25B1%25D9%258A%25D8%25B1%2B%25D8%25A7%25D9%2584%25D9%2586%25D9%2581%25D8%25B3%25D9%258A%25D8%25A9.jpg',
            width: 500,
            height: 200,
//            fit:BoxFit.fill
        ),

        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: loginBtn),

        registerBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),

      key: scaffoldKey,

      body: new SingleChildScrollView(
//        padding: const EdgeInsets.only(top:10.0),
        child: new Center(

          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
    _showSnackBar(user.toString());
    }
    setState(() {
      _isLoading = false;
    });
    if(user.flaglogged == "logged"){
      print("Logged");
      Navigator.of(context).pushNamed("/home");
    }else{
      print("Not Logged");
    }
  }
}
