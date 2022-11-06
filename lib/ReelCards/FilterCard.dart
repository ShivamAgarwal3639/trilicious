import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  const FilterCard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset('assets/images/dimsum.png',
              height: 80,
              width: 80,
              fit: BoxFit.cover),
        )
    );
  }
}