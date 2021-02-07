import 'dart:ui';

import 'package:flutter/material.dart';

const Color mainColor = Colors.green;
final Color backgroundColor = Colors.grey[50];
final secondaryColor = Colors.orange;
final ternaryColor = Colors.orangeAccent;

final mainColorGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mainColor, Colors.lightGreen, Colors.orange]);
