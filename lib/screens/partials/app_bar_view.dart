import 'package:flutter/material.dart';
import 'package:keyp_app/constants/colors.dart';
import 'package:keyp_app/settings/settings_view.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: bgColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: accentColor,
            size: 30,
          ),
          onPressed: () {
            // Open the navigation drawer from anywhere in the app.
            Scaffold.of(context).openDrawer();
          },
        ),
        Text(
          title,
          style: const TextStyle(
              color: defaultText, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: accentColor, size: 30),
          onPressed: () {
            // Navigate to the settings page. If the user leaves and returns
            // to the app after it has been killed while running in the
            // background, the navigation stack is restored.
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ],
    ),
  );
}
