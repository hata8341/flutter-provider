import 'package:flutter/material.dart';
import 'package:flutter_provider/controller/home_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(homePageNotifierProvider);
    final pageNotifier = ref.read(homePageNotifierProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main count: ${pageState.mainCount}'),
            onTap: pageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub count: ${pageState.subCount}'),
            onTap: pageNotifier.increaseSubCount,
          ),
          ListTile(
            title: Text('Maun Count: ${pageState.mainCount}'),
            onTap: pageNotifier.decreaseMainCount,
          ),
          ListTile(
            title: Text('Sub count: ${pageState.subCount}'),
            onTap: pageNotifier.decreaseSubCount,
          ),
        ],
      ),
    );
  }
}
