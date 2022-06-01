import 'package:flutter/material.dart';

class SearchButtom extends StatelessWidget {
  const SearchButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: const Text('Buscar'),
        onPressed: () {},
      ),
    );
  }
}
