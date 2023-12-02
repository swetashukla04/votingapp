
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  String label;
  double size;
  void Function() onPressed;
  LoginButton({super.key, required this.label,this.size=300.0,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: MaterialButton(
        height: 60.0,
        padding: const EdgeInsets.all(15.0),
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
        color: Colors.blueAccent[200],
        onPressed: this.onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white   
                   ),
        ),
       ),
    );
  }
}
