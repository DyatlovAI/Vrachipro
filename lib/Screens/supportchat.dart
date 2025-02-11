import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Чат", style: TextStyle(color: Colors.black)),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.all(16.0),
              children: [
                SizedBox(height: 10),

                // Сообщение от пользователя (слева)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "15:26",
                        style: TextStyle(color: Color(0xFF858585),fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "Добрый день! Современные технологии достигли такого уровня, что базовый вектор развития влечет за собой процесс внедрения и модернизации стандартных подходов.",
                            style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFD3D3D3),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "Служба технической поддержки Врачи.про! Чем могу помочь?",
                            style: TextStyle(color: Color(0xFF1A1A1A), fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),

                      Text(
                        "15:24",
                        style: TextStyle(color: Color(0xFF858585),fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                Center(
                  child: Text(
                    "сегодня",
                    style: TextStyle(color: Color(0xFF858585),fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "ФИО специалиста",
                filled: true,
                fillColor: Color(0xFFD3D3D3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Image.asset("assets/images/circleotpr.png"),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}