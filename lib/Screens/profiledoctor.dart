import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/konsult.dart';
import 'package:vrachipro/Screens/mydoctor.dart';
import 'package:vrachipro/Screens/notification.dart';
import 'package:vrachipro/Screens/deletepage.dart';
import 'package:vrachipro/Screens/profilemedic.dart';
import 'package:vrachipro/Screens/raspisaniye.dart';
import 'package:vrachipro/Screens/vidvrach.dart';
import 'package:vrachipro/Screens/konsvrach.dart';
import 'package:vrachipro/Screens/pacient.dart';
import 'package:vrachipro/Screens/supportchat.dart';
import 'package:vrachipro/Screens/homepagevrachi.dart';


class ProfileDocPage extends StatefulWidget {
  const ProfileDocPage({Key? key}) : super(key: key);

  @override
  _ProfileDocPageState createState() => _ProfileDocPageState();
}

class _ProfileDocPageState extends State<ProfileDocPage> {
  int _selectedIndex = 2;


  void _onItemTapped(BuildContext context, int index) {
  switch (index) {
  case 0:
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomePageVrachiScreen()),
  );
  break;
  case 1:
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => RaspisaniyeVrachiScreen()),
  );
  break;
  case 2:
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfileDocPage()),
  );
  break;
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Профиль',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildDoctorCard(
                name: 'Семенов А. И.',
                specialization: 'невролог',
                rating: 5.0,
                reviews: 68,
                experience: 'Как меня видят пользователи?',
                price: '1000 руб.',
                imagePath: 'assets/images/doctor1.png',
                context: context,

              ),
              const SizedBox(height: 20),
              _buildCardWithMultipleItems(
                items: [
                  {
                    'image': 'assets/images/kons.png',
                    'title': 'Консультации',
                    'onTap': () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KonsVrachScreen()),
                      );
                    },
                  },
                  {
                    'image': 'assets/images/mvr.png',
                    'title': 'Мои пациенты',
                    'onTap': () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PatientsScreen()),
                      );
                    },
                  },
                  {
                    'image': 'assets/images/chat.png',
                    'title': 'Чат с техподдержкой',
                    'onTap': () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                  },
                  {
                    'image': 'assets/images/uved.png',
                    'title': 'Уведомления',
                    'onTap': () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationsPage()),
                      );
                    },
                  },
                ],
              ),
              const SizedBox(height: 20),
              _buildCardWithMultipleItems(
                items: [
                  {'image': 'assets/images/del.png', 'title': 'Выйти', 'textColor': Colors.red},
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
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
              label: 'Расписание',
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

        )
  );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Color(0xFF858585),
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildCardWithMultipleItems({required List<Map<String, dynamic>> items} ) {
    return Card(
      color: Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 5,
      shadowColor: Color(0xFF646464).withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < items.length; i++) ...[
              GestureDetector(
                onTap: () {
                  if (items[i]['onTap'] != null) {
                    items[i]['onTap']();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      items[i]['image'],
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        items[i]['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: items[i]['textColor'] ?? Color(0xFF858585),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/arrow.png',
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ),
              if (i < items.length - 1) const SizedBox(height: 30),
            ],
          ],
        ),
      ),
    );
  }
}
Widget _buildDoctorCard({
  required String name,
  required String specialization,
  required double rating,
  required int reviews,
  required String experience,
  required String price,
  required String imagePath,
  required BuildContext context,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    color: Color(0xFFF5F5F5),
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
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
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      specialization,
                      style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF858585), fontSize: 14),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VidProfilePage()),
                          );
                        },
                        child: Text(
                          experience,
                          style: const TextStyle(
                            color: Color(0xFF00CCFF),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF00CCFF),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                    ]
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}