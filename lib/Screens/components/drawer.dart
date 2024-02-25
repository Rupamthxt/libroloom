import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.upload),
              title: Text('Book Upload'),
              onTap: () => Navigator.pushNamed(context, '/upload'),
            )
          ],
        ),
      ),
    );
  }
}
