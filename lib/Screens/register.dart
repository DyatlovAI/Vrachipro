import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/codeinput.dart';
import 'package:vrachipro/Screens/pincode.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/images/logo.png',
              height: 70,
            ),
            SizedBox(height: 130),
            Text(
              "Введите номер телефона",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Мы вышлем код подтверждения на этот номер",
                style: TextStyle(fontSize: 16, color: Color(0xFF858585)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Stack(
              clipBehavior: Clip.none,
              children: [
                TextField(
                  controller: phoneController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  cursorColor: Color(0xFF00CCFF),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xFF858585)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFF00CCFF),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: -10,
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: isFocused ? 14 : 16,
                      color: isFocused
                          ? Color(0xFF00CCFF)
                          : Color(0xFF858585),
                    ),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Номер телефона"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PinCodeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color(0xFF00CCFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Продолжить",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}