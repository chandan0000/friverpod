// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Counter {
  int count;
  Counter({
    required this.count,
  });
  void increment() {
    count++;
    log(count);
  }
}
