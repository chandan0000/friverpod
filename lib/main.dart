import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friverpod/class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

Provider<Counter> counterProvider = Provider((ref) => Counter(count: 0));
final counter = StateProvider<Counter>((ref) => ref.watch(counterProvider));

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var val = ref.watch(counter).count;
    return Scaffold(
      appBar: AppBar(
        title: Text('riverpod'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the  $val button this many times:',
          ),

          // ],
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class FakeCountryCodeClient {
//   Future<int> get(String country) async {
//     await Future.delayed(Duration(seconds: 2));
//     return country == 'IN' ? 91 : 0;
//   }
// }

// final fakeCountryCodeClientProvider =
//     Provider((ref) => FakeCountryCodeClient());
// final responseProvider = FutureProvider((ref) async {
//   final countryCodeCLient = ref.read(fakeCountryCodeClientProvider);
//   return countryCodeCLient.get('IN');
// });
