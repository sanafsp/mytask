import 'package:flutter/material.dart';

button({required String text,void Function()? buttonAction}){
return  ElevatedButton(onPressed: buttonAction, child: Text(text,style: TextStyle(color: Colors.white),),
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
    );
}