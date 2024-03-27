import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

//어떤 privder를 사용할지 고민할 필요 없고
//코드 제너레이션을 사용하면 riverpod이 알아서 결정을 해준다
final _testProvider = Provider<String>((ref) => 'Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Code Generation';
}

//family 파라미터를 일반 함수처럼 사용할 수 있게 해준다


