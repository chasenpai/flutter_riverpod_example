import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/model/shopping_item_model.dart';

/*
 * StateNotifierProvider
 * StaetProvider와 마찬가지로 UI에서 직접 데이터를 변경할 수 있도록 하고싶을 때 사용
 * 복잡한 형태의 데이터 관리가능
 * StateNotifier를 상속한 클래스 반환
 */
final shoppingListProvider =
  StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>> //StateNotifier를 상속한 클래스, 그 클래스가 관리하는 상태의 타입
    ((ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {

  ShoppingListNotifier():
    super([
      ShoppingItemModel(
        name: '햇반',
        quantity: 3,
        hasBought: false,
        isSpicy: false,
      ),
      ShoppingItemModel(
        name: '김치',
        quantity: 5,
        hasBought: false,
        isSpicy: true,
      ),
      ShoppingItemModel(
        name: '라면',
        quantity: 10,
        hasBought: false,
        isSpicy: true,
      ),
      ShoppingItemModel(
        name: '콜라',
        quantity: 20,
        hasBought: false,
        isSpicy: false,
      ),
      ShoppingItemModel(
        name: '치즈',
        quantity: 15,
        hasBought: false,
        isSpicy: false,
      ),
    ]);

  void toggleHasBought({required String name}) {
    //state - super constructor에 들어가는 첫번째 파라미터 값으로 무조건 초기화됨
    state = state.map((e)
      => e.name == name ?
      ShoppingItemModel(
        name: e.name,
        quantity: e.quantity,
        hasBought: !e.hasBought,
        isSpicy: e.isSpicy,
      ) : e
    ).toList();
  }
}