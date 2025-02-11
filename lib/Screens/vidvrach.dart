import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/vajno.dart';

class VidProfilePage extends StatefulWidget {
  const VidProfilePage({Key? key}) : super(key: key);

  @override
  _VidProfileState createState() => _VidProfileState();
}

class _VidProfileState extends State<VidProfilePage> {
  bool isAdultSelected = true;
  bool isChildSelected = false;
  String? selectedSortOption;
  bool isEducationExpanded = false;
  bool isEducationExpanded1 = false;
  String? selectedDate;
  String? selectedTime;

  // Move availableDates and availableTimes here
  final List<String> availableDates = ["15.01", "17.01", "18.01", "19.01", "20.01"];
  final List<String> availableTimes = ["15:00", "17:30"];
  final List<Map<String, String>> reviews = [
    {
      'author': 'Петрова М.',
      'date': '15.01.2025',
      'text': 'Доктор очень внимательный и профессиональный. Помог решить мою проблему быстро и эффективно.',
    },
    {
      'author': 'Иванов И.',
      'date': '14.01.2025',
      'text': 'Замечательный специалист! Обязательно порекомендую друзьям.',
    },
    {
      'author': 'Смирнова Л.',
      'date': '12.01.2025',
      'text': 'Спасибо доктору за помощь. Все объяснил и дал полезные рекомендации.',
    },
  ];

  void toggleButton(bool isAboutDoctor) {
    setState(() {
      isAdultSelected = isAboutDoctor;
      isChildSelected = !isAboutDoctor;
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

    return Scaffold(
      appBar: AppBar(
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
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00CCFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$price руб.',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
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

              if (isAdultSelected) ...[
                buildAboutDoctorSection(clinicName, clinicAddress),
              ] else ...[
                buildReviewsSection(reviews),
              ],

              const SizedBox(height: 24),
            ],
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

  Widget buildAboutDoctorSection(String clinicName, String clinicAddress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              'Московский государственный медицинский университет имени И.М. Сеченова.',
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
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              clinicAddress,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildReviewsSection(List<Map<String, String>> reviews) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        GestureDetector(
          onTap: () {

          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF858585).withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Текст
                const Text(
                  'Оставить отзыв',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF858585),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cross-circle.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        const SizedBox(height: 8),

        ...reviews.map((review) {
          final author = review['author']!;
          final date = review['date']!;
          final text = review['text']!;
          final rating = 5.0;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF646464).withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),

                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            date,
                            style: const TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ...List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              size: 16,
                              color: index < rating
                                  ? const Color(0xFFFFC549)
                                  : const Color(0xFF858585),
                            );
                          }),
                        ],
                      )                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}