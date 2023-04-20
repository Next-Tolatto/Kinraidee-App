import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kinraidee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KinraideePage(title: 'Kinraidee'),
    );
  }
}

class KinraideePage extends StatefulWidget {
  const KinraideePage({super.key, required this.title});
  final String title;

  @override
  State<KinraideePage> createState() => _KinraideePageState();
}

class _KinraideePageState extends State<KinraideePage> {

  List<dynamic> _menuList = [];

  @override
  @override
  void initState() {
    super.initState();
    _loadMenuData();
  }

  void _loadMenuData() async {
    // โหลดข้อมูลเมนูอาหารจาก JSON ไฟล์
    String data = await DefaultAssetBundle.of(context).loadString("assets/data/menu.json");
    setState(() {
    _menuList = json.decode(data);
    });
  }

  void _randomMenu() {
    // สุ่มเลขตั้งแต่ 0 ถึงจำนวนเมนูอาหารทั้งหมด
    var random = Random();
    int randomNumber = random.nextInt(_menuList.length);
    // แสดงชื่อเมนูอาหารและรูปภาพของเมนูอาหารที่สุ่มได้
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_menuList[randomNumber]["name"]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("test"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _randomMenu,
              child: Text("Random Menu"),
            ),
          ],
        ),
      ),
    );
  }
}