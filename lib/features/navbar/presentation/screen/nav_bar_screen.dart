import 'package:assessment/features/homepage/application/provider.dart';
import 'package:assessment/features/navbar/presentation/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, provider, child) {
      return Scaffold(
       // bottomNavigationBar: Navbar(),
        body: provider.selectedPage,
      );
    });
  }
}
