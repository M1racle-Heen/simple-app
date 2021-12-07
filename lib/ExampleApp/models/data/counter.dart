import 'package:get/get.dart';

class Counter {
  RxInt counter;

  Counter({RxInt? counter}) : counter = counter ?? 0.obs;
}
