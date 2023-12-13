import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';
import 'package:shield_box/home_page.dart';
import 'package:shield_box/views/auth_view/start_page.dart';
// import 'package:shield_box/api/auth_api.dart';
// import 'package:shield_box/views/auth_view/register_page.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  double value = 0;
  String nickname = "Igor Uchnast";
  // var UserData = ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Stack(
          children: [
            Container(
              width: 200,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nickname,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const [
                        DraweListTitle(
                          textDrawer: "home",
                          drawerIcons: Icons.home,
                        ),
                        DraweListTitle(
                          textDrawer: "log out",
                          drawerIcons: Icons.logout,
                        ),
                        DraweListTitle(
                          textDrawer: "settings",
                          drawerIcons: Icons.settings,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: value,
              ),
              duration: const Duration(milliseconds: 500),
              builder: (_, val, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: const HomePage(),
                );
              },
            ),
            GestureDetector(
              onHorizontalDragUpdate: (e) {
                if (e.delta.dx > 0) {
                  setState(
                    () {
                      value = 1;
                    },
                  );
                } else {
                  setState(() {
                    value = 0;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DraweListTitle extends StatefulWidget {
  const DraweListTitle({
    super.key,
    required this.textDrawer,
    required this.drawerIcons,
  });
  final String textDrawer;
  final IconData drawerIcons;

  @override
  State<DraweListTitle> createState() => _DraweListTitleState();
}

class _DraweListTitleState extends State<DraweListTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StartView(),
          ),
        );
      },
      leading: Icon(
        widget.drawerIcons,
        color: Colors.white,
      ),
      title: Text(
        widget.textDrawer,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
