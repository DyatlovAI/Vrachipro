import 'package:flutter/material.dart';


class PatientDetailScreen extends StatelessWidget {
  final Map<String, String> patient;

  PatientDetailScreen({required this.patient});

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
        title: Text("Консультации"),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${patient["name"]}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
            ),
            SizedBox(height: 12.0),
            Text(
              "Возраст: ${patient["age"]}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF858585)),
            ),
            SizedBox(height: 12.0),
            Text(
              "Дата и время",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "${patient["date"]}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
                const SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "${patient["time"]}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),

              ]
            ),
            SizedBox(height: 8.0),
            SizedBox(height: 16.0),
            Text(
              "Вопрос пациента",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
            ),
            SizedBox(height: 16.0),

            Text(
              "${patient["question"]}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Color(0xFF1A1A1A)),
            ),
            SizedBox(height: 16.0),

            Row(
              children: [
                Image.asset(
                  "assets/images/img.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8.0),
                Text(
                  "img1011.png",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00CCFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Подключиться", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white)),
              ),
            ),

          ],
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),

    );
  }
}