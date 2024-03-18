import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;

  const MyButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(name),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
