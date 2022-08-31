import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _createItem(IconData icon, String label, Function() onTap) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      );
    }

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primary,
              alignment: Alignment.bottomCenter,
              child: const Text(
                'Vamos Cozinhar?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _createItem(
              Icons.restaurant,
              'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            _createItem(
              Icons.settings_rounded,
              'Configurações',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
