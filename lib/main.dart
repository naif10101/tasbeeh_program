import 'package:flutter/material.dart';

// نقطة الدخول للتطبيق
void main() {
  runApp(const MyApp());
}

// تعريف MyApp كودجت رئيسي
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}

// تعريف Homescreen كودجت حالة
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

// حالة Homescreen
class _HomescreenState extends State<Homescreen> {
  int count = 0;
  int currentDuaIndex = 0;

  final List<String> duas = [
    "اللهم اغفر لي ذنبي",
    "اللهم ارحمني برحمتك",
    "اللهم ارزقني رزقاً حلالاً طيباً",
    "اللهم اشفني واشف مرضى المسلمين",
  ];

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  void _resetCounter() {
    setState(() {
      count = 0;
    });
  }

  void _nextDua() {
    setState(() {
      currentDuaIndex = (currentDuaIndex + 1) % duas.length;
    });
  }

  void _previousDua() {
    setState(() {
      currentDuaIndex = (currentDuaIndex - 1 + duas.length) % duas.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
        title: Text(
          "وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنتُمُ الْأَعْلَوْنَ إِن كُنتُم مُّؤْمِنِينَ",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print("Settings icon pressed");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.50,
                    height: MediaQuery.of(context).size.height / 2.50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 6),
                          blurRadius: 15,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Text(
                          count.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      duas[currentDuaIndex],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Transform.translate(
                    offset: Offset(0, 9),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 6),
                                blurRadius: 15,
                                color: Colors.black.withOpacity(0.2)),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: _incrementCounter,
                                child: Icon(Icons.add, size: 15),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  minimumSize: Size(40, 40),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: _resetCounter,
                                child: Icon(Icons.refresh, size: 15),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                  minimumSize: Size(40, 40),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: _previousDua,
                          child: Icon(Icons.arrow_back),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            minimumSize: Size(20, 20),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _nextDua,
                          child: Icon(Icons.arrow_forward),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            minimumSize: Size(20, 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
