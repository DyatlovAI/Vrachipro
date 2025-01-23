import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/konsult.dart';
import 'package:vrachipro/Screens/mydoctor.dart';
import 'package:vrachipro/Screens/notification.dart';
import 'package:vrachipro/Screens/deletepage.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Иванова Светлана Викторовна',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/edit.png',
                                    width: 34,
                                    height: 34,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Возраст: 26 лет',
                              style: _infoTextStyle(),
                              softWrap: true,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Город: Архангельск',
                              style: _infoTextStyle(),
                              softWrap: true,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Почта: svetlana@mail.ru',
                              style: _infoTextStyle(),
                              softWrap: true,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Телефон: +7 (987) 954-56-47',
                              style: _infoTextStyle(),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                        MaterialPageRoute(builder: (context) => ConsultationPage()),
                      );
                    },
                  },
                  {
                    'image': 'assets/images/mvr.png',
                    'title': 'Мои врачи',
                    'onTap': () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorsPage()),
                      );
                    },
                  },
                  {
                    'image': 'assets/images/chat.png',
                    'title': 'Чат с техподдержкой',
                    'onTap': () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SupportChatPage()),
                      // );
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
                  {'image': 'assets/images/musor.png', 'title': 'Удалить профиль','onTap': () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeleteAccountPage()),
                    );
                  },},
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
        items: const [
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
        currentIndex: 2,
        selectedItemColor: Color(0xFF00CCFF),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Обработка нажатий
        },
        backgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Color(0xFF858585),
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildCardWithMultipleItems({required List<Map<String, dynamic>> items}) {
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
                  // Добавьте обработчик нажатия для каждого элемента
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
  }}