import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  static const String name = 'snackbar_screen';

  void showCustomSnackbar(BuildContext context){ 
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola, soy un SnackBar'),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) =>  AlertDialog(
        title:  const Text('¿Estas seguro?'),
        content: const Text('¿Quieres cerrar la aplicacion?'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar'),),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'),),
        ],
      ),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              child: const Text('Licencias usadas'),
              onPressed: (){
                showAboutDialog(
                  context: context,
                  applicationName: 'Widget App',
                  applicationVersion: '1.0.0',
                  applicationIcon: const FlutterLogo(),
                  children: const [
                    Text('Widget App es una aplicacion de ejemplo para Flutter'),
                  ],
                ); 
              },
            ),
            FilledButton(
              child: const Text('Mostrar dialogo'),
              onPressed: () => openDialog(context)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined), 
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
} 