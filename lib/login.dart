import 'package:flutter/material.dart';
import 'package:fluttersample/todo.dart';
import 'package:fluttersample/util/caller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var languages = <String>['Türkçe', 'English'];
  var isTurkish = true;
  bool _isPasswordVisible = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isTurkish ? "Giriş yap / Kayıt ol Sayfası" : "Sign in / Sign up Page"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            emptyInterval(multiplier: 2),
            languageDropDown(),
            emptyInterval(multiplier: 3),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emptyInterval(multiplier: 2),
                  buildTextWidget(userNameController,
                      isTurkish ? "Kullanıcı adı" : "User name"),
                  emptyInterval(multiplier: 2),
                  buildTextWidget(
                      passwordController, isTurkish ? "Şifre" : "Password",
                      hasHiddenIcon: true),
                ],
              ),
            ),
            emptyInterval(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButtonWidget(isTurkish ? "Giriş" : "Sign in"),
                  emptyInterval(multiplier: 2),
                  buildButtonWidget(isTurkish ? "Kayıt ol" : "Sign up"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyInterval({int multiplier = 1}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 40 * multiplier,
        height: MediaQuery.of(context).size.height / 40 * multiplier);
  }

  Widget languageDropDown() {
    return Container(
      alignment: Alignment.center,
      height: 30.0,
      child: DropdownButton<String>(
        underline: Container(), //to remove underline
        items: languages.map((String value) {
          return new DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        value: isTurkish ? languages[0] : languages[1],
        onChanged: (String? newVal) {
          setState(() {
            isTurkish = newVal == languages[0];
          });
        },
      ),
    );
  }

  Widget buildTextWidget(TextEditingController controller, String hintText,
      {bool hasHiddenIcon = false}) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: MediaQuery.of(context).size.height / 10,
      child: TextField(
        textAlign: TextAlign.left,
        controller: controller,
        obscureText: hasHiddenIcon ? !_isPasswordVisible : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: hasHiddenIcon
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget buildButtonWidget(String text) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              API.login(
                isTurkish ? "TR" : "EN",
                userNameController.text,
                passwordController.text,
              )
                  .then((value) {
                if (value.isSuccess == true) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Todo()));
                } else {
                  _popup(context, value.errorMessage.toString());
                }
              });
            },
            child: Text(
              text,
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  _popup(BuildContext context, String? message){
    Alert(
        context: context,
        title: message ?? (isTurkish ? "Geçici süre hizmet veremiyoruz" : "We are temporarily unavailable"),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context,rootNavigator: true).pop(),
            child: Text(
              isTurkish ? "Tamam" : "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
