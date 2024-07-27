import 'package:compass_app/models/direction.dart';
import 'package:compass_app/widgets/compass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CompassScreen extends ConsumerStatefulWidget {
  const CompassScreen({super.key});

  @override
  ConsumerState<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends ConsumerState<CompassScreen> {
  // 현재 선택된 방향
  Direction _currentDirection = Direction.values[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 나침반 UI
          Center(
            child: Compass(
              currentDirection: _currentDirection,
              onDirectionChanged: (direction) {
                // 선택된 방향 업데이트
                setState(() {
                  _currentDirection = direction;
                });
                // 해당 방향의 관심사 리스트 화면으로 이동
                _navigateToInterestScreen(context, direction);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 관심사 리스트 화면으로 이동하는 함수
  void _navigateToInterestScreen(BuildContext context, Direction direction) {
    String routeName;
    switch (direction) {
      case Direction.east:
        routeName = 'fun';
        break;
      case Direction.west:
        routeName = 'exciting';
        break;
      case Direction.south:
        routeName = 'passionate';
        break;
      case Direction.north:
        routeName = 'curious';
        break;
    }
    context.goNamed(routeName);
  }
}