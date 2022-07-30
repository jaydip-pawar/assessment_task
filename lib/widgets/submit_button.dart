import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final bool hasIcon;

  const SubmitButton(
      {Key? key,
      required this.text,
      required this.callback,
      this.hasIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5, top: 5),
      height: _size.height * 0.075,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), primary: Colors.green.shade800),
        child: hasIcon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 24.0,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
