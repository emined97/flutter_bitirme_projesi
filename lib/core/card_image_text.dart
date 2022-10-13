import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class CardImageTextDesign extends StatelessWidget {
  const CardImageTextDesign({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 170,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BitirmeConst.borderRadiusCircular10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BitirmeConst.borderRadiusCircular10,
                  child: Image.asset(image)),
              BitirmeConst.sizedBoxHeight10,
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
