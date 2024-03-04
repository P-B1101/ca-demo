import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CardsPage extends StatelessWidget {
  static const path = 'cards';
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Cards page is under construction',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
