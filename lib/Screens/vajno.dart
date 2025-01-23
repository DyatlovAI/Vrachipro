import 'package:flutter/material.dart';
import 'package:vrachipro/Screens/oplata.dart';


class VajnoPage extends StatefulWidget {
  const VajnoPage({Key? key}) : super(key: key);

  @override
  _VajnoPageState createState() => _VajnoPageState();
}

class _VajnoPageState extends State<VajnoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Важно',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Современные технологии достигли такого уровня, что повышение уровня гражданского сознания в значительной степени обусловливает важность форм воздействия. Ясность нашей позиции очевидна: консультация с широким активом создаёт необходимость включения в производственный план целого ряда внеочередных мероприятий.\n'
                    'Современные технологии достигли такого уровня, что повышение уровня гражданского сознания в значительной степени обусловливает важность форм воздействия. Ясность нашей позиции очевидна: консультация с широким активом создаёт необходимость включения в производственный план целого ряда внеочередных мероприятий. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),

              Padding(
                padding: const EdgeInsets.only(bottom: 42, left: 18, right: 18),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OplataPage()),
                      );                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF00CCFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Оплатить услугу',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),

    );

  }
}