import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * auto dispose modifier
 * 메모리에서 필요가 없을 때 자동으로 provider를 삭제
 */
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return [1, 2, 3, 4, 5];
});