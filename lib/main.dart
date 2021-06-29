import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var languages = <String>['Türkçe', 'English'];
  var isTurkish = true;
  bool _isPasswordVisible = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              //TODO FORGOT PASSWORD SCREEN GOES HERE
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
}
