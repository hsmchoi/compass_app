//interest_provider.dart

import 'package:compass_app/models/direction.dart';
import 'package:compass_app/models/interest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 각 방향에 해당하는 관심사 목록을 상태로 관리하는 StateNotifierProvider
final interestProvider =
    StateNotifierProvider<InterestNotifier, Map<Direction, List<Interest>>>(
        (ref) => InterestNotifier());

// 각 방향에 해당하는 관심사 목록을 제공하는 Provider
final funInterestProvider = Provider<List<Interest>>(
    (ref) => ref.watch(interestProvider)[Direction.east]!); // '재밌는 것'

final excitingInterestProvider = Provider<List<Interest>>(
    (ref) => ref.watch(interestProvider)[Direction.west]!); // '설렘을 느끼는 것'

final passionateInterestProvider = Provider<List<Interest>>(
    (ref) => ref.watch(interestProvider)[Direction.south]!); // '가슴 뛰게 하는 것'

final curiousInterestProvider = Provider<List<Interest>>(
    (ref) => ref.watch(interestProvider)[Direction.north]!); // '호기심'

class InterestNotifier extends StateNotifier<Map<Direction, List<Interest>>> {
  InterestNotifier()
      : super({
          Direction.east: [
            Interest(
              name: '코딩',
              description: '새로운 기술을 배우고 멋진 앱을 만들어요!',
              icon: Icons.code, // 아이콘 설정
            ),
            Interest(
              name: '게임',
              description: '흥미진진한 게임 세계에 빠져보세요!',
              icon: Icons.sports_esports, // 아이콘 설정
            ),
            // 추가적인 '재밌는 것' 항목들
          ],
          Direction.west: [
            Interest(
              name: '여행',
              description: '세계 곳곳을 여행하며 새로운 경험을 쌓아요!',
              icon: Icons.flight_takeoff, // 아이콘 설정
            ),
            Interest(
              name: '새로운 음식 체험',
              description: '맛있는 음식으로 세상을 탐험해 보세요!',
              icon: Icons.restaurant_menu, // 아이콘 설정
            ),
            // 추가적인 '설렘을 느끼는 것' 항목들
          ],
          Direction.south: [
            Interest(
              name: '프로젝트 개발',
              description: '세상을 바꿀 멋진 프로젝트를 만들어 보세요!',
              icon: Icons.build, // 아이콘 설정
            ),
            Interest(
              name: '문제 해결',
              description: '어려운 문제를 해결하며 성장하는 즐거움을 느껴보세요!',
              icon: Icons.lightbulb_outline, // 아이콘 설정
            ),
            // 추가적인 '가슴 뛰게 하는 것' 항목들
          ],
          Direction.north: [
            Interest(
              name: '인공지능',
              description: '미래를 이끌어갈 인공지능 기술에 대해 알아보세요!',
              icon: Icons.computer, // 아이콘 설정
            ),
            Interest(
              name: '블록체인',
              description: '탈중앙화된 세상을 만드는 블록체인 기술을 경험해 보세요!',
              icon: Icons.link, // 아이콘 설정
            ),
            // 추가적인 '호기심' 항목들
          ],
        });
}
