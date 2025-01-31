import 'package:flutter/widgets.dart';

class FallbackWidget extends StatelessWidget {
  const FallbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text('<fallback state/>'),
    );
  }
}
