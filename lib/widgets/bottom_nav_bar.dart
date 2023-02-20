import 'package:flutter/material.dart';
import 'package:singularsplash/utils/my_state.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    return NavigationBar(
        onDestinationSelected: (value) {
          pageState.changePage(value);
          pageController.jumpToPage(value);
        },
        selectedIndex: pageState.currentPage,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Inicio",
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: "Explora",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: "Favoritos",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: "Configuración",
          ),
        ]);
  }
}
