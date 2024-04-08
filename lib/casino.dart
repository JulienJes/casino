import 'package:casino/bandit_manchot.dart';
import 'package:flutter/material.dart';

class Casino extends StatelessWidget {
  const Casino({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Casino', home: BanditManchot());
  }
}
