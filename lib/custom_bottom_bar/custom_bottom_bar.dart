import 'package:flutter/material.dart';

import 'components/bnb_custom_painter.dart';
import 'components/bottom_bar_element.dart';

class CustomBottomBar extends StatelessWidget {
  final bool userTreeElements;
  final int selectedIndex;
  final Function(int) onTap;

  CustomBottomBar(
      {required this.selectedIndex,
      required this.onTap,
      required this.userTreeElements});

  final List<IconData> _threeIcons = [
    Icons.flag,
    Icons.favorite,
    Icons.api,
  ];

  final List<IconData> _fourIcons = [
    Icons.stream,
    Icons.category,
    Icons.zoom_out_map,
    Icons.ac_unit,
  ];

  final List<String> _threeButtonsText = [
    'Кнопка',
    '',
    'Кнопка',
  ];

  final List<String> _fourButtonsText = [
    'Кнопка',
    'Кнопка',
    'Кнопка',
    'Кнопка',
  ];

  @override
  Widget build(BuildContext context) {
    final _queryData = MediaQuery.of(context);
    const _bottomBarHeight = 50.0;
    if (userTreeElements) {
      return SizedBox(
        height: _bottomBarHeight,
        width: _queryData.size.width,
        child: CustomPaint(
          size: Size(_queryData.size.width, _bottomBarHeight),
          painter: BNBCustomPainter(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _threeIcons.map((icon) {
              final index = _threeIcons.indexOf(icon);
              final active = selectedIndex == index;
              if (index == 1) {
                return CircleBottomBarItem(
                  onTap: onTap,
                  index: index,
                  iconData: icon,
                  active: active,
                );
              }
              return SquareBottomBarItem(
                iconData: icon,
                index: index,
                onTap: onTap,
                text: _threeButtonsText[index],
                active: active,
              );
            }).toList(),
          ),
        ),
      );
    }
    return Container(
      height: _bottomBarHeight,
      width: _queryData.size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _fourIcons.map((icon) {
          final index = _fourIcons.indexOf(icon);
          final active = selectedIndex == index;
          return SquareBottomBarItem(
            iconData: icon,
            index: index,
            onTap: onTap,
            text: _fourButtonsText[index],
            active: active,
          );
        }).toList(),
      ),
    );
  }
}
