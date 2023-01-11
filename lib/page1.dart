import 'package:flutter/material.dart';
import 'package:lab07/page2.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController txtHight = TextEditingController();
TextEditingController txtWidth = TextEditingController();

class _MyWidgetState extends State<MyWidget> {
  String groupgender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('วิเคราะห์ค่า BMI')),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("เพศ"),
              RadioListTile(
                title: Text('หญิง'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'gen1',
                groupValue: groupgender,
                onChanged: (value) {
                  setState(() {
                    groupgender = value!;
                  });
                  print(groupgender);
                },
              ),
              RadioListTile(
                title: Text('ชาย'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'gen2',
                groupValue: groupgender,
                onChanged: (value) {
                  setState(() {
                    groupgender = value!;
                  });
                  print(groupgender);
                },
              ),
              RadioListTile(
                title: Text('ทางเลือก'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'gen3',
                groupValue: groupgender,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    groupgender = value!;
                  });
                  print(groupgender);
                },
              ),
              TextFormField(
                controller: txtHight,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "น้ำหนัก", hintText: "โปรดระบุน้ำหนักของคุณ"),
              ),
              TextFormField(
                controller: txtWidth,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "ส่วนสูง", hintText: "โปรดระบุส่วนสูงของคุณ"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('ส่วนสูง:' +
                        txtHight.text +
                        ', น้ำหนัก :' +
                        txtWidth.text);
                    setState(() {
                      var _heightM = double.parse(txtHight.text) / 100;
                      //ประกาศตัวแปร _heightM มารับค่าส่วนสูง cm แปลงเป็น m
                      var _bmi =
                          double.parse(txtWidth.text) / (_heightM * _heightM);
                      print(_bmi);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => earn(),
                        ));
                  }
                },
                child: const Text('คำนวณ'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
