import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vrachipro/Screens/profiledoctor.dart';
import 'package:vrachipro/Screens/raspisaniye.dart';

class HomePageVrachiScreen extends StatefulWidget {
  @override
  _HomePageVrachiScreenState createState() => _HomePageVrachiScreenState();
}

class _HomePageVrachiScreenState extends State<HomePageVrachiScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int _selectedIndex = 0;
  int _activeFilterIndex = 2;

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

  // Обновляем активную вкладку
  void _onFilterSelected(int index) {
    setState(() {
      _activeFilterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Пациенты',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton("Сегодня", 0),
                _buildFilterButton("Завтра", 1),
                _buildFilterButton("Календарь", 2),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: _activeFilterIndex == 0
                    ? _buildTodayAndTomorrow()
                    : _activeFilterIndex == 1
                    ? _buildTodayAndTomorrow()
                    : _buildCalendar(),
              ),
            ),
          ),
        ],
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
      ),
    );
  }

  Widget _buildFilterButton(String text, int index) {
    return ElevatedButton(
      onPressed: () => _onFilterSelected(index),
      style: ElevatedButton.styleFrom(
        backgroundColor: _activeFilterIndex == index ? Color(0xFFFFFFFF) : Color(0xFFF5F5F5),
        foregroundColor: _activeFilterIndex == index ? Colors.black : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: Text(text),
    );
  }

  Widget _buildTodayAndTomorrow() {
    return Column(
      children: [
        _buildPatientCard("Кузнецова Марина Владимировна", "26 лет", "15.12.2024", "16:16", "Текст вопроса, заданного клиентом для консультации со специалистом", "assets/images/img.png"),
        _buildPatientCard("Иванова Анна Петровна", "30 лет", "16.12.2024", "17:00", "Вопрос по результатам анализов", "assets/images/img.png"),
      ],
    );
  }

  Widget _buildCalendar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFFF5F5F5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarFormat: _calendarFormat,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                leftChevronIcon: Image.asset(
                  'assets/images/default.png',
                  width: 20,
                  height: 20,
                ),
                rightChevronIcon: Image.asset(
                  'assets/images/big.png',
                  width: 20,
                  height: 20,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.black),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                selectedTextStyle: TextStyle(color: Colors.black),
                outsideDaysVisible: false,
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        _buildPatientCard("Кузнецова Марина Владимировна", "26 лет", "15.12.2024", "16:16", "Текст вопроса, заданного клиентом для консультации со специалистом", "assets/images/img.png"),
        _buildPatientCard("Иванова Анна Петровна", "30 лет", "16.12.2024", "17:00", "Вопрос по результатам анализов", "assets/images/img.png"),
      ],
    );
  }

  Widget _buildPatientCard(String name, String age, String date, String time, String question, String imagePath) {
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
          Text("$name, $age", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Color(0xFF1A1A1A))),
          SizedBox(height: 8.0),
          Row(
            children: [
              _buildTag(date),
              SizedBox(width: 8.0),
              _buildTag(time),
            ],
          ),
          SizedBox(height: 8.0),
          Text("Вопрос", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Color(0xFF1A1A1A))),
          SizedBox(height: 4.0),
          Text(question, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: Color(0xFF1A1A1A))),
          SizedBox(height: 8.0),
          Row(
            children: [
              Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.cover),
              SizedBox(width: 8),
              Text(
                "img1011.png",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}