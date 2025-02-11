import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/bron.dart';
import 'package:vrachipro/Screens/homepage.dart';
import 'package:vrachipro/Screens/profile.dart';
class ZapisScreen extends StatefulWidget {
  const ZapisScreen({Key? key}) : super(key: key);
  @override
  _ZapisScreenState createState() => _ZapisScreenState();
}

class _ZapisScreenState extends State<ZapisScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SpecialistsPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ZapisScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои записи", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BronPage(),
                  ),
                );
              },
              child: _buildDoctorCard(
                name: 'Александрова М. В.',
                specialization: "невролог",
                rating: 5.0,
                reviews: 68,
                experience: "Стаж 10 лет",
                imagePath: "assets/images/img1010.jpg",
                dateTimeRow: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "15.12.2024",
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
                        "16:16",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: Color(0xFF1A1A1A)),
                      ),
                    ),
                  ],
                ),
                question: "Текст вопроса, заданного клиентом для консультации со специалистом",
                attachedImagePath: "assets/images/img.png",
                attachedFileName: "img1011.png",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/main.png'),
            size: 20.0,
          ),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/record.png'),
            size: 20.0,
          ),
          label: 'Запись',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/profile.png'),
            size: 20.0,
          ),
          label: 'Профиль',
        ),
      ],
      selectedItemColor: Color(0xFF00CCFF),
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xFFF5F5F5),
    ),

      backgroundColor: Color(0xFFF5F5F5),
    );
  }

  Widget _buildDoctorCard({
    required String name,
    required String specialization,
    required double rating,
    required int reviews,
    required String experience,
    required String imagePath,
    required Widget dateTimeRow,
    required String question,
    required String attachedImagePath,
    required String attachedFileName,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Color(0xFFF5F5F5),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верхняя часть - врач
            Row(
              children: [
                CircleAvatar(
                  radius: 43,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            'assets/images/small.png',
                            width: 18,
                            height: 17,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            specialization,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF858585),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '$rating',
                            style: const TextStyle(fontSize: 14, color: Color(0xFFFFC549)),
                          ),
                          const Icon(Icons.star, color: Color(0xFFFFC549), size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '($reviews)',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF858585),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Дата и время
            dateTimeRow,

            const SizedBox(height: 8),

            // Вопрос клиента
            Text(
              "Вопрос:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              question,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 8),

            // Картинка и подпись
            Row(
              children: [
                Image.asset(
                  attachedImagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Text(
                  attachedFileName,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}