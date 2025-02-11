import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/bron.dart';
import 'profile.dart';
import 'package:vrachipro/Screens/raspisaniye.dart';
import 'package:vrachipro/Screens/profile.dart';
import 'package:vrachipro/Screens/bron.dart';
import 'package:vrachipro/Screens/profilemedic.dart';
import 'package:vrachipro/Screens/zapis.dart';

class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({Key? key}) : super(key: key);

  @override
  _SpecialistsPageState createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
  bool isAdultSelected = true;
  bool isChildSelected = false;
  String? selectedSortOption;
  void toggleButton(bool isAdult) {
    setState(() {
      isAdultSelected = isAdult;
      isChildSelected = !isAdult;
    });
  }
  int _selectedIndex = 0;

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
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        title: const Text(
          'Специалисты',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.0,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/search.png',
                        width: 15,
                        height: 15,
                      ),
                    ),
                    hintText: 'Найти специалиста',
                    hintStyle: const TextStyle(color: Color(0xFF858585), fontSize: 16),
                    filled: true,
                    fillColor: const Color(0xFFD3D3D3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buildContainerWithButtons(),
              const SizedBox(height: 30),
              const Text(
                'Специализация',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildSpecializationButton('Должность'),
                  _buildSpecializationButton('Онколог'),
                  _buildSpecializationButton('Лор'),
                  _buildSpecializationButton('Офтальмолог'),
                  _buildSpecializationButton('Реаниматолог'),
                  _buildSpecializationButton('Психолог'),
                  _buildSpecializationButton('Терапевт'),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Наши врачи',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showSortDialog(
                            context: context,
                            initialSortOption: selectedSortOption,
                            onApply: (newSortOption) {
                              setState(() {
                                selectedSortOption = newSortOption;
                              });
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              selectedSortOption ?? 'Сортировка',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/sort-alt.png',
                              width: 14,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorProfilePage(),
                        ),
                      );
                    },
                    child: _buildDoctorCard(
                      name: 'Семенов А. И.',
                      specialization: 'невролог',
                      rating: 5.0,
                      reviews: 68,
                      experience: 'Стаж 10 лет',
                      price: '1000 руб.',
                      imagePath: 'assets/images/doctor1.png',
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildDoctorCard(
                    name: 'Александрова М. В.',
                    specialization: 'невролог',
                    rating: 5.0,
                    reviews: 68,
                    experience: 'Стаж 15 лет',
                    price: '1000 руб.',
                    imagePath: 'assets/images/doctor2.png',
                  ),
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
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (label == 'Взрослому') {
            toggleButton(true);
          } else {
            toggleButton(false);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xFFD3D3D3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Color(0xFF858585),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerWithButtons() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFD3D3D3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildToggleButton('Взрослому', isAdultSelected),
          const SizedBox(width: 8),
          _buildToggleButton('Ребенку', isChildSelected),
        ],
      ),
    );
  }

  Widget _buildSpecializationButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF646464).withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 6,
          )
        ]
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }


  Future<void> showSortDialog({
    required BuildContext context,
    required String? initialSortOption,
    required ValueChanged<String?> onApply,
  }) async {
    String? temporarySortOption = initialSortOption;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Сортировать',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    title: const Text('По возрастанию'),
                    onTap: () {
                      setModalState(() {
                        temporarySortOption = 'По возрастанию';
                      });
                    },
                    tileColor: temporarySortOption == 'По возрастанию'
                        ? Colors.blue.withOpacity(0.2)
                        : null,
                    selectedTileColor: Colors.blue.withOpacity(0.2),
                    selected: temporarySortOption == 'По возрастанию',
                  ),
                  ListTile(
                    title: const Text('По убыванию'),
                    onTap: () {
                      setModalState(() {
                        temporarySortOption = 'По убыванию';
                      });
                    },
                    tileColor: temporarySortOption == 'По убыванию'
                        ? Colors.blue.withOpacity(0.2)
                        : null,
                    selectedTileColor: Colors.blue.withOpacity(0.2),
                    selected: temporarySortOption == 'По убыванию',
                  ),
                  ListTile(
                    title: const Text('По цене'),
                    onTap: () {
                      setModalState(() {
                        temporarySortOption = 'По цене';
                      });
                    },
                    tileColor: temporarySortOption == 'По цене'
                        ? Colors.blue.withOpacity(0.2)
                        : null,
                    selectedTileColor: Colors.blue.withOpacity(0.2),
                    selected: temporarySortOption == 'По цене',
                  ),
                  ListTile(
                    title: const Text('По стажу'),
                    onTap: () {
                      setModalState(() {
                        temporarySortOption = 'По стажу';
                      });
                    },
                    tileColor: temporarySortOption == 'По стажу'
                        ? Colors.blue.withOpacity(0.2)
                        : null,
                    selectedTileColor: Colors.blue.withOpacity(0.2),
                    selected: temporarySortOption == 'По стажу',
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        onApply(temporarySortOption);
                      },
                      child: const Text(
                        'Применить',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }
  Widget _buildDoctorCard({
    required String name,
    required String specialization,
    required double rating,
    required int reviews,
    required String experience,
    required String price,
    required String imagePath,
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
                            Image.asset(
                              'assets/images/small.png',
                              width: 18,
                              height: 17,
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
                      Text(
                        '$rating',
                        style: const TextStyle(fontSize: 14, color: Color(0xFFFFC549)),
                      ),
                      const Icon(Icons.star, color: Color(0xFFFFC549), size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '($reviews)',
                        style: const TextStyle(fontSize: 14, color: Color(0xFF858585),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    experience,
                    style: const TextStyle(color: Color(0xFF1A1A1A), fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF00CCFF),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
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
}