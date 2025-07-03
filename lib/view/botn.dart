import 'package:bank_appp/view/ststastics.dart';
import 'package:bank_appp/view/transactio.history.dart';
import 'package:flutter/material.dart';
import 'package:bank_appp/view/dashboard.dart';
import 'package:bank_appp/view/settings.dart';

class Botn extends StatefulWidget {
  const Botn({super.key});

  @override
  State<Botn> createState() => _BotnState();
}

class _BotnState extends State<Botn> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Dashboard(),
    TransactionChartScreen(),
    TransactionHistoryScreen(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder:
            (child, animation) =>
                FadeTransition(opacity: animation, child: child),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart),
            label: 'Stat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
