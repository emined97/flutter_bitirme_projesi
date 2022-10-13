import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class ContainerCategoryDetail extends StatelessWidget {
  const ContainerCategoryDetail({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 5.5,
        width: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BitirmeConst.borderRadiusCircular10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: BitirmeConst.colorblue,
                      size: 40,
                    ),
                  ],
                ),
              ),
              BitirmeConst.sizedBoxHeight5,
              Text(
                title,
                style: TextStyle(
                    color: BitirmeConst.colorblack,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              BitirmeConst.sizedBoxHeight10,
              Text(subtitle,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
