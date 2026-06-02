import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

class CardActivity extends StatelessWidget {
  const CardActivity({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
    required this.currentResult,
    super.key,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final MaterialColor color;
  final String currentResult;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultSpacing, horizontal: 8),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Card(
                shape: const CircleBorder(),
                color: color[100],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(icon, color: color[300]),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: .w600),
                    ),
                  ),
                  Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 50,
                child: Text(
                  currentResult,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: .bold),
                  overflow: .ellipsis,
                  textAlign: .center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
