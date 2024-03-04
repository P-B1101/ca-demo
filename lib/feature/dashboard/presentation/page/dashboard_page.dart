import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  static const path = 'dashboard';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Dashboard page is under construction',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
