import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constans.dart';

class PincodePage extends StatefulWidget {
  PincodePage({super.key});

  @override
  State<PincodePage> createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  String all = '';

  final firstcontroller = TextEditingController();

  final secondcontroller = TextEditingController();

  final thirdcontroller = TextEditingController();

  final fourstcontroller = TextEditingController();
  String tst = '';

  String? valdidators(String? value) {
    if (value == null || value.isEmpty || value.length > 1) {
      return 'Codeingizda hato bor';
    }
    return null;
  }

  final formkeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    register() {
      if (formkeys.currentState!.validate()) {
        formkeys.currentState!.save();

        AppConstans.pincode1 = firstcontroller.text;
        AppConstans.pincode2 = secondcontroller.text;
        AppConstans.pincode3 = thirdcontroller.text;
        AppConstans.pincode4 = fourstcontroller.text;
        tst = 'Muvaqiyatli qo`shildi';
        setState(() {});
        Navigator.pop(context);
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
                      textInputAction: TextInputAction.next,
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
                      validator: valdidators,
                      controller: secondcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: valdidators,
                      controller: thirdcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: valdidators,
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
              ),
              Text(
                tst,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
