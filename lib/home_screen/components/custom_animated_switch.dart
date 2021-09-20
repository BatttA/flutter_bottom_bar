import 'package:flutter/material.dart';

class CustomAnimatedSwitch extends StatelessWidget{
  final AnimationController controller;
  final Function changeSwitch;
  final bool useThreeElements;

  const CustomAnimatedSwitch({
    Key? key,
    required this.controller,
    required this.changeSwitch,
    required this.useThreeElements,
  }) : super(key: key);

  static const _switchWidth = 84.0;
  static const _switchHeight = 46.0;
  static const _switchLabelSize = 40.0;
  static const _padding = 2.0;

  double get switchPosition => _switchWidth - 2 * _padding - _switchLabelSize - 2;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          height: _switchHeight,
          width: _switchWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            children: [
              Positioned(
                left: switchPosition * controller.value,
                child: GestureDetector(
                  onHorizontalDragEnd: (_) => changeSwitch(),
                  child: Container(
                    height: _switchLabelSize,
                    width: _switchLabelSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: AnimatedSwitcher(
                      key: ValueKey<bool>(useThreeElements),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      duration: const Duration(seconds: 1),
                      child: Text(
                        controller.value < (controller.upperBound / 2) ? '3' : '4',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
