import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/layout/default_layout.dart';
import 'package:v1/riverpod/select_privider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //select를 사용해서 특정 속성만 watch & listen
    //isSpicy가 변경될 때만 build 재실행
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    //hasBought가 변경될 때만 함수 실행
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {
      print('previous: $previous');
      print('next: $next');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString(),),
            // Text(state.name,),
            // Text(state.hasBought.toString(),),
            // Text(state.isSpicy.toString(),),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: Text('Bought Toggle',),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: Text('Spicy Toggle',),
            ),
          ],
        ),
      ),
    );
  }
}
