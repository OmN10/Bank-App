import 'package:bank_appp/view/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Ob extends StatefulWidget {
  const Ob({super.key});

  @override
  State<Ob> createState() => _ObState();
}

class _ObState extends State<Ob> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.20,
                    right: MediaQuery.of(context).size.width * 0.10,
                    child: Container(child: Image.asset("assets/on1.png")),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Fastest Payment in\n        the world",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.64,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Integrate multiple payment methoods to help\n            you up the process quickly",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.height * 0.021,
                    bottom: MediaQuery.of(context).size.height * 0.10,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.page?.round() == 0) {
                            controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),

                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.17,
                    right: MediaQuery.of(context).size.width * 0.13,
                    child: Container(child: Image.asset("assets/on2.png")),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.55,
                    right: MediaQuery.of(context).size.width * 0.12,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "     The most Secoure\n Platfrom for Customer",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.68,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Integrate multiple payment methoods to help\n            you up the process quickly",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.height * 0.040,
                    bottom: MediaQuery.of(context).size.height * 0.10,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.page?.round() == 1) {
                            controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),

                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.17,
                    right: MediaQuery.of(context).size.width * 0.10,
                    child: Container(child: Image.asset("assets/on3.png")),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.53,
                    right: MediaQuery.of(context).size.width * 0.08,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Paying for Everything is\n Easy and Convenient",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.65,
                    right: MediaQuery.of(context).size.width * 0.05,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "   Built-in Fingerprint, face recognition\n and more, keeping you completely safe",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.height * 0.040,
                    bottom: MediaQuery.of(context).size.height * 0.10,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.page?.round() == 2) {
                            controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),

                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 170,
            left: MediaQuery.of(context).size.width * 0.5 - (16 * 3) / 2,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                dotHeight: 15,
                dotWidth: 12,
                activeDotColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
