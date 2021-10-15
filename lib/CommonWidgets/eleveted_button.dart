import 'package:flutter/material.dart';

class BuildElevatedButton extends StatelessWidget {
  final String buttonname;
  final VoidCallback onpressed;
  final double padding;

  const BuildElevatedButton({
    Key key,
    this.buttonname,
    this.onpressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
          colors: [
            const Color(
              0xff373ABE,
            ),
            Colors.blue.shade400,
          ],
        ),
      ),
      constraints: const BoxConstraints(
        maxWidth: 160.0,
        maxHeight: 37.0,
      ),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          onPrimary: Colors.transparent,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
          ),
        ),
        child: Text(
          buttonname,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
