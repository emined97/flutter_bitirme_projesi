import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/core/card_image_text.dart';
import 'package:flutter_bitirme_projesi/core/container_category_detail.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BitirmeConst.colorLoginpageBack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bigContainer(context),
            Padding(
              padding: BitirmeConst.paddingLoginpage20,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerCategoryDetail(
                            title: BitirmeConst.lpContTitleOne,
                            subtitle: BitirmeConst.lpContSubtitleOne,
                            icon: Icons.calendar_month_outlined),
                        BitirmeConst.sizedBoxWidht10,
                        ContainerCategoryDetail(
                            title: BitirmeConst.lpContTitleTwo,
                            subtitle: BitirmeConst.lpContSubtitleTwo,
                            icon: Icons.filter_frames_outlined),
                      ],
                    ),
                  ),
                  BitirmeConst.sizedBoxHeight20,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerCategoryDetail(
                            title: BitirmeConst.lpContTitleThre,
                            subtitle: BitirmeConst.lpContSubtitleThre,
                            icon: Icons.app_settings_alt_outlined),
                        BitirmeConst.sizedBoxWidht10,
                        ContainerCategoryDetail(
                            title: BitirmeConst.lpContTitleFour,
                            subtitle: BitirmeConst.lpContSubtitleFour,
                            icon: Icons.edit_notifications_sharp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BitirmeConst.sizedBoxHeight5,
            Text(
              BitirmeConst.loginDiscover,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            BitirmeConst.sizedBoxHeight5,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardImageTextDesign(
                      text: BitirmeConst.loginCardText,
                      image: BitirmeConst.coronaVirus),
                  BitirmeConst.sizedBoxWidht5,
                  CardImageTextDesign(
                      text: BitirmeConst.loginCardTwoText,
                      image: BitirmeConst.coronaVirusTwo)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _bigContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              BitirmeConst.colorLoginpageGradPurple,
              BitirmeConst.colorLoginpageGradWhite,
            ]),
      ),
      child: Padding(
        padding: BitirmeConst.paddingLoginpage60,
        child: Column(
          children: [
            _containerRowTextandIcons(),
            BitirmeConst.sizedBoxHeight40,
            Container(
              color: BitirmeConst.colorwhite,
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width / 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _containerOnRowText(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _containerOnRowText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _columnTwoText(),
        _containerIconArrow(context),
      ],
    );
  }

  Container _containerIconArrow(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 18,
      width: MediaQuery.of(context).size.width / 9,
      decoration: BoxDecoration(
        borderRadius: BitirmeConst.borderRadiusCircular10,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              BitirmeConst.colorLoginpageGradPurple,
              BitirmeConst.colorLoginpageGradWhite,
            ]),
      ),
      child: Icon(
        Icons.arrow_forward_rounded,
        color: BitirmeConst.colorwhite,
      ),
    );
  }

  Column _columnTwoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BitirmeConst.loginContainerTitle,
          style: TextStyle(color: Colors.grey),
        ),
        Text(BitirmeConst.loginContainerSubtitle,
            style: TextStyle(
                color: BitirmeConst.colorblack,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Row _containerRowTextandIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _containerColumnTextIcon(),
        _containerRowTwoIcon(),
      ],
    );
  }

  Row _containerRowTwoIcon() {
    return Row(
      children: [
        Icon(
          Icons.mail,
          color: BitirmeConst.colorwhite,
        ),
        BitirmeConst.sizedBoxWidht10,
        Icon(
          Icons.notification_add_outlined,
          color: BitirmeConst.colorwhite,
        ),
      ],
    );
  }

  Column _containerColumnTextIcon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BitirmeConst.loginHello,
          style: TextStyle(color: BitirmeConst.colorwhite),
        ),
        Row(
          children: [
            Text(BitirmeConst.loginName,
                style: TextStyle(color: BitirmeConst.colorwhite, fontSize: 20)),
            Icon(
              Icons.back_hand_rounded,
              color: BitirmeConst.coloramber,
            )
          ],
        ),
      ],
    );
  }
}
