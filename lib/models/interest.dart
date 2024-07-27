import 'package:flutter/material.dart';

class Interest {
  final String name;
  final String description;
  final IconData icon; // 아이콘 필드 추가

  Interest({
    required this.name,
    required this.description,
    required this.icon, // 아이콘 필드 초기화
  });
}