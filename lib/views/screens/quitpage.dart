import 'dart:io';

import 'package:flutter/material.dart';

class Quitpage extends StatelessWidget {
  String pincode1;
  String pincode2;
  String pincode3;
  String pincode4;
  Quitpage(
      {required this.pincode1,
      required this.pincode2,
      required this.pincode3,
      required this.pincode4});

  final firstcontroller = TextEditingController();
  final secondcontroller = TextEditingController();
  final thirdcontroller = TextEditingController();
  final fourstcontroller = TextEditingController();

  String? valdidators(String? value) {
    if (value != pincode1) {
      return 'Codeingiz tog`ri kemayapti';
    }
    return null;
  }

  String? valdidators2(String? value) {
    if (value != pincode2) {
      return 'Codeingiz tog`ri kemayapti';
    }
    return null;
  }

  String? valdidators3(String? value) {
    if (value != pincode3) {
      return 'Codeingiz tog`ri kemayapti';
    }
    return null;
  }

  String? valdidators4(String? value) {
    if (value != pincode4) {
      return 'Codeingiz tog`ri kemayapti';
    }
    return null;
  }

  final formkeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    register() {
      if (formkeys.currentState!.validate()) {
        exit(0);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pincode page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkeys,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Write your code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: valdidators,
                      controller: firstcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: valdidators2,
                      controller: secondcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: valdidators3,
                      controller: thirdcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: valdidators4,
                      controller: fourstcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
