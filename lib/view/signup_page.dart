import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/core/text_black.dart';
import 'package:flutter_bitirme_projesi/core/text_grey.dart';
import 'package:flutter_bitirme_projesi/core/post_model_user.dart';
import 'package:flutter_bitirme_projesi/view/bottom_bar.dart';
import 'package:flutter_bitirme_projesi/view/user_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
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

  Future<void> insertApi(PostModelUsers model) async {
    _isLoadingCheck();
    final response = await _dio.post('users', data: model);
    if (response.statusCode == HttpStatus.created) {
      print('Başarılı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarSignpage(context),
      body: Padding(
        padding: BitirmeConst.paddingLoginpage20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextBlack(
                text: BitirmeConst.signPageTitle,
              ),
              BitirmeConst.sizedBoxHeight10,
              TextGrey(
                text: BitirmeConst.signPageSubtitle,
              ),
              BitirmeConst.sizedBoxHeight40,
              _textfieldName(),
              BitirmeConst.sizedBoxHeight20,
              _textfieldEmail(),
              BitirmeConst.sizedBoxHeight20,
              _textfieldPhone(),
              BitirmeConst.sizedBoxHeight20,
              _textfieldPass(),
              BitirmeConst.sizedBoxHeight20,
              _textfieldPassAgain(),
              BitirmeConst.sizedBoxHeight40,
              ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_nameEditingController.text.isNotEmpty &&
                              _emailEditingController.text.isNotEmpty &&
                              _phoneEditingController.text.isNotEmpty &&
                              _passEditingController.text.isNotEmpty) {
                            final model = PostModelUsers(
                                name: _nameEditingController.text,
                                email: _emailEditingController.text,
                                phone: _phoneEditingController.text,
                                id: int.tryParse(_passEditingController.text));

                            insertApi(model);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 6, 86, 152),
                      shape: RoundedRectangleBorder(
                        borderRadius: BitirmeConst.borderRadiusCircular40,
                      )),
                  child: SizedBox(
                      height: 60,
                      width: 160,
                      child: Center(
                          child: Text(
                        BitirmeConst.signElev,
                        style: TextStyle(fontSize: 18),
                      )))),
              BitirmeConst.sizedBoxHeight40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _signuppageRowBlackText(),
                  _signuppageRowBlueText(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _signuppageRowBlueText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomBar()));
      },
      child: Text(
        BitirmeConst.signLogin,
        style: TextStyle(
            color: BitirmeConst.colorblue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text _signuppageRowBlackText() {
    return Text(
      BitirmeConst.signEnd,
      style: TextStyle(
          color: BitirmeConst.colorblack, fontWeight: FontWeight.bold),
    );
  }

  TextField _textfieldPassAgain() {
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
        hintText: BitirmeConst.signPass,
      ),
    );
  }

  TextField _textfieldPass() {
    return TextField(
      controller: _passEditingController,
      keyboardType: TextInputType.number,
      cursorColor: BitirmeConst.colorblue,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BitirmeConst.borderRadiusCircular40,
        ),
        prefixIcon: Icon(Icons.lock),
        hintText: BitirmeConst.uscreenPass,
      ),
    );
  }

  TextField _textfieldPhone() {
    return TextField(
      controller: _phoneEditingController,
      keyboardType: TextInputType.number,
      cursorColor: BitirmeConst.colorblue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BitirmeConst.borderRadiusCircular40,
        ),
        prefixIcon: Icon(Icons.send_to_mobile_rounded),
        hintText: BitirmeConst.signPhone,
      ),
    );
  }

  TextField _textfieldEmail() {
    return TextField(
      controller: _emailEditingController,
      cursorColor: BitirmeConst.colorblue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BitirmeConst.borderRadiusCircular40,
        ),
        prefixIcon: Icon(Icons.mail),
        hintText: BitirmeConst.uscreenEmail,
      ),
    );
  }

  TextField _textfieldName() {
    return TextField(
      controller: _nameEditingController,
      cursorColor: BitirmeConst.colorblue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BitirmeConst.borderRadiusCircular40,
        ),
        prefixIcon: Icon(Icons.person),
        hintText: BitirmeConst.signName,
      ),
    );
  }

  AppBar _appbarSignpage(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => UserScreen()));
        },
        child: Icon(
          Icons.arrow_back,
          color: BitirmeConst.colorblack,
          size: 30,
        ),
      ),
    );
  }
}
