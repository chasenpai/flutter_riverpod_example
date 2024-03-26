import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/layout/default_layout.dart';
import 'package:v1/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin{

  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider), //initState안에서는 watch를 하면 안된다
    );
  }

  @override
  Widget build(BuildContext context) {

    //listen은 provider의 상태값을 구독한다
    //watch는 상태값이 변경되면 build를 다시 하지만 listen은 함수를 실행
    //provider의 값이 변경될 때 마다 controller를 실행
    //중복으로 listen되지 않도록 riverpod이 설계되어 있어 dispose할 필요없다
    ref.listen<int>(listenProvider, (previous, next) {
      if(previous != next) {
        controller.animateTo(next,);
      }
    });
    
    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(10, (index) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString(),),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).
                    update((state) => state == 10 ? 10 : state + 1);
                },
                child: Text('Next',),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).
                    update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text('Previous',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
