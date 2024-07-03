import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String text;
  const FollowButton(
      {required this.text,
      Key? key,
      this.function,
      required this.backgroundColor,
      required this.borderColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 1),
      child: TextButton(
        onPressed: function,
        child: Container(
          // alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: 200,
          height: 27,
        ),
      ),
    );
  }
}
