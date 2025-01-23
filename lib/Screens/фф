import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfilePage> {
  bool isAdultSelected = true;
  bool isChildSelected = false;
  String? selectedSortOption;
  bool isEducationExpanded = false;
  bool isEducationExpanded1 = false;
  String? selectedDate;
  String? selectedTime;

  void toggleButton(bool isAdult) {
    setState(() {
      isAdultSelected = isAdult;
      isChildSelected = !isAdult;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String doctorName = "Семенов Александр Иванович";
    final String specialization = "невролог";
    final double rating = 5.0;
    final int reviewsCount = 68;
    final int experienceYears = 10;
    final String clinicName = "Медицинский центр «Мед»";
    final String clinicAddress = "ул. Островского, д. 55";
    final String doctorImage = "assets/images/doctor1.png";
    final String price = "1000";
    final List<String> availableDates = ["15.01", "17.01", "18.01", "19.01", "20.01"];
    final List<String> availableTimes = ["15:00", "17:30"];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Врач',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/small.png',
              width: 25,
              height: 22,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(doctorImage),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              specialization,
                              style: const TextStyle(color: Color(0xFF858585), fontSize: 15),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              rating.toString(),
                              style: const TextStyle(fontSize: 14, color: Color(0xFFFFC549)),
                            ),
                            const Icon(Icons.star, color: Color(0xFFFFC549), size: 16),
                            const SizedBox(width: 8),
                            Text(
                              '($reviewsCount)',
                              style: const TextStyle(color: Color(0xFF858585), fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'стаж $experienceYears лет',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00CCFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$price руб.',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              buildContainerWithButtons(),

              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEducationExpanded = !isEducationExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Образование',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      isEducationExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              if (isEducationExpanded)
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Московский государственный медицинский университет имени И.М. Сеченова. Факультет неврологии. Стажировки в Европе.',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),

              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEducationExpanded1 = !isEducationExpanded1;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      clinicName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      isEducationExpanded1
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              if (isEducationExpanded1)
                 Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    clinicAddress,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),

              const SizedBox(height: 24),
              const Text(
                'Выберите дату записи',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: availableDates.map((time) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = time;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedDate == time ? Color(0xFF00CCFF) : const Color(0xFFF5F5F5),
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
                          color: selectedDate == time ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const Text(
                'Выберите время записи',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
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
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedTime == time ? Color(0xFF00CCFF) : const Color(0xFFF5F5F5),
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
                          color: selectedTime == time ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 42, left: 18, right: 18),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedDate != null && selectedTime != null
                  ? () {
                print('Вы записались на $selectedDate в $selectedTime');
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color(0xFF00CCFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Записаться',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight:  FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
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
          _buildToggleButton('О враче', isAdultSelected),
          const SizedBox(width: 8),
          _buildToggleButton('Отзывы', isChildSelected),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          toggleButton(label == 'О враче');
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
                color: isSelected ? Colors.black : const Color(0xFF858585),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
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

  Widget _buildTimeButton(String time, bool isSelected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}