import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vrachipro/Screens/profiledoctor.dart';
import 'package:vrachipro/Screens/homepagevrachi.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RaspisaniyeVrachiScreen extends StatefulWidget {
  @override
  _RaspisaniyeVrachiScreenState createState() =>
      _RaspisaniyeVrachiScreenState();
}
class CustomDropdown extends StatefulWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DropdownButton2<String>(
            value: widget.value.isEmpty ? null : widget.value,
            isExpanded: true,
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xFF00CCFF), width: 1),
                color: Colors.white,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xFF00CCFF), width: 1),
                color: Colors.white,
              ),
              maxHeight: 350,
            ),
            iconStyleData: IconStyleData(
              icon: AnimatedRotation(
                turns: isDropdownOpened ? 0 : 0.5,
                duration: Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    "assets/images/middle.png",
                    height: 16,
                    width: 16,
                    color: isDropdownOpened ? Color(0xFF00CCFF) : Colors.black,
                  ),
                ),
              ),
            ),
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
              setState(() {
                isDropdownOpened = !isDropdownOpened;
              });
            },
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          ),
          Positioned(
            left: 20,
            top: -10,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.label,
                style: TextStyle(fontSize: 14, color: Color(0xFF858585)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RaspisaniyeVrachiScreenState extends State<RaspisaniyeVrachiScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int _selectedIndex = 1;
  int _activeFilterIndex = 2;
  String? selectedTime;
  String selectedValue = "";
  String selectedValue2 = "";
  String selectedValue3 = "";


  final List<String> availableTimes = ["15:00", "17:30", "18:00"];

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

  void _onFilterSelected(int index) {
    if (index == 0) {
      _showAddSlotDialog(context); // Открывает диалоговое окно в центре
    } else {
      setState(() {
        _activeFilterIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Расписание',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton("Добавить", 0),
                _buildFilterButton("Изменить", 1),
                _buildFilterButton("Удалить", 2),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCalendar(),
                    const SizedBox(height: 16),

                    const Text(
                      '5 декабря',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      children: availableTimes.map((time) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedTime == time
                                  ? Color(0xFF00CCFF)
                                  : const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF646464).withOpacity(0.2),
                                  offset: const Offset(0, 2),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            child: Text(
                              time,
                              style: TextStyle(
                                color: selectedTime == time
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
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
        backgroundColor: _activeFilterIndex == index
            ? Color(0xFFFFFFFF)
            : Color(0xFFF5F5F5),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: Text(text),
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
      ],
    );
  }


  void _showAddSlotDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Создать слот",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20), // Отступы по 25 пикселей с обеих сторон
                child: Column(
                  children: [
                    CustomDropdown(
                      label: "Ранее время",
                      value: selectedValue,
                      items: ["10:00", "11:00", "12:00", "13:00"],
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue ?? "";
                        });
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomDropdown(
                      label: "Поднее время",
                      value: selectedValue2,
                      items: ["10:00", "11:00", "12:00", "13:00"],
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue2 = newValue ?? "";
                        });
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomDropdown(
                      label: "Длительность",
                      value: selectedValue3,
                      items: ["30 мин", "15 мин"],
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue3 = newValue ?? "";
                        });
                      },
                    ),
                    const SizedBox(height: 15),

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
                        child: Text("Добавить", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}