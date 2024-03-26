import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * StateProvider
 * UI에서 직접 데이터를 변경할 수 있도록 하고싶을 때 사용
 * 단순한 형태의 데이터만 관리
 * Map, List 등의 복합한 데이터를 다루거나 복잡한 로직이 필요한 경우 사용하지 않는다
 */
final numberProvider = StateProvider<int>((ref) => 0); //관리하고 싶은 값을 반환


