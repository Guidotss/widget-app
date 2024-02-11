import 'package:go_router/go_router.dart';
import 'package:widget_app/presentations/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen()
  ),
  GoRoute(
    path: '/buttons',
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: CardsScreen.name,
    builder: (context, state) => const CardsScreen()
  ),
  
  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbars',
    name: SnackBarScreen.name,
    builder: (context, state) => const SnackBarScreen(),
  ),
  GoRoute(
    path: '/animated_container',
    name: AnimatedScreen.name, 
    builder: (context, state) => const AnimatedScreen(),
  ),
]);
