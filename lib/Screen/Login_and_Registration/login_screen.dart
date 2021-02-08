import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword;
  @override
  void initState() {
    super.initState();
    _showPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          height: _size.height,
          width: _size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        SharedPreferences.getInstance().then(
                            (sharedPreferences) => sharedPreferences.setBool(
                                "canSkipLogin", true));
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "screenSelector", ModalRoute.withName("/"));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Skip >>",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(25, -15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: _size.height * 0.2,
                          width: _size.height * 0.2,
                          constraints: BoxConstraints(
                              minHeight: 140.0,
                              maxHeight: 160.0,
                              minWidth: 140.0,
                              maxWidth: 160.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage("assets/Images/snacks.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Welcome Back !",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _inputField(),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Forget Password",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          onPressed: () {
                            Provider.of<PersonProvider>(context, listen: false)
                                .login();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "screenSelector", ModalRoute.withName("/"));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed("registration"),
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "New Here? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "Create a new account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.phone),
            Flexible(
              child: Container(
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.beenhere),
            Flexible(
              child: Container(
                height: 60,
                child: TextField(
                  obscureText: _showPassword,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
