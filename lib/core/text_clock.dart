import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class TextClock extends StatelessWidget {
  const TextClock({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: BitirmeConst.colorgrey),
        ));
  }
}
