import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.45),
            Colors.grey.withOpacity(0.75),
            const Color.fromRGBO(47, 41, 53, 0.75)
          ],
          stops: const [0.2, 0.4, 0.71],
        ),
      ),
    );
  }
}
