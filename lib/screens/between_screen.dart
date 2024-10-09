import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanoko_shop2/var.dart';

final player = AudioPlayer();

class BetweenScreen extends StatefulWidget {
  const BetweenScreen({super.key});

  @override
  State<BetweenScreen> createState() => _BetweenScreenState();
}

class _BetweenScreenState extends State<BetweenScreen> {
  double value = 0;
  double value2 = 0;
  bool start = false;
  double _height = 100;
  double _width = 100;

  @override
  void initState() {
    super.initState();

    // Delay before showing the background image
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        value = 1;
      });
    });

    // Delay before showing the logo
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        value2 = 1;
      });
    });

    // Start expanding the container
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        _height = height;
        _width = width;
        start = true;
      });
    });

    // Play the audio after a delay
    Future.delayed(const Duration(milliseconds: 1500), () async {
      // String audioPath =
      //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
      // await player.play(UrlSource(audioPath));
    });

    // Start the logo zoom animation
    Future.delayed(const Duration(milliseconds: 4500), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      height: _height,
      width: _width,
      color: lightOrange,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: value,
            duration: const Duration(milliseconds: 700),
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/background2.png',
                  ),
                  fit: BoxFit.cover,
                ),
                color: lightOrange,
              ),
            ),
          ),
          !start
              ? AnimatedOpacity(
                  opacity: value2,
                  duration: const Duration(milliseconds: 700),
                  child: Center(
                    child: SizedBox(
                        height: 300,
                        width: width,
                        child: SvgPicture.asset('assets/images/logochar.svg')),
                  ),
                )
              : Center(
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 1, end: 30),
                    duration: const Duration(seconds: 4),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Transform.scale(
                        scale: value,
                        child: SvgPicture.asset(
                          'assets/images/logochar.svg',
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
