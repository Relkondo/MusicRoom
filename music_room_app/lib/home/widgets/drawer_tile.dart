import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {Key? key, required this.icon, required this.text, required this.route})
      : super(key: key);
  final IconData icon;
  final String text;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 36,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
      onTap: () {
        if (route != null) {
          String? currentRoute = ModalRoute.of(context)?.settings.name;
          if (currentRoute == '/') {
            if (route != '/') {
              Navigator.of(context).pushNamed(route!);
            }
          } else {
            if (route == '/') {
              Navigator.of(context).pop();
            }
            Navigator.of(context).pushReplacementNamed(route!);
          }
        }
      },
    );
  }
}
