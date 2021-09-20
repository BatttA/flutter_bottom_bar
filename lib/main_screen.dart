import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/custom_bottom_bar/custom_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _body = [
    const Center(child: Text('First page')),
    const Center(child: FlutterLogo(size: 100)),
    const Center(child: Text('Third page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.15),
            child: IndexedStack(
              index: _selectedIndex,
              children: _body,
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomBar(
              selectedIndex: _selectedIndex,
              onTap: (index) => _changeTab(index),
            ),
          )
        ],
      ),
    );
  }
}
