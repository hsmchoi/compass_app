import 'package:compass_app/screens/compass/compass_screen.dart';
import 'package:compass_app/screens/interests/curious_screen.dart';
import 'package:compass_app/screens/interests/exciting_screen.dart';
import 'package:compass_app/screens/interests/fun_detail_screen.dart';
import 'package:compass_app/screens/interests/fun_screen.dart';
import 'package:compass_app/screens/interests/passionate_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/direction.dart';
import '../providers/interest_provider.dart';
import '../screens/interests/curious_detail_screen.dart';
import '../screens/interests/exciting_detail_screen.dart';
import '../screens/interests/passionate_detail_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CompassScreen(),
        name: 'compass',
      ),
      GoRoute(
        path: '/fun',
        builder: (context, state) => const FunScreen(),
        name: 'fun',
        routes: [
          GoRoute(
            path: ':interestName',
            builder: (context, state) {
              final interestName = state.pathParameters['interestName']!;
              final interest = ref
                  .read(interestProvider)[Direction.east]!
                  .firstWhere((element) => element.name == interestName);
              return FunDetailScreen(
                interest: interest,
              );
            },
            name: 'funDetail',
          ),
        ],
      ),
      GoRoute(
        path: '/exciting',
        builder: (context, state) => const ExcitingScreen(),
        name: 'exciting',
        routes: [
          GoRoute(
            path: ':interestName',
            builder: (context, state) {
              final interestName = state.pathParameters['interestName']!;
              final interest = ref
                  .read(interestProvider)[Direction.west]!
                  .firstWhere((element) => element.name == interestName);
              return ExcitingDetailScreen(
                interest: interest,
              );
            },
            name: 'excitingDetail',
          ),
        ],
      ),
      GoRoute(
        path: '/passionate',
        builder: (context, state) => const PassionateScreen(),
        name: 'passionate',
        routes: [
          GoRoute(
            path: ':interestName',
            builder: (context, state) {
              final interestName = state.pathParameters['interestName']!;
              final interest = ref
                  .read(interestProvider)[Direction.south]!
                  .firstWhere((element) => element.name == interestName);
              return PassionateDetailScreen(
                interest: interest,
              );
            },
            name: 'passionateDetail',
          ),
        ],
      ),
      GoRoute(
        path: '/curious',
        builder: (context, state) => const CuriousScreen(),
        name: 'curious',
        routes: [
          GoRoute(
            path: ':interestName',
            builder: (context, state) {
              final interestName = state.pathParameters['interestName']!;
              final interest = ref
                  .read(interestProvider)[Direction.north]!
                  .firstWhere((element) => element.name == interestName);
              return CuriousDetailScreen(
                interest: interest,
              );
            },
            name: 'curiousDetail',
          ),
        ],
      ),
    ],
  );
});
