enum Direction { east, west, south, north }

extension DirectionExtension on Direction {
  String get name {
    switch (this) {
      case Direction.east:
        return '재밌는 것';
      case Direction.west:
        return '설렘을 느끼는 것';
      case Direction.south:
        return '가슴 뛰게 하는 것';
      case Direction.north:
        return '호기심';
    }
  }

  String get routeName {
    switch (this) {
      case Direction.east:
        return 'fun';
      case Direction.west:
        return 'exciting';
      case Direction.south:
        return 'passionate';
      case Direction.north:
        return 'curious';
    }
  }
}
