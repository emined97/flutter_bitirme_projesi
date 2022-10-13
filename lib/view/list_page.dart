import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/core/container_appbar.dart';
import 'package:flutter_bitirme_projesi/core/post_comments.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<PostComments>? _items;
  @override
  void initState() {
    super.initState();
    getComments();
  }

  Future<void> getComments() async {
    final baglanti =
        await Dio().get('https://jsonplaceholder.typicode.com/users');

    if (baglanti.statusCode == HttpStatus.ok) {
      final veri = baglanti.data;
      if (veri is List) {
        setState(() {
          _items = veri.map((e) => PostComments.fromJson(e)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerAppBar(),
            SizedBox(
              height: 800,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _items?.length ?? 0,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: BitirmeConst.paddingListpage10,
                      child: Card(
                        color: BitirmeConst.colorwhite,
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: BitirmeConst.paddingListpagetwo10,
                              child: _cardRowEmailOnline(index),
                            ),
                            _divider(),
                            _cardListileContainerText(index),
                            BitirmeConst.sizedBoxHeight10,
                            _divider(),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: _cardRowIconText(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }

  Row _cardRowIconText(int index) {
    return Row(
      children: [
        Icon(
          Icons.person,
          color: BitirmeConst.colorblue,
        ),
        BitirmeConst.sizedBoxWidht10,
        Text(
          _items?[index].website ?? '',
        ),
        BitirmeConst.sizedBoxHeight10,
      ],
    );
  }

  ListTile _cardListileContainerText(int index) {
    return ListTile(
        leading: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(40)),
            child: Image.asset(
              BitirmeConst.doctorwm,
            )),
        title: Text('Dr. ${_items?[index].name ?? ''}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _items?[index].username ?? '',
            ),
            Text(
              _items?[index].phone ?? '',
            ),
          ],
        ),
        trailing: Column(
          children: [Icon(Icons.location_on), Text('Map')],
        ));
  }

  Row _cardRowEmailOnline(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _items?[index].email ?? '',
        ),
        Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: BitirmeConst.colorgreen,
              size: 20,
            ),
            Text(BitirmeConst.detailOnline),
          ],
        ),
      ],
    );
  }

  Divider _divider() {
    return Divider(
      color: BitirmeConst.colorgrey,
      indent: 5,
      endIndent: 5,
      thickness: 1,
    );
  }
}
