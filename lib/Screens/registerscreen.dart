import 'package:flutter/material.dart';

class Register2Screen extends StatefulWidget {
  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  String selectedGender = "";
  String selectedTimezone = "";

  final List<String> genders = ["Мужской", "Женский"];
  final List<String> timezones = ["UTC+0", "UTC+1", "UTC+2", "UTC+3", "UTC+4"];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Регистрация",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCustomTextField(
                controller: nameController,
                label: "Ваше ФИО",
              ),
              SizedBox(height: 30),
              buildCustomDropdown(
                label: "Выберите пол",
                value: selectedGender,
                items: genders,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              SizedBox(height: 30),
              buildCustomTextField(
                controller: birthDateController,
                label: "Дата рождения",
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              buildCustomTextField(
                controller: emailController,
                label: "Ваша почта",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              buildCustomDropdown(
                label: "Часовой пояс",
                value: selectedTimezone,
                items: timezones,
                onChanged: (value) {
                  setState(() {
                    selectedTimezone = value!;
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: isChecked
                    ? () {
                  // Handle navigation
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Color(0xFF00CCFF).withOpacity(isChecked ? 1.0 : 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Center(
                  child: Text(
                    "Продолжить",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCustomCheckbox(),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Open terms
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Я принимаю условия ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "Пользовательского соглашения",
                              style: TextStyle(color: Color(0xFF00CCFF)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return FocusNodeHandler(
      controller: controller,
      label: label,
      keyboardType: keyboardType,
    );
  }

  Widget buildCustomDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 10),  // Добавим немного отступа сверху
      child: Stack(
        children: [
          DropdownButtonFormField<String>(
            value: value.isEmpty ? null : value,
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                "assets/images/middle.png",
                height: 16,
                width: 16,
              ),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),  // Немного увеличили отступы
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF858585)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF00CCFF), width: 2),
              ),
            ),
            onChanged: onChanged,
            items: items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 16),  // Размер шрифта
                overflow: TextOverflow.ellipsis, // Предотвращает обрезание текста
              ),
            ))
                .toList(),
          ),
          Positioned(
            left: 20,
            top: -10,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                label,
                style: TextStyle(fontSize: 14, color: Color(0xFF858585)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCustomCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isChecked ? Color(0xFF00CCFF) : Color(0xFF858585),
            width: 2,
          ),
        ),
        child: isChecked
            ? Icon(Icons.check, size: 18, color: Color(0xFF00CCFF))
            : null,
      ),
    );
  }
}

class FocusNodeHandler extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;

  FocusNodeHandler({
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  _FocusNodeHandlerState createState() => _FocusNodeHandlerState();
}

class _FocusNodeHandlerState extends State<FocusNodeHandler> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: TextStyle(fontSize: 16, color: Colors.black),
      cursorColor: Color(0xFF00CCFF),
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF858585)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF00CCFF), width: 2),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always, // Keeps label inside the field
        labelText: widget.label,
        labelStyle: TextStyle(
          color: _isFocused ? Color(0xFF00CCFF) : Color(0xFF858585),
          fontSize: _isFocused ? 16 : 18, // Shrinks the label text when focused
        ),
      ),
    );
  }
}