import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class TextBlack extends StatelessWidget {
  const TextBlack({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? BitirmeConst.stop,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3?.copyWith(
          fontWeight: FontWeight.bold,
          color: BitirmeConst.colorblack,
          fontSize: 27),
    );
  }
}
