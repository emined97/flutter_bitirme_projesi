import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/core/alert_deneme.dart';
import 'package:flutter_bitirme_projesi/view/bitirme_info.dart';

import 'package:flutter_bitirme_projesi/view/list_page.dart';

import 'package:flutter_bitirme_projesi/view/login_page.dart';
import 'package:flutter_bitirme_projesi/view/page_detail.dart';
import 'package:flutter_bitirme_projesi/view/signup_page.dart';
import 'package:flutter_bitirme_projesi/view/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BitirmeInfo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
