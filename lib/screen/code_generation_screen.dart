import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/layout/default_layout.dart';
import 'package:v1/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFutureV2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(num1: 2, num2: 3));

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('state1: $state1'),
          state2.when(
            data: (data) => Text(
              'state2: $data',
              textAlign: TextAlign.center,
            ),
            error: (err, stack) => Text(
              err.toString(),
              textAlign: TextAlign.center,
            ),
            loading: () => Center(
                child: CircularProgressIndicator()
            ),
          ),
          state3.when(
            data: (data) => Text(
              'state3: $data',
              textAlign: TextAlign.center,
            ),
            error: (err, stack) => Text(
              err.toString(),
              textAlign: TextAlign.center,
            ),
            loading: () => Center(
                child: CircularProgressIndicator()
            ),
          ),
          Text('state4: $state4'),
          //_StateFiveWidget(),
          Consumer(
            //상위 빌드가 재실행되지 않고 이 빌더 함수가 재실행 된다
            builder: (context, ref, child) {
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('state5: $state5'),
                  child!,
                ],
              );
            },
            //여기 넣는 child를 빌더 함수의 child로 제공
            //해당 위젯은 단 한번만 렌더링 된다
            child: Text(' hello'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('up'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('down'),
              ),
              //invalidate - state를 초기 상태로 되돌림
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(gStateNotifierProvider);
                },
                child: Text('invalidate'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//state가 변경되면 빌드가 다시 실행된다
//ConsumerWidget으로 감싸서 부분적으로 빌드
//하지만 코드 템플릿이 많아진다 - Consumer 위젯 제공
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text('state5: $state5');
  }
}

