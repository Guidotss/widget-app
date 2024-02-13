import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final themeProvider = StateProvider ((ref) => false); 

// Listado de colores inmutable. 
final colorListProvider = Provider((ref) => appColors);

final selectedColorProvider = StateProvider((ref) => appColors[0]);

// Un objeto de tipo AppTheme (Custom) que contiene el color seleccionado y el modo oscuro
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(), 
); 

// Controller o notifier para el cambio de tema
class ThemeNotifier extends StateNotifier<AppTheme>{
  //State = Nueva instancia de AppTheme
  ThemeNotifier(): super(AppTheme());

  void toggleDarkTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int? index){
    state = state.copyWith(selectedColor: index);
  }

}