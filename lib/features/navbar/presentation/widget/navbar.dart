import 'package:assessment/features/homepage/application/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Navbar() {
  return Consumer<HomeScreenProvider>(builder: (context, provider, child) {
    return Container(
      height: 60.h,
      //  margin: EdgeInsets.symmetric(horizontal: 50.w),
      padding: EdgeInsets.only(
          left: provider.navbarIndex == 1 ? 4.w : 12.w, right: 12.w),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(43, 43, 43, 1),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              provider.updateNavBarIndex(1);
            },
            child: NavIcon(
              icon: Icons.search,
              selected: provider.navbarIndex == 1,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          NavIcon(
            icon: Icons.message,
            selected: provider.navbarIndex == 2,
          ),
          SizedBox(
            width: 8.w,
          ),
          GestureDetector(
            onTap: () {
              provider.updateNavBarIndex(3);
            },
            child: NavIcon(
              icon: Icons.home,
              selected: provider.navbarIndex == 3,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          NavIcon(
            icon: Icons.favorite,
            selected: provider.navbarIndex == 4,
          ),
          SizedBox(
            width: 8.w,
          ),
          NavIcon(
            icon: Icons.person,
            selected: provider.navbarIndex == 5,
          )
        ],
      ),
    );
  });
}

class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const NavIcon({super.key, required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selected
              ? const Color.fromRGBO(240, 161, 61, 1)
              : const Color.fromRGBO(28, 28, 34, 1),
          shape: BoxShape.circle),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 400),
        padding: EdgeInsets.all(selected ? 12.w : 8.w),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
