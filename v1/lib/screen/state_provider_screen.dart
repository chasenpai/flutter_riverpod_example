import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/layout/default_layout.dart';
import 'package:v1/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //ref로 StateProvider 접근
    //provider의 값을 얻고 변화를 감지
    //빌드 함수에서 UI에 반영하기 위해 가져오는 경우 watch
    //watch하고 있는 어떤 위젯에서든 똑같은 데이터를 바라본다
    final provider = ref.watch(numberProvider);

    /*
     * ref.read vs ref.watch
     * ref.watch는 반환값의 업데이트가 있을 때 지속적으로 build를 재실행
     * ref.watch는 필수적으로 UI관련 코드에만 사용 - 값이 변경됐을 때 UI가 반응을 해야 하는 경우
     * ref.read는 실행되는 순간 단 한번만 provider를 가져온다
     * ref.read는 onPressed 콜백처럼 특정 액션 뒤에 실행되는 내부 함수에서 사용
     */
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //버튼을 눌렀을 때 실행되는 경우 read
                //state - 현재 상태
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP',),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state =
                ref.read(numberProvider.notifier).state - 1;
              },
              child: Text('DOWN',),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  //값을 넘기거나 받지않고 provider를 사용해서 값 유지
                  MaterialPageRoute(builder: (_) => _NextScreen()),
                );
              },
              child: Text('NEXT',),
            )
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //버튼을 눌렀을 때 실행되는 경우 read
                //state - 현재 상태
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP',),
            )
          ],
        ),
      ),
    );
  }
}
