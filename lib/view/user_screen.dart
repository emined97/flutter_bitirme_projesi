import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/core/text_black.dart';
import 'package:flutter_bitirme_projesi/core/text_grey.dart';
import 'package:flutter_bitirme_projesi/core/post_model.dart';
import 'package:flutter_bitirme_projesi/view/signup_page.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passEditingController = TextEditingController();

  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  bool _isLoading = false;

  void _isLoadingCheck() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Future<void> insertApi(PostModel model) async {
    _isLoadingCheck();
    final response = await _dio.post('posts/1/comments', data: model);
    if (response.statusCode == HttpStatus.created) {
      print('Başarılı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: BitirmeConst.paddingUserscreen90,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _userscreenContainerImage(context),
              BitirmeConst.sizedBoxHeight20,
              _userscreenTitle(),
              BitirmeConst.sizedBoxHeight10,
              _userscreenSubtitle(),
              BitirmeConst.sizedBoxHeight20,
              _userscrTextfieldEmail(),
              BitirmeConst.sizedBoxHeight10,
              _userscrTextfieldPass(),
              BitirmeConst.sizedBoxHeight10,
              _userscrnForgotText(),
              BitirmeConst.sizedBoxHeight20,
              ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_emailEditingController.text.isNotEmpty &&
                              _passEditingController.text.isNotEmpty) {
                            final model = PostModel(
                                email: _emailEditingController.text,
                                id: int.tryParse(_passEditingController.text));

                            insertApi(model);
                          }
                          _elevatedAlertShowdialog(context);
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: BitirmeConst.colorDarkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BitirmeConst.borderRadiusCircular40,
                      )),
                  child: SizedBox(
                      height: 60,
                      width: 170,
                      child: Center(child: Text(BitirmeConst.uscreenLog)))),
              BitirmeConst.sizedBoxHeight30,
              _userscrnConnectText(),
              BitirmeConst.sizedBoxHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _containerSocialFaceb(context),
                  _containerSocialGoogle(context),
                ],
              ),
              BitirmeConst.sizedBoxHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _uscrenRowTextblack(),
                  _uscrenRowTextBlue(context),
                ],
              ),
              BitirmeConst.sizedBoxHeight30,
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _uscrenRowTextBlue(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignupPage()));
      },
      child: Text(
        BitirmeConst.uscreenSignup,
        style: TextStyle(
            color: BitirmeConst.colorblue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text _uscrenRowTextblack() {
    return Text(
      BitirmeConst.uscreenEnd,
      style: TextStyle(
          color: BitirmeConst.colorblack, fontWeight: FontWeight.bold),
    );
  }

  TextGrey _userscrnConnectText() {
    return TextGrey(
      text: BitirmeConst.uscreenConnect,
    );
  }

  Future<dynamic> _elevatedAlertShowdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              title: Text("Giriş Başarılı"),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              // content: Text("yönlendiriliyorsunuz"),
              backgroundColor: BitirmeConst.colorDarkRed,
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Geri Dön"))
              ],
            ),
          );
        });
  }

  Row _userscrnForgotText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(BitirmeConst.uscreenForg),
      ],
    );
  }

  TextField _userscrTextfieldPass() {
    return TextField(
      controller: _passEditingController,
      keyboardType: TextInputType.number,
      obscureText: true,
      cursorColor: BitirmeConst.colorblue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BitirmeConst.borderRadiusCircular40,
        ),
        prefixIcon: Icon(Icons.lock),
        hintText: BitirmeConst.uscreenPass,
      ),
    );
  }

  TextField _userscrTextfieldEmail() {
    return TextField(
      controller: _emailEditingController,
      cursorColor: BitirmeConst.colorblue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BitirmeConst.borderRadiusCircular40,
        ),
        prefixIcon: Icon(Icons.person),
        hintText: BitirmeConst.uscreenEmail,
      ),
    );
  }

  TextGrey _userscreenSubtitle() {
    return TextGrey(
      text: BitirmeConst.uscreenSubtitle,
    );
  }

  TextBlack _userscreenTitle() {
    return TextBlack(
      text: BitirmeConst.uscreenTitle,
    );
  }

  Container _userscreenContainerImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: BitirmeConst.colorwhite,
      ),
      child: Image.asset(
        BitirmeConst.userscreen,
        fit: BoxFit.cover,
      ),
    );
  }

  Container _containerSocialGoogle(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: BitirmeConst.colorOnRed,
          borderRadius: BitirmeConst.borderRadiusCircular10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30, child: Image.asset(BitirmeConst.google)),
          BitirmeConst.sizedBoxWidht5,
          Text(
            BitirmeConst.uscreenGoog,
            style: TextStyle(
                color: BitirmeConst.colorwhite, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Container _containerSocialFaceb(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 1, 50, 91),
          borderRadius: BitirmeConst.borderRadiusCircular10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30, child: Image.asset(BitirmeConst.facebook)),
          BitirmeConst.sizedBoxWidht5,
          Text(
            BitirmeConst.uscreenFaceb,
            style: TextStyle(
                color: BitirmeConst.colorwhite, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
