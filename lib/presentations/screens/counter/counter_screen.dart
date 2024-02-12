import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentations/providers/counter_provider.dart';
import 'package:widget_app/presentations/providers/theme_provider.dart';


class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final clickCounter = ref.watch(counterProvider); 
    final isDarkMode = ref.watch(themeProvider); 

    void incrementCounter() {
      ref.read(counterProvider.notifier).state++;

      //ref.read(counterProvider.notifier).update((state) => state + 1) => another way to increment the counter
    }

    void toggleTheme(){
      ref.read(themeProvider.notifier).state = !isDarkMode;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: toggleTheme,
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('valor: $clickCounter', style: const TextStyle(fontSize: 30),)
          ]
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter, 
        child: const Icon(Icons.add),
      )
    ); 
  }
}