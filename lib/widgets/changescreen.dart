import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String name;
  final Function onTap;
  final String whichAccount;
  const ChangeScreen(
      {super.key,
      required this.name,
      required this.onTap,
      required this.whichAccount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(whichAccount),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            name,
            style: TextStyle(
                color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
