import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disable')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_outlined),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessible_forward_rounded),
              label: const Text('Filled Icon'),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined Button')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet_sharp),
              label: const Text('Outlined Icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Text Icon'),
            ),
            const CustomButton(), 
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_business_rounded),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)
                )
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key}); 


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; 

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary, 
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom Button', style: TextStyle(color: Colors.white))
          ),
        ),
      
      ),
    ); 
  }
}