import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';

class ContainerAppBar extends StatelessWidget {
  const ContainerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 118, 10, 160),
                Color.fromARGB(255, 118, 186, 241)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: BitirmeConst.colorwhite,
                  ),
                  Text(
                    BitirmeConst.textAppointmen,
                    style:
                        TextStyle(color: BitirmeConst.colorwhite, fontSize: 25),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.mail,
                    color: BitirmeConst.colorwhite,
                    size: 25,
                  ),
                  BitirmeConst.sizedBoxWidht10,
                  Icon(
                    Icons.notification_add_outlined,
                    color: BitirmeConst.colorwhite,
                    size: 25,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
