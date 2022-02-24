import 'package:flutter/material.dart';

class UnderLineText extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onTap;
  const UnderLineText(
      {Key? key, required this.text, required this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.clip,
            ),
            Row(
              children: [
                for (int i = 0; i <= textSize.width / 5; i++)
                  Container(
                    width: 5,
                    height: 2,
                    color: color,
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Size _textSize(String text) {
    final TextPainter textPinter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: double.infinity, minWidth: 0);
    return textPinter.size;
  }
}
