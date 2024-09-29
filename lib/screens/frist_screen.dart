import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sanoko_shop/screens/home_screen.dart';
import 'package:sanoko_shop/var.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool goto2screen = false;
  bool endanim = false;

  double _changHight1 = height - 850;
  double _changWidth1 = width - 300;
  double _changHight2 = -140;
  double _changWidth2 = -25;
  double _changHight3 = height - 1260;
  double _changWidth3 = width - 100;

  final double _sizeofContainer = 550.0;

  void _moveCircles() {
    setState(() {
      _changHight1 = _changHight1 == -180.0 ? height - 850 : -180.0;
      _changWidth1 = _changWidth1 == -180.0 ? width - 300 : -180.0;
      _changHight2 = _changHight2 == height - 700 ? -140 : height - 700;
      _changWidth2 = _changWidth2 == width - 100 ? -25 : width - 100;
      _changHight3 =
          _changHight3 == height - 1260 ? height - 450 : height - 1260;
      _changWidth3 = _changWidth3 == width - 100 ? width - 450 : width - 100;
    });
  }

  void goto2homeScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: offWhite,
      body: Stack(
        children: [
          Circle(
            changWidth1: _changWidth1,
            changHight1: _changHight1,
            sizeofContainer: _sizeofContainer,
            thiscolor: lightOrange,
            iffull: true,
          ),
          Circle(
            changWidth1: _changWidth2,
            changHight1: _changHight2,
            sizeofContainer: 130,
            thiscolor: lightGreen,
          ),
          Circle(
            changWidth1: _changWidth3,
            changHight1: _changHight3,
            sizeofContainer: 170,
            thiscolor: yellow,
          ),
          categoryInFirstScreen(),
          getStartedButton(),
        ],
      ),
    );
  }

  Widget getStartedButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: AnimatedOpacity(
          opacity: isPressed ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          child: InkWell(
            onTap: () {
              setState(() {
                isPressed = true;
                _moveCircles();
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    endanim = true;
                  });
                });
              });
            },
            child: Container(
              height: 60,
              width: width * .75,
              decoration: BoxDecoration(
                color: const Color(0xff5b8179),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryInFirstScreen() {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(children: [
                  const SizedBox(width: 50),
                  AnimatedOpacity(
                    opacity: isPressed ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: AnimatedSlide(
                      offset: isPressed ? const Offset(-1, 0) : Offset.zero,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Container(
                        height: 150,
                        width: 1.5,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  AnimatedOpacity(
                    opacity: isPressed ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: AnimatedSlide(
                      offset: isPressed ? const Offset(1, 0) : Offset.zero,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: const Text(
                        'Furniture\nin your\noffice',
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ]),
              ),
              const Spacer(),
              AnimatedSlide(
                offset: isPressed ? const Offset(-1, 0) : Offset.zero,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Center(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.5,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          margin: const EdgeInsets.all(40),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            right: isPressed ? -200 : 0,
            top: 170,
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/light.png',
                height: MediaQuery.of(context).size.height * 0.5 + 100,
                width: 200,
              ),
            ),
          ),
          if (isPressed)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: const Text(
                    'A L L  Y O U R  D R E A M S  C O M E  T R U E',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          !endanim
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  left: isPressed
                      ? MediaQuery.of(context).size.width / 2 - 120
                      : -35,
                  top: isPressed
                      ? MediaQuery.of(context).size.height / 2 - 50
                      : 95,
                  child: AnimatedScale(
                    scale: goto2screen ? 2.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedDefaultTextStyle(
                        style: TextStyle(
                          fontSize: isPressed ? 50 : 28,
                          fontWeight: FontWeight.w500,
                          color: isPressed
                              ? Colors.white
                              : const Color.fromARGB(255, 207, 138, 87),
                        ),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: AnimatedRotation(
                          turns: isPressed ? 0 : -0.25,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: const Text(
                            'sanko shop',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18, left: 18),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 1, end: 100),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInCubic,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        print("Current scale value: $value");

                        // استخدم Future.delayed لتأخير الانتقال
                        if (value == 100) {
                          Future.delayed(const Duration(milliseconds: 1), () {
                            goto2homeScreen();
                          });
                        }

                        return Transform.scale(
                          scale: value,
                          child: const Text(
                            'sanko shop',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required double changWidth1,
    required double changHight1,
    required double sizeofContainer,
    required this.thiscolor,
    this.iffull = false,
  })  : _changWidth1 = changWidth1,
        _changHight1 = changHight1,
        _sizeofContainer = sizeofContainer;

  final double _changWidth1;
  final double _changHight1;
  final double _sizeofContainer;
  final Color thiscolor;
  final bool iffull;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: double.infinity,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
        transform: Matrix4.translationValues(_changWidth1, _changHight1, 0),
        width: _sizeofContainer,
        height: _sizeofContainer,
        decoration: iffull
            ? BoxDecoration(
                color: thiscolor,
                shape: BoxShape.circle,
              )
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: thiscolor, width: 2),
              ),
      ),
    );
  }
}
