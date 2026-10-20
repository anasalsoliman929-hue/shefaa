import 'package:flutter/material.dart';
import 'package:shefaa/View/pages/widgets/text.dart';

class cardnotification extends StatelessWidget {
  const cardnotification({
    super.key,
    required this.subtitel,
    required this.titel,
  });
  final String titel;
  final String subtitel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: thetext(
        text: 'cdalvjnldv',
        sizetext: 25,
      ),
      subtitle: thetext(
        text: 'fhvfbxvklx',
        sizetext: 20,
      ),
    );
  }
}
