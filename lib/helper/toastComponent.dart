import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:toast/toast.dart';

class ToastComponent {
  static showDialog(String msg, {duration = 5, gravity = 0}) {
    ToastContext().init(OneContext().context!);
    Toast.show(msg,
        duration: duration != 0 ? duration : Toast.lengthShort,
        gravity: gravity != 0 ? gravity : Toast.bottom,
        backgroundColor: Color.fromRGBO(239, 239, 239, .9),
        textStyle: TextStyle(color: Colors.black, fontSize: 17),
        border: Border.all(
            style: BorderStyle.solid,
            color: Colors.transparent,
            // strokeAlign: StrokeAlign.center,
            width: 0),
        backgroundRadius: 6);
  }

  static errorToast(String msg, {duration = 5, gravity = 0}) {
    ToastContext().init(OneContext().context!);
    String newMessage = '';
    if (msg.contains('Exception: ')) {
      newMessage = msg.toString().replaceFirst('Exception: ', '');
    } else {
      newMessage = msg;
    }

    Toast.show(newMessage,
        duration: duration != 0 ? duration : Toast.lengthShort,
        gravity: gravity != 0 ? gravity : Toast.bottom,
        backgroundColor: Colors.red,
        textStyle: TextStyle(color: Colors.white, fontSize: 17),
        border: Border.all(
            style: BorderStyle.solid,
            color: Colors.transparent,
            // strokeAlign: StrokeAlign.center,
            width: 0),
        backgroundRadius: 6);
  }

  static successFullToast(String msg, {duration = 5, gravity = 0}) {
    ToastContext().init(OneContext().context!);
    String newMessage = '';
    if (msg.contains('Exception: ')) {
      newMessage = msg.toString().replaceFirst('Exception: ', '');
    } else {
      newMessage = msg;
    }

    Toast.show(newMessage,
        duration: duration != 0 ? duration : Toast.lengthShort,
        gravity: gravity != 0 ? gravity : Toast.bottom,
        backgroundColor: Colors.green,
        textStyle: TextStyle(color: Colors.white, fontSize: 17),
        border: Border.all(
            style: BorderStyle.solid,
            color: Colors.transparent,
            // strokeAlign: StrokeAlign.center,
            width: 0),
        backgroundRadius: 6);
  }
}
