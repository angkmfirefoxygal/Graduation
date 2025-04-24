import 'package:flutter/material.dart';
import 'package:library_tab/screens/home_tab/home_tab_screen.dart';
import 'screens/study_tab/study_tab.dart'; // 학습페이지 탭
import 'screens/create_tab/create_tab.dart'; // 책 만들기 탭
import 'screens/mypage_tab/mypage_tab.dart'; // 마이페이지 탭

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library Tab Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade700),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFEFA),
      ),
      home: const MainTabController(),
    );
  }
}

class MainTabController extends StatefulWidget {
  const MainTabController({super.key});

  @override
  State<MainTabController> createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeTabScreen(),
    StudyTab(),
    CreateTab(),
    MyPageTab(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.yellow[800],
        unselectedItemColor: Colors.grey[600],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: '서재'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: '학습페이지'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: '책 만들기',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}
