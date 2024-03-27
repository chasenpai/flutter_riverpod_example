import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * StreamProvider
 * Stream 타입만 반환가능
 * API 요청의 결과를 Stream으로 반환할 때 주로 사용
 * 소켓 등
 */
final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for(int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield List.generate(5, (index) => index * i);
  }
});