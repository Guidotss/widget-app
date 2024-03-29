import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';
import 'package:widget_app/presentations/widgets/side_menu.dart';
//import 'package:widget_app/presentations/screens/screens.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scafoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scalfoldKey: scafoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return _CustomListTile(
          menuItem: appMenuItems[index],
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subTitle),
        leading: Icon(menuItem.icon, color: colors.primary),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        onTap: () {
          /* Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ButtonsScreen())); */
          //Navigator.pushNamed(context, menuItem.link); 

          context.push(menuItem.link); 
          /* context.pushNamed(CardsScreen.name);  */
        });
  }
}
