import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

//어떤 privder를 사용할지 고민할 필요 없고
//코드 제너레이션을 사용하면 riverpod이 알아서 결정을 해줌
//AutoDispose가 자동으로 걸린다
final _testProvider = Provider<String>((ref) => 'Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

//keepAlive - AutoDispose를 사용하지 않도록 설정
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFutureV2(GStateFutureV2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}


class Parameter {
  final int num1;
  final int num2;
  Parameter({required this.num1, required this.num2});
}
final _testFamilyProvider = Provider.family<int, Parameter>((ref, param)
  => param.num1 * param.num2
);

//family 파라미터를 일반 함수처럼 사용할 수 있게 해준다
@riverpod
int gStateMultiply(GStateMultiplyRef ref, {
    required int num1,
    required int num2
}) {
  return num1 * num2;
}

//StateNotifier
@riverpod
class GStateNotifier extends _$GStateNotifier {

  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}

