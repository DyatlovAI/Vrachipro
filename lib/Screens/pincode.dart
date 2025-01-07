import 'package:flutter/material.dart';

class PinCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          Text(
            "Создайте код доступа",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
                  (index) => Container(
                width: 16,
                height: 16,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < 0 ? Colors.black : Color(0xFFD3D3D3),
                  border: Border.all(color: Color(0xFFD3D3D3), width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 12, // Оставляем 12, чтобы сетка оставалась ровной
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                Widget child;

                if (index == 9) {
                  // Пустая ячейка вместо "10"
                  child = Container(
                    width: 80,
                    height: 80,
                  );
                } else if (index == 10) {
                  // Кнопка 0
                  child = Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                  );
                } else if (index == 11) {
                  // Картинка для кнопки удаления
                  child = GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 30,
                        height: 25,
                        child: Image.asset(
                          'assets/images/delete.png', // Путь к вашей картинке
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                } else {
                  // Кнопки с цифрами от 1 до 9
                  child = Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                  );
                }

                return child;
              },
            ),
          ),
        ],
      ),
    );
  }
}