import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class TextGrey extends StatelessWidget {
  const TextGrey({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? BitirmeConst.stop,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: BitirmeConst.colorgrey, fontSize: 16),
    );
  }
}
