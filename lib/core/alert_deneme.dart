import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlertDeneme extends StatefulWidget {
  const AlertDeneme({super.key});

  @override
  State<AlertDeneme> createState() => _AlertDenemeState();
}

class _AlertDenemeState extends State<AlertDeneme> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "kullanıcı adı",
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "kullanıcı adınızı giriniz";
                  } else {
                    return null;
                  }
                },
              )
            ],
          ),
        ));
  }
}
