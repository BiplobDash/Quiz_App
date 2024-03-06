import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_project/services/database.dart';

class Question extends StatefulWidget {
  final String category;
  const Question({super.key, required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // ignore: non_constant_identifier_names
  Stream? QuizStream;
  PageController controller = PageController();

  getOnTheLoad() async {
    QuizStream = await DatabaseMethod().getCategoryQuiz(widget.category);
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allQuiz() {
    return StreamBuilder(
        stream: QuizStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                  controller: controller,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                          children: [
                            _textWidget(
                              ds['question'],
                              height: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            _textWidget(ds['option1']),
                            const SizedBox(
                              height: 10,
                            ),
                            _textWidget(ds['option2']),
                            const SizedBox(
                              height: 10,
                            ),
                            _textWidget(ds['option3']),
                            const SizedBox(
                              height: 10,
                            ),
                            _textWidget(ds['option4']),
                          ],
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004840),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFf35b32),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 100.0,
              ),
              Text(
                widget.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        allQuiz(),
      ],
    );
  }

  Widget _textWidget(String title, {double? height}) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF818181),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
