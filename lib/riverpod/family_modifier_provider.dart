import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * family modifier
 * 생성 시 외부에서 파라미터를 전달해야 할 때 사용
 * 어떤 provider를 사용해도 상관없음
 */
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(5, (index) => index * data);
});