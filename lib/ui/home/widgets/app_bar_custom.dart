import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).focusColor,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      actions: [
        Icon(
          Icons.search,
          size: 30,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        SizedBox(width: width * 0.02),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
