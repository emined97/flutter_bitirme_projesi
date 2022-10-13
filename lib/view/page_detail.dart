import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/core/container_appbar.dart';
import 'package:flutter_bitirme_projesi/core/container_calendar_date.dart';
import 'package:flutter_bitirme_projesi/core/text_clock.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({super.key});

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> with TickerProviderStateMixin {
  late final TabController tabController;
  int _value = 0;
  static const List<Tab> _tabBar = [
    Tab(
      child: ContainerCalendarDate(
          text: '03',
          texttwo: 'FRI',
          color: BitirmeConst.colorblack,
          colortwo: BitirmeConst.colorgrey),
      height: 80,
    ),
    Tab(
      child: ContainerCalendarDate(
          text: '04',
          texttwo: 'SAT',
          color: BitirmeConst.colorblack,
          colortwo: BitirmeConst.colorgrey),
      height: 80,
    ),
    Tab(
      child: ContainerCalendarDate(
        text: '05',
        texttwo: 'SUN',
        color: Color.fromARGB(59, 158, 158, 158),
        colortwo: Color.fromARGB(59, 158, 158, 158),
      ),
      height: 80,
    ),
    Tab(
      child: ContainerCalendarDate(
          text: '06',
          texttwo: 'MON',
          color: BitirmeConst.colorblack,
          colortwo: BitirmeConst.colorgrey),
      height: 80,
    ),
    Tab(
      child: ContainerCalendarDate(
          text: '07',
          texttwo: 'TUE',
          color: BitirmeConst.colorblack,
          colortwo: BitirmeConst.colorgrey),
      height: 80,
    ),
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _tabBar.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBar.length,
      child: Scaffold(
          backgroundColor: BitirmeConst.colorPagedetailback,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ContainerAppBar(),
                Padding(
                  padding: BitirmeConst.paddingPagedetail20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BitirmeConst.sizedBoxHeight20,
                      _textfieldPageDetail(),
                      BitirmeConst.sizedBoxHeight30,
                      _rowDetailpageTextandRadiobuton(),
                      BitirmeConst.sizedBoxHeight20,
                      Padding(
                        padding: BitirmeConst.padding8,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          color: BitirmeConst.colorwhite,
                          child: Column(
                            children: [
                              BitirmeConst.sizedBoxHeight10,
                              Text(
                                BitirmeConst.detailTextApril,
                                style: TextStyle(
                                    color: BitirmeConst.colorblack,
                                    fontSize: 18),
                              ),
                              BitirmeConst.sizedBoxHeight10,
                              TabBar(
                                tabs: _tabBar,
                                controller: tabController,
                                isScrollable: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: BitirmeConst.padding8,
                        child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: BitirmeConst.padding5,
                                child: Text(
                                  BitirmeConst.availableText,
                                  style: TextStyle(
                                      color: BitirmeConst.colorblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              _rowTimesOne(),
                              BitirmeConst.sizedBoxHeight5,
                              _rowTimesTwo(),
                            ],
                          ),
                        ),
                      ),
                      _pagedetailEndquestText(),
                      _rowRadioText(),
                    ],
                  ),
                ),
                BitirmeConst.sizedBoxHeight10,
                _pagedetailElevatedbutton()
              ],
            ),
          )),
    );
  }

  ElevatedButton _pagedetailElevatedbutton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: BitirmeConst.colorPagedetailElev,
        ),
        onPressed: () {},
        child: SizedBox(
            height: 50,
            width: 300,
            child: Center(
              child: Text(
                BitirmeConst.detailElev,
                style: TextStyle(fontSize: 20),
              ),
            )));
  }

  Row _rowRadioText() {
    return Row(
      children: [
        Radio(
            value: 1,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
            }),
        BitirmeConst.sizedBoxHeight5,
        Text('Check'),
        BitirmeConst.sizedBoxWidht10,
        Radio(
            value: 2,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
            }),
        BitirmeConst.sizedBoxHeight5,
        Text('Centric'),
        BitirmeConst.sizedBoxWidht10,
        Radio(
            value: 3,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
            }),
        BitirmeConst.sizedBoxHeight5,
        Text('Central'),
        BitirmeConst.sizedBoxWidht10,
      ],
    );
  }

  Text _pagedetailEndquestText() {
    return Text(
      BitirmeConst.detailEndTex,
      style: TextStyle(
          color: BitirmeConst.colorblack,
          fontWeight: FontWeight.bold,
          fontSize: 17),
    );
  }

  Row _rowTimesTwo() {
    return Row(
      children: [
        BitirmeConst.sizedBoxWidht10,
        TextClock(text: '3:00 PM', color: Colors.white),
        BitirmeConst.sizedBoxWidht5,
        TextClock(text: '04:30 PM', color: Color.fromARGB(255, 85, 175, 248)),
        BitirmeConst.sizedBoxWidht5,
        TextClock(text: '05:00 PM', color: Colors.white),
        BitirmeConst.sizedBoxWidht5,
        TextClock(text: '06:15 PM', color: Color.fromARGB(255, 227, 214, 214)),
      ],
    );
  }

  Row _rowTimesOne() {
    return Row(
      children: [
        BitirmeConst.sizedBoxWidht10,
        TextClock(text: '9:30 AM', color: BitirmeConst.colorwhite),
        BitirmeConst.sizedBoxWidht5,
        TextClock(text: '10:30 AM', color: BitirmeConst.colorwhite),
        BitirmeConst.sizedBoxWidht5,
        TextClock(text: '11:00 AM', color: Color.fromARGB(255, 227, 214, 214)),
        BitirmeConst.sizedBoxWidht5,
        TextClock(text: '12:00 PM', color: BitirmeConst.colorwhite),
      ],
    );
  }

  Row _rowDetailpageTextandRadiobuton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              BitirmeConst.detailDoctorname,
              style: TextStyle(
                  color: BitirmeConst.colorblue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              BitirmeConst.detailDoctorbrans,
              style: TextStyle(
                color: BitirmeConst.colorgrey,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: Colors.green,
              size: 20,
            ),
            BitirmeConst.sizedBoxWidht5,
            Text(BitirmeConst.detailOnline),
          ],
        )
      ],
    );
  }

  TextField _textfieldPageDetail() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: BitirmeConst.detailTextfield,
          suffixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Color.fromARGB(255, 227, 219, 219)),
    );
  }
}
