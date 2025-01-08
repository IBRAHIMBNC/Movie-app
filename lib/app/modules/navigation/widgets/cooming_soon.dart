import 'package:flutter/material.dart';
import 'package:movie_app/app/widgets/my_text.dart';

class CoomingSoon extends StatelessWidget {
  const CoomingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText.title('Comming Soon'),
    );
  }
}
