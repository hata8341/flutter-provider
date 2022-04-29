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

final counterProvider = StateProvider<int>((ref) => 0);

final doubleCountProvider = Provider<int>((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  static const String title = 'ProviderPage';
  static const String routeName = 'provider-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterController = ref.watch(counterProvider.notifier);
    final count = ref.watch(doubleCountProvider);

    return Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ElevatedButton(
          onPressed: () => counterController.update((state) => state++),
          child: Text('Increase Count: $count'),
        ));
  }
}
