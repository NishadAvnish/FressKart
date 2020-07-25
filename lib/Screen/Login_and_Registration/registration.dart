import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> _formKey;
  GlobalKey<FormState> _passwordFormKey;
  bool _isValidEntries, _isTimerRunning;
  int _seconds;
  Timer _timer;
  bool _showPassword;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _passwordFormKey = GlobalKey<FormState>();
    _isValidEntries = false;
    _isTimerRunning = false;
    _seconds = 5;
    _showPassword = true;
  }

  String _validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (value.length == 0 || !regExp.hasMatch(value)) {
      setState(() {
        _isValidEntries = false;
      });
      return 'Please enter mobile number';
    }
    setState(() {
      _isValidEntries = true;
    });
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 5) {
      setState(() {
        _isValidEntries = false;
      });
      return "Too short Password";
    }

    setState(() {
      _isValidEntries = true;
    });
    return null;
  }

  void _startTimer() {
    _formKey.currentState.validate();
    _passwordFormKey.currentState.validate();
    _seconds = 5;
    if (_isValidEntries) {
      setState(() {
        _isTimerRunning = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (perSeconds) {
        setState(() {
          _seconds -= 1;
        });
      });
    }
  }

  void _cancelTimer() {
    if (_timer != null && _seconds == 0) {
      _timer.cancel();

      setState(() {
        _isTimerRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    _cancelTimer();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: _mediaQuery.padding.top + 10, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _appBar(),
                SizedBox(
                  height: 40,
                ),
                _phoneNumberText(),
                SizedBox(
                  height: 15,
                ),
                _passwordField(),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () => _startTimer(),
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    disabledColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _isTimerRunning
                          ? Text("$_seconds",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.white))
                          : Text("Send OTP",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                if (_isTimerRunning) _otpPart()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Registration",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed("login"),
          child: Text(
            "Go to Login",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: mainColor),
          ),
        ),
      ],
    );
  }

  Widget _phoneNumberText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Enter Your Phone Number",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 15,
        ),
        Form(
          key: _formKey,
          child: TextFormField(
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                prefixText: "+91 ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            validator: (value) => _validateMobile(value),
          ),
        )
      ],
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Enter Your Password",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 10.0,
        ),
        Form(
          key: _passwordFormKey,
          child: TextFormField(
              obscureText: _showPassword,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  child: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              validator: (val) => _validatePassword(val)),
        ),
      ],
    );
  }

  Widget _otpPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Enter OTP",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: TextFormField(
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.center,
          child: MaterialButton(
            onPressed: () {},
            color: mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            disabledColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Submit",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
