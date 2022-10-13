import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/core/info_list.dart';
import 'package:flutter_bitirme_projesi/view/user_screen.dart';

class BitirmeInfo extends StatefulWidget {
  const BitirmeInfo({super.key});

  @override
  State<BitirmeInfo> createState() => _BitirmeInfoState();
}

class _BitirmeInfoState extends State<BitirmeInfo> {
  final double _height = 2.4;
  final double _width = 1.3;
  var controller = PageController();
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentpage = controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: controller,
          itemCount: listofvalue.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: BitirmeConst.paddingInfo,
              child: Column(
                children: [
                  _infopageRowSkip(context),
                  BitirmeConst.sizedBoxHeight30,
                  _infopageContainerImage(context, index),
                  _infoTitle(context),
                  BitirmeConst.sizedBoxHeight10,
                  _infoSubtitle(context),
                  BitirmeConst.sizedBoxHeight140,
                  _RowTextPagenumberandNext(context),
                ],
              ),
            );
          }),
    );
  }

  Row _RowTextPagenumberandNext(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${currentpage + 1}/' + listofvalue.length.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: BitirmeConst.colorblack, fontSize: 18),
        ),
        Text(
          BitirmeConst.infoNext,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: BitirmeConst.colorblack, fontSize: 18),
        ),
      ],
    );
  }

  Text _infoSubtitle(BuildContext context) {
    return Text(
      BitirmeConst.infoSubtitle,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: BitirmeConst.colorblack, fontSize: 18),
    );
  }

  Text _infoTitle(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      BitirmeConst.infoTitle,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            color: BitirmeConst.colorblack,
          ),
    );
  }

  Container _infopageContainerImage(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / _height,
      width: MediaQuery.of(context).size.width / _width,
      decoration: BoxDecoration(
          color: BitirmeConst.colorwhite,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(listofvalue[index].imagepath))),
    );
  }

  Row _infopageRowSkip(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => UserScreen()));
          },
          child: Text(
            BitirmeConst.infoSkip,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: BitirmeConst.colorblue),
          ),
        ),
      ],
    );
  }
}
