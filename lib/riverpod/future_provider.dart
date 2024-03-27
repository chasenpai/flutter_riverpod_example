import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * FutureProvider
 * Future 타입만 반환가능
 * API 요청의 결과를 반환할 때 주로 사용
 * 복잡한 로직 또는 사용자의 특정 액션 후 Future를 재실행하는 기능은 없다
 * 사실상 별로 유용하지 않음
 */
final multipleFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return [1, 2, 3, 4, 5];
});