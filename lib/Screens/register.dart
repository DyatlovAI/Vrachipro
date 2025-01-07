import 'package:flutter/material.dart';

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
            SizedBox(height: 90),
            // Логотип сверху
            Image.asset(
              'assets/images/logo.png',
              height: 80,
            ),
            SizedBox(height: 150),
            Text(
              "Введите номер телефона",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Мы вышлем код подтверждения на этот номер",
                style: TextStyle(fontSize: 16, color: Color(0xFF858585)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            // Обёртка над TextField
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Сам текстовое поле
                TextField(
                  controller: phoneController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Основной текст черный
                  ),
                  cursorColor: Color(0xFF00CCFF), // Цвет курсора
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFF00CCFF), // Цвет рамки при фокусе
                        width: 2,
                      ),
                    ),
                  ),
                ),
                // Текст над текстовым полем
                Positioned(
                  left: 30, // Смещение от левого края
                  top: -10, // Увеличили значение для полной видимости текста
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: isFocused ? 14 : 16,
                      color: isFocused
                          ? Color(0xFF00CCFF) // Цвет текста при фокусе
                          : Colors.grey, // Цвет текста без фокуса
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
            SizedBox(height: 32),
            // Кнопка
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
                      fontSize: 16,
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