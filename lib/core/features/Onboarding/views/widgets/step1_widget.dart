import 'package:flutter/material.dart';

class SplashscreenWidget extends StatefulWidget {
  const SplashscreenWidget({
    super.key,
    this.width,
    this.height,
    required this.splash1,
  });

  final double? width;
  final double? height;
  final String splash1;

  @override
  State<SplashscreenWidget> createState() => _SplashscreenWidgetState();
}

class _SplashscreenWidgetState extends State<SplashscreenWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  Stack(
        children: [
          Positioned(
              bottom: height * 0.65,
              left: 0,
              right: 0,
              height: height * 0.28,
              child: const Padding(
                padding: EdgeInsets.only(
                    top: 16, bottom: 10, right: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        "AKOMBI",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Center(
                      child: Text(
                        "By Tuigha.Inc",
                        style: TextStyle(
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: height * 0.80,
            child: Transform.rotate(
              angle: 3.14,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: ClipPath(
                      clipper: WaveClipper(waveDeep: 50, waveDeep2: 0),
                      child: Container(
                        // padding: const EdgeInsets.only(bottom: 0),
                        color: const Color.fromARGB(255, 182, 171, 244),
                        height: height * 0.667,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 0,
                      child: ClipPath(
                        clipper: WaveClipper(waveDeep: 0, waveDeep2: 50),
                        child: Container(
                          // padding: const EdgeInsets.only(bottom: 0),
                          color: const Color.fromARGB(255, 4, 39, 78),
                          height: height * 0.667,
                          alignment: Alignment.center,
                          child: Transform.rotate(
                            angle: 3.14,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.15, //height  0.18,
                                ),
                                SizedBox(
                                  height: 220,
                                  width: 220,
                                  child: Image.network(
                                    "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/delay-splesh-screen-cy7gop/assets/z0qm2zfp8lm5/splash-1.png",
                                    // widget.splash1,
                                    // "assets/images/splash-1.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, bottom: 10),
                                  child: Center(
                                    child: Text(
                                      "HOME ASSISTANT LISTINGS",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 24, right: 24, bottom: 15),
                                  child: Center(
                                    child: Text(
                                        "We have a list of nannies and maids readily available to render their services in your home",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 3),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                FloatingActionButton.extended(
                                  backgroundColor: const Color.fromARGB(255, 182, 171, 244),
                                  elevation: 0.5,
                                  onPressed: () {},
                                  label: const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      )
    );

  }
}

class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;

  WaveClipper({this.waveDeep = 50, this.waveDeep2 = 0});

  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25, sh - waveDeep2 * 2);
    final Offset destinationPoint1 = Offset(sw * .5, sh - waveDeep - waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75, sh - waveDeep * 2);
    final Offset destinationPoint2 = Offset(sw, sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height - waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy,
          destinationPoint1.dx, destinationPoint1.dy)
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy,
          destinationPoint2.dx, destinationPoint2.dy)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}