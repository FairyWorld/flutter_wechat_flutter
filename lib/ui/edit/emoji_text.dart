import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';

/// emoji/image text
class EmojiText extends SpecialText {
  static const String flag = "[";
  final int start;

  EmojiText(TextStyle textStyle, {required this.start})
      : super(EmojiText.flag, "]", textStyle);

  @override
  InlineSpan finishText() {
    var key = toString();
    if (EmojiUitl.instance.emojiMap.containsKey(key)) {
      // fontsize is defined by image height
      // size = 30.0 / 26.0 * fontSize
      final double size = 20.0;

      /// fontSize 26 and text height = 30.0
      // final double fontSize = 26.0;

      return ImageSpan(
        AssetImage(EmojiUitl.instance.emojiMap[key]!),
        actualText: key,
        imageWidth: size,
        imageHeight: size,
        start: start,
        fit: BoxFit.fill,
        margin: EdgeInsets.only(left: 2.0, right: 2.0),
      );
    }

    return TextSpan(text: toString(), style: textStyle);
  }
}

class EmojiUitl {
  final Map<String, String> _emojiMap = <String, String>{};

  Map<String, String> get emojiMap => _emojiMap;

  final String _emojiFilePath = "assets/images/emoji";

  static EmojiUitl? _instance;
  static EmojiUitl get instance {
    _instance ??= EmojiUitl._();
    return _instance!;
  }

  EmojiUitl._() {
    for (int i = 1; i < 100; i++) {
      _emojiMap["[$i]"] = "$_emojiFilePath/sg$i.png";
    }
  }
}