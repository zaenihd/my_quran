import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/helper/route_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: InkWell(
        onTap: () {
          context.go(RouteName.detail);
        },
        child: Text("heloo")),),
    );
  }
}