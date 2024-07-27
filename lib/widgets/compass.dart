import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_animate/flutter_animate.dart';

class Compass extends StatefulWidget {
  final Direction currentDirection;
  final Function(Direction) onDirectionChanged;

  const Compass({
    super.key,
    required this.currentDirection,
    required this.onDirectionChanged,
  });

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _currentAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _updateAngle(widget.currentDirection);
  }

  @override
  void didUpdateWidget(covariant Compass oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentDirection != widget.currentDirection) {
      _updateAngle(widget.currentDirection);
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateAngle(Direction direction) {
    switch (direction) {
      case Direction.east:
        _currentAngle = 0.0;
        break;
      case Direction.west:
        _currentAngle = math.pi;
        break;
      case Direction.south:
        _currentAngle = math.pi / 2;
        break;
      case Direction.north:
        _currentAngle = -math.pi / 2;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int nextIndex =
            (Direction.values.indexOf(widget.currentDirection) + 1) %
                Direction.values.length;
        widget.onDirectionChanged(Direction.values[nextIndex]);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _currentAngle * _animation.value;
          return Transform.rotate(
            angle: angle,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/compass_background.png', // 나침반 이미지
                  width: 250,
                  height: 250,
                ),
                Image.asset(
                  'assets/images/compass_needle.png', // 나침반 바늘 이미지
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
