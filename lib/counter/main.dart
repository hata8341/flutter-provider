import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListenProviderPage(),
    );
  }
}

class ListenProviderPage extends ConsumerWidget {
  const ListenProviderPage({Key? key}) : super(key: key);
  static String title = 'listenProvider';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(
      counterProvider,
      (previous, next) {
        if (next.isEven) return;
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('今の値は,奇数です'),
            );
          },
        );
      },
      onError: (error, stackTrace) => debugPrint('$error'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Count:${ref.watch(counterProvider)}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Gap(32),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text('incremment'),
                ),
              ],
            )),
      ),
    );
  }
}
