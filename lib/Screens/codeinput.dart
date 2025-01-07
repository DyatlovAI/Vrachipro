import 'package:flutter/material.dart';
import 'dart:async';

class CodeInputScreen extends StatefulWidget {
  @override
  _CodeInputScreenState createState() => _CodeInputScreenState();
}

class _CodeInputScreenState extends State<CodeInputScreen> {
  final List<TextEditingController> codeControllers =
  List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes =
  List.generate(4, (_) => FocusNode());
  int resendTimer = 59;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
    for (var i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        setState(() {});
      });
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTimer == 0) {
        timer.cancel();
      } else {
        setState(() {
          resendTimer--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in codeControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/images/logo.png',
              height: 70,
            ),
            SizedBox(height: 100),
            Text(
              "Введите код",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Мы отправили Вам сообщение с паролем на номер +7 (___) ___-__-__",
                style: TextStyle(fontSize: 16, color: Color(0xFF858585)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  height: 75,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: focusNodes[index].hasFocus
                        ? Color(0xFFFFFFF).withOpacity(0.1)
                        : Color(0xFFFFFFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: focusNodes[index].hasFocus
                          ? Color(0xFF00CCFF)
                          : Color(0xFF858585),
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    controller: codeControllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0, top: 22.0),
                    ),
                    cursorColor: focusNodes[index].hasFocus
                        ? Color(0xFF00CCFF)
                        : Color(0xFF858585),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 50),
            Text(
              "Повторная отправка через: $resendTimer",
              style: TextStyle(fontSize: 16, color: Color(0xFFD3D3D3)),
            ),
          ],
        ),
      ),
    );
  }
}