import 'package:flutter/material.dart';

import 'bnb_custom_painter.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  CustomBottomBar({required this.selectedIndex, required this.onTap});

  final List<IconData> _icons = [
    Icons.flag,
    Icons.favorite,
    Icons.api,
  ];

  final List<String> _buttonText = [
    'Кнопка',
    '',
    'Кнопка',
  ];

  @override
  Widget build(BuildContext context) {
    final _queryData = MediaQuery.of(context);
    const _bottomBarHeight = 50.0;
    return SizedBox(
      height: _bottomBarHeight,
      width: _queryData.size.width,
      child: CustomPaint(
        size: Size(_queryData.size.width, _bottomBarHeight),
        painter: BNBCustomPainter(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _icons.map((icon) {
            final index = _icons.indexOf(icon);
            if (index == 1) {
              return _customTabBarItem(iconData: icon, index: 1);
            }
            return _tabBarItem(
              iconData: icon,
              index: index,
              buttonText: _buttonText[index],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _tabBarItem({
    required IconData iconData,
    required int index,
    required String buttonText,
  }) {
    final active = selectedIndex == index;
    return FloatingActionButton(
      onPressed: () {
        onTap(index);
      },
      backgroundColor: Colors.white,
      elevation: 0.0,
      foregroundColor: Colors.transparent,
      shape: Border.all(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: active ? Colors.blue : Colors.black,
          ),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 10,
              color: active ? Colors.blue : Colors.black,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _customTabBarItem({required IconData iconData, required int index}) {
    final active = selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onTap(index);
        },
        icon: Container(
          decoration: BoxDecoration(
            color: active
                ? Colors.yellowAccent.withOpacity(0.15)
                : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: active ? Colors.blue : Colors.black12,
            ),
          ),
          child: Center(
            child: Icon(
              iconData,
              color: active
                  ? Colors.red.withOpacity(0.9)
                  : Colors.red.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
