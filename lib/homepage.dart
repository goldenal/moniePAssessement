import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color(0xfffdd1a8),
            ],
          )),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/svg/loc.svg")),
                    const Text("Saint Petersburg")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
