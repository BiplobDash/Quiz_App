import 'package:flutter/material.dart';

class AddQuizScreen extends StatefulWidget {
  const AddQuizScreen({super.key});

  @override
  State<AddQuizScreen> createState() => _AddQuizScreenState();
}

class _AddQuizScreenState extends State<AddQuizScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController currectAnswerController = TextEditingController();

  final List<String> items = ['Railway', 'LGED'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Quiz',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 30,
        ),
        child: Column(
          children: [
            _textField(
                title: 'Write Your Question',
                controller: questionController,
                hintText: 'Enter your Question'),
            const SizedBox(
              height: 15,
            ),
            _textField(
                title: 'Option 1',
                controller: option1Controller,
                hintText: 'Enter your option 1'),
            const SizedBox(
              height: 15,
            ),
            _textField(
                title: 'Option 2',
                controller: option2Controller,
                hintText: 'Enter your option 2'),
            const SizedBox(
              height: 15,
            ),
            _textField(
                title: 'Option 3',
                controller: option3Controller,
                hintText: 'Enter your option 3'),
            const SizedBox(
              height: 15,
            ),
            _textField(
                title: 'Option 4',
                controller: option4Controller,
                hintText: 'Enter your option 4'),
            const SizedBox(
              height: 15,
            ),
            _textField(
                title: 'Currect Answer',
                controller: currectAnswerController,
                hintText: 'Enter your Correct Answer'),
            const SizedBox(
              height: 15,
            ),
            _dropDownWidget(),
            const SizedBox(
              height: 20,
            ),
            _buttonWidget(() {}),
          ],
        ),
      ),
    );
  }

  Widget _textField(
      {required String title,
      required TextEditingController controller,
      required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: const Color(0xFFececf8),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dropDownWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: const Color(0xFFececf8),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: items
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )))
              .toList(),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
          dropdownColor: Colors.white,
          hint: const Text('Select Category'),
          iconSize: 36,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          value: value,
        ),
      ),
    );
  }

  Widget _buttonWidget(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
