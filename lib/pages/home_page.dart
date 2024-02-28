import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
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
            _rowWidget(
              image1: ImagePath.placeImage,
              image2: ImagePath.dogImage,
              title1: 'Place',
              title2: 'Animals',
            ),
            const SizedBox(
              height: 20,
            ),
            _rowWidget(
              image1: ImagePath.fruitImage,
              image2: ImagePath.sportsImage,
              title1: 'Fruits',
              title2: 'Sports',
            ),
            const SizedBox(
              height: 20,
            ),
            _rowWidget(
              image1: ImagePath.objectsImage,
              image2: ImagePath.randomImage,
              title1: 'Objects',
              title2: 'Random',
            ),
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
      ],
    );
  }

  Widget _rowWidget(
      {required String image1,
      required String image2,
      required String title1,
      required String title2}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _commonWidget(image1, title1),
              _commonWidget(image2, title2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _commonWidget(String image, String title) {
    return Material(
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
    );
  }
}
