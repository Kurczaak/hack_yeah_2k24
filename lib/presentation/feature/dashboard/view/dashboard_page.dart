import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hack_yeah_2k24/app/router/router.gr.dart';
import 'package:hack_yeah_2k24/presentation/theme/theme_helpers.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        GoogleMapRoute(),
        GoogleMapRoute(),
        GoogleMapRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: context.colorPalette.noise,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_rounded),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Feedback',
            )
          ],
        );
      },
    );
  }
}
