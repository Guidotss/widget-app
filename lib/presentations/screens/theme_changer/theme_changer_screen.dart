import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentations/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {
  static String name = 'theme_changer_screen';  
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final isDarkMode = ref.watch(themeProvider); */
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: ref.read(themeNotifierProvider.notifier).toggleDarkTheme,
          )
        ],
      ),
      body:const  _ThemeChangerView()
    ); 
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final Color selectedColor = ref.watch(selectedColorProvider);

    void changeColor(int? index){
      ref.read(selectedColorProvider.notifier).state = colorsList[index ?? 0];
    } */
    final List<Color> colorsList = ref.watch(colorListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    

    return ListView.builder(
      itemCount: colorsList.length,
      itemBuilder: (context, index) {
        final color = colorsList[index];
        return RadioListTile(
          value: index,
          groupValue: selectedColor,
          onChanged: ref.read(themeNotifierProvider.notifier).changeColorIndex,
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text(color.value.toRadixString(16)),
          activeColor: color,
        );
      },
    ); 
  }
}

