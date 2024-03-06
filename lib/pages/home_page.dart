import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main_project/pages/question.dart';
import 'package:main_project/utils/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedf3f6),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            _stackWidget(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Top Quiz Categories',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _commonWidget(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) =>
                            const Question(category: 'Physics'),
                      ),
                    );
                  }, ImagePath.physicsImage, 'Physics'),
                  _commonWidget(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) =>
                            const Question(category: 'Chemistry'),
                      ),
                    );
                  }, ImagePath.chemistryImage, 'Chemistry'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _commonWidget(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const Question(category: 'Math'),
                      ),
                    );
                  }, ImagePath.mathImage, 'Math'),
                  _commonWidget(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) =>
                            const Question(category: 'Biology'),
                      ),
                    );
                  }, ImagePath.biologyImage, 'Biology'),
                ],
              ),
            ),
            // _rowWidget(
            //   image1: ImagePath.physicsImage,
            //   image2: ImagePath.chemistryImage,
            //   title1: 'Physics',
            //   title2: 'Chemistry',
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // _rowWidget(
            //   image1: ImagePath.mathImage,
            //   image2: ImagePath.biologyImage,
            //   title1: 'Math',
            //   title2: 'Biology',
            // ),
          ],
        ),
      ),
    );
  }

  Widget _stackWidget() {
    return Stack(
      children: [
        Container(
          height: 220,
          padding: const EdgeInsets.only(top: 50, left: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF2a2b31),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: SvgPicture.asset(
                      ImagePath.quizImage,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'QUIZ APP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _rowWidget(
  //     {required String image1,
  //     required String image2,
  //     required String title1,
  //     required String title2}) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(left: 20, right: 20),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             _commonWidget(image1, title1),
  //             _commonWidget(image2, title2),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _commonWidget(VoidCallback onTap, String image, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
