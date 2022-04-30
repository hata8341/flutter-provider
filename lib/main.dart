import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProviderPage(),
    );
  }
}

final counterProvider = StateProvider((ref) => 0);

final doubleCountProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  static const String title = 'ProviderPage';
  // static const String routeName = 'provider-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterProvider.notifier);
    final count = ref.watch(doubleCountProvider);

    return Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ElevatedButton(
          onPressed: () {
            print(counter.state);
            counter.update((state) => state + 1);
          },
          child: Text('Increase Count: $count'),
        ));
  }
}
