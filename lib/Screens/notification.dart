import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Запись подтверждена',
      'description': 'Ваша запись к врачу на 25 января подтверждена.',
      'isRead': false,
      'date': '14.11.2024',
      'image': 'assets/images/uved.png',
    },
    {
      'title': 'Акция на услуги',
      'description': 'Скидка 20% на консультации в течение недели.',
      'isRead': true,
      'date': '14.11.2024',
      'image': 'assets/images/uved.png',
    },
  ];

  void markAsRead(int index) {
    setState(() {
      notifications[index]['isRead'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        title: const Text(
          'Уведомления',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return GestureDetector(
              onTap: () => markAsRead(index),
              child: Card(
                color: notification['isRead']
                    ? Color(0xFFF5F5F5)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                shadowColor: Color(0xFF858585).withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Картинка слева
                      Image.asset(
                        notification['image'],
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Заголовок уведомления
                            const SizedBox(height: 24),
                            // Описание уведомления
                            Text(
                              notification['description'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            notification['date'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF858585),
                            ),
                          ),
                          if (!notification['isRead'])
                            const SizedBox(height: 24),
                          if (!notification['isRead'])
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Color(0xFF00CCFF),
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),

    );
  }
}