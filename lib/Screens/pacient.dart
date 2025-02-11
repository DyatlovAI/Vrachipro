import 'package:flutter/material.dart';

class PatientsScreen extends StatelessWidget {
  final List<Map<String, String>> patients = List.generate(3, (index) => {
    "name": "Кузнецова Марина Владимировна",
    "age": "26 лет",
    "date": "15.12.2024",
    "time": "16:16",
    "question": "Текст вопроса, заданного клиентом для консультации со специалистом",
    "image": "img1010.jpg",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои пациенты", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF646464).withOpacity(0.2),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${patient["name"]}, ${patient["age"]}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Color(0xFF1A1A1A)),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          patient["date"]!,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: Color(0xFF1A1A1A)),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          patient["time"]!,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: Color(0xFF1A1A1A)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Вопрос",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Color(0xFF1A1A1A)),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    patient["question"]!,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: Color(0xFF1A1A1A)),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/img.png", // Путь к изображению
                          width: 40,  // Ширина изображения
                          height: 40, // Высота изображения
                          fit: BoxFit.cover, // Обрезка/подгонка изображения
                        ),
                        SizedBox(width: 8.0), // Отступ между текстом и изображением

                        Text(
                          "img1011.png", // Замените на нужный текст
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}
