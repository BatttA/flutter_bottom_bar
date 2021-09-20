import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_bottom_bar/home_screen/components/custom_animated_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _index = 0;
  bool _useThreeElements = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _index = 0;
    _useThreeElements = true;
    super.initState();
  }

  void _changeTab(int index) {
    setState(() {
      _index = index;
    });
  }

  void changeBottomBarState() {
    setState(() {
      _index = 0;
      _useThreeElements = !_useThreeElements;
    });
  }

  void changeBottomBar() {
    if (!_controller.isAnimating) {
      if ((_controller.value) == 0) {
        _controller.animateTo(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        ).whenComplete(() => changeBottomBarState());
      } else {
        _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        ).whenComplete(() => changeBottomBarState());
      }
    }
  }

  final List<Widget> _body = [
    const Center(child: FlutterLogo(size: 100)),
    const Center(child: FlutterLogo(size: 100)),
    const Center(child: FlutterLogo(size: 100)),
    const Center(child: FlutterLogo(size: 100)),
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
              index: _index,
              children: _body,
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: CustomAnimatedSwitch(
              controller: _controller,
              changeSwitch: changeBottomBar,
              useThreeElements: _useThreeElements,
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomBar(
              selectedIndex: _index,
              onTap: (index) => _changeTab(index),
              userTreeElements: _useThreeElements,
            ),
          )
        ],
      ),
    );
  }
}
