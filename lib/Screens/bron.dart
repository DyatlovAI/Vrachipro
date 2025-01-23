import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/vajno.dart';

class BronPage extends StatefulWidget {
  const BronPage({Key? key}) : super(key: key);

  @override
  _BronPageState createState() => _BronPageState();
}

class _BronPageState extends State<BronPage> {
  bool isAdultSelected = true;
  bool isChildSelected = false;
  String? selectedSortOption;
  bool isEducationExpanded = false;
  bool isEducationExpanded1 = false;
  String? selectedDate;
  String? selectedTime;
  String? selectedDateTime;
  final FocusNode focusNode = FocusNode();

  bool isFocused = false;
  Widget bookingConfirmation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  // Текст заголовка
                  const Text(
                    'Время забронировано',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text(
                'Неоплаченная запись отменяется через 15 минут',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Кнопка
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF00CCFF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Оплатить 1000 руб.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  // Move availableDates and availableTimes here
  final List<String> availableDates = ["15.01", "17.01", "18.01", "19.01", "20.01"];
  final List<String> availableTimes = ["15:00", "17:30"];
  List<String> availableDateTime = [
    "17.01.2025",
    "14:00"

  ];
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
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Онлайн-консультация',
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
              bookingConfirmation(),
              const SizedBox(height: 24),

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
      bottomNavigationBar: !isChildSelected
          ? Padding(
        padding: const EdgeInsets.only(bottom: 42, left: 18, right: 18),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedDate != null && selectedTime != null
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VajnoPage()),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF00CCFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Подключиться',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      )
          : null,
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
        const Text(
          'Дата и время',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: availableDateTime.map((dateTime) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDateTime = dateTime;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: selectedDateTime == dateTime ? const Color(0xFF00CCFF) : const Color(0xFFF5F5F5),
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
                  dateTime,
                  style: TextStyle(
                    color: selectedDateTime == dateTime ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),

        const Text(
          'Задать вопрос',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),

        Stack(
          clipBehavior: Clip.none,
          children: [
            TextField(
              focusNode: focusNode,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              cursorColor: Color(0xFF00CCFF),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 20.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xFF858585)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Color(0xFF00CCFF),
                    width: 2,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: -10,
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: isFocused ? 14 : 16,
                  color: isFocused
                      ? Color(0xFF00CCFF)
                      : Color(0xFF858585),
                ),
                child: Container(
                  color: Color(0xFFF5F5F5),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Опишите вопрос"),
                ),
              ),
            ),


          ],

        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/addfile.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    child: const Text(
                      "Добавить файл",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1A1A1A),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BronPage()),
              );                },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF00CCFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Сохранить',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

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