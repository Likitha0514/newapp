import 'package:flutter/material.dart';

void main() {
  runApp(const SorryGiftApp());
}

class SorryGiftApp extends StatelessWidget {
  const SorryGiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorrryyyy',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const SorryGiftScreen(),
    );
  }
}

class SorryGiftScreen extends StatefulWidget {
  const SorryGiftScreen({super.key});

  @override
  State<SorryGiftScreen> createState() => _SorryGiftScreenState();
}

class _SorryGiftScreenState extends State<SorryGiftScreen> {
  bool showGift = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        // Transparent Overlay
        child: Container(
          color: Colors.black.withOpacity(0.45),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I’m Really Sorry 🥺❤️",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),

                    child: showGift
                        ? Column(
                            key: const ValueKey("sorry"),

                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),

                                child: Image.asset(
                                  "assets/images/img_sorry.jpg",
                                  height: 260,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 20),

                              const Text(
                                "Please forgive me 😭❤️",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            key: const ValueKey("gift"),

                            borderRadius: BorderRadius.circular(25),

                            child: Image.asset(
                              "assets/images/img_gift.jpg",
                              height: 260,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showGift = !showGift;
                      });
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: Text(
                      showGift ? "Close" : "Click Here 😍🎁",

                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
