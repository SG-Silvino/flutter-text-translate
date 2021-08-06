import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

// ignore: must_be_immutable
class TextTranslate extends StatefulWidget {
  String? from = 'auto';
  String? to = 'en';

  String? text;
  Key? key;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  TextOverflow? overflow;
  double? textScaleFactor;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;

  TextTranslate(this.text,
      {this.from,
      this.to,
      this.key,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior});

  @override
  _TextTranslateState createState() => _TextTranslateState();
}

class _TextTranslateState extends State<TextTranslate> {
  RetryClient _retryClient = RetryClient(http.Client());

  Future<String> translate(String? text, String? from, String? to) async {
    Map<String, dynamic> queryParameters = {
      'sl': from,
      'tl': to,
      'q': text,
    };
    Uri uri = Uri.https(
      "translate.google.com",
      "/m",
      queryParameters,
    );
    final response = await _retryClient.get(uri);

    return parseTranslate(response.body);
  }

  String parseTranslate(String? contents) {
    String? div = '<div class="result-container">';
    int? first = contents!.indexOf(div);
    int? last = contents.indexOf("</div>", first + div.length);

    return contents.substring(first + div.length, last);
  }

  text(String? data) {
    return FutureBuilder<String>(
        future: translate("$data", widget.from, widget.to),
        builder: (context, snapshot) => Text('${snapshot.data ?? '...'}',
            key: widget.key,
            style: widget.style,
            strutStyle: widget.strutStyle,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            locale: widget.locale,
            softWrap: widget.softWrap,
            overflow: widget.overflow,
            textScaleFactor: widget.textScaleFactor,
            maxLines: widget.maxLines,
            semanticsLabel: widget.semanticsLabel,
            textWidthBasis: widget.textWidthBasis,
            textHeightBehavior: widget.textHeightBehavior));
  }

  @override
  Widget build(BuildContext context) {
    return text(
      '${widget.text}',
    );
  }
}
