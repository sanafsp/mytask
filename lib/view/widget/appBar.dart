// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

appbar1(context, value) {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text(
      value,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
