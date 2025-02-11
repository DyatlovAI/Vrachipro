import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/bron.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final FocusNode cardNumberFocusNode = FocusNode();
  final FocusNode expiryFocusNode = FocusNode();
  final FocusNode cvvFocusNode = FocusNode();

  bool isCardNumberFocused = false;
  bool isExpiryFocused = false;
  bool isCvvFocused = false;

  @override
  void initState() {
    super.initState();

    cardNumberFocusNode.addListener(() {
      setState(() {
        isCardNumberFocused = cardNumberFocusNode.hasFocus;
      });
    });

    expiryFocusNode.addListener(() {
      setState(() {
        isExpiryFocused = expiryFocusNode.hasFocus;
      });
    });

    cvvFocusNode.addListener(() {
      setState(() {
        isCvvFocused = cvvFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    cardNumberFocusNode.dispose();
    expiryFocusNode.dispose();
    cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/images/default.png",
            width: 20,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Добавить карту',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Stack(
              clipBehavior: Clip.none,
              children: [
                TextField(
                  focusNode: cardNumberFocusNode,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  cursorColor: const Color(0xFF00CCFF),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFF858585)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color(0xFF00CCFF),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: -10,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: isCardNumberFocused ? 14 : 16,
                      color: isCardNumberFocused
                          ? const Color(0xFF00CCFF)
                          : const Color(0xFF858585),
                    ),
                    child: Container(
                      color: const Color(0xFFF5F5F5),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text("Номер карты"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      TextField(
                        focusNode: expiryFocusNode,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        cursorColor: const Color(0xFF00CCFF),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 20.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            const BorderSide(color: Color(0xFF858585)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Color(0xFF00CCFF),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: -10,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: isExpiryFocused ? 14 : 16,
                            color: isExpiryFocused
                                ? const Color(0xFF00CCFF)
                                : const Color(0xFF858585),
                          ),
                          child: Container(
                            color: const Color(0xFFF5F5F5),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Text("Срок"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Поле ввода для CVV
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      TextField(
                        focusNode: cvvFocusNode,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        cursorColor: const Color(0xFF00CCFF),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 20.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            const BorderSide(color: Color(0xFF858585)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Color(0xFF00CCFF),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: -10,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: isCvvFocused ? 14 : 16,
                            color: isCvvFocused
                                ? const Color(0xFF00CCFF)
                                : const Color(0xFF858585),
                          ),
                          child: Container(
                            color: const Color(0xFFF5F5F5),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Text("CVV"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 52),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BronPage()),
                  );                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF00CCFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Добавить карту',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
    );
  }
}