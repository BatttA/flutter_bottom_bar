import 'package:flutter/material.dart';

class SquareBottomBarItem extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  final IconData iconData;
  final String text;
  final bool active;

  const SquareBottomBarItem(
      {Key? key,
      required this.onTap,
      required this.index,
      required this.iconData,
      required this.text,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            text,
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
}

class CircleBottomBarItem extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  final IconData iconData;
  final bool active;

  const CircleBottomBarItem(
      {Key? key,
      required this.onTap,
      required this.index,
      required this.iconData,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
