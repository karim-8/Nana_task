import 'package:flutter/material.dart';

class UnknownRouteWidget extends StatelessWidget {
  const UnknownRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Unknown Route',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text(
              'Back to Home Products',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
