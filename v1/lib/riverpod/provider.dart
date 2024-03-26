import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/model/shopping_item_model.dart';
import 'package:v1/riverpod/state_notifier_provider.dart';

//Provider안에 Provider
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {

  //filterState와 shoppingListState의 상태를 전달받고 상태가 변경될 때 마다 build 재실행
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);

  if(filterState == FilterState.all) {
    return shoppingListState;
  }

  return shoppingListState.where((e)
    => filterState == FilterState.spicy ? e.isSpicy : !e.isSpicy
  ).toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);