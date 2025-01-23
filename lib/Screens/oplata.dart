import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/addcard.dart';


class OplataPage extends StatefulWidget {
  const OplataPage({Key? key}) : super(key: key);

  @override
  _OplataPageState createState() => _OplataPageState();
}

class _OplataPageState extends State<OplataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Оплата',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Плашка, как на изображении
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '**1596',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF858585),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 36),
                    Text(
                      '**2545',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF858585),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 36),
                    Text(
                      'СБП',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF858585),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // Кнопка "Добавить карту"
              Padding(
                padding: const EdgeInsets.only(bottom: 42, left: 18, right: 18),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCardPage()),
                      );
                      },
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
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
    );
  }
}