import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class ContainerCalendarDate extends StatelessWidget {
  const ContainerCalendarDate({
    Key? key,
    required this.text,
    required this.texttwo,
    required this.color,
    required this.colortwo,
  }) : super(key: key);

  final String text;
  final String texttwo;
  final Color color;
  final Color colortwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 7,
      color: BitirmeConst.colorwhite,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          BitirmeConst.sizedBoxHeight10,
          Text(texttwo, style: TextStyle(color: colortwo, fontSize: 20))
        ],
      ),
    );
  }
}
