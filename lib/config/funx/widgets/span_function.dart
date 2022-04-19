import 'package:flutter/material.dart';

/// private function for searchable text only
List<TextSpan> getSpans(String text, String matchWord, TextStyle style) {
  List<TextSpan> spans = [];
  int spanBoundary = 0;

  List<String> values = [];
  var length = 0;
  if (matchWord.contains(' ')) {
    values = matchWord.split(' ');
    length = values.length;
  }

  if (length > 1) {
    var currentIndex = 0;

    do {
      // look for the next match
      var startIndex =
          text.toLowerCase().indexOf(values[0].toLowerCase(), spanBoundary);

      // if no more matches then add the rest of the string without style
      if (startIndex == -1) {
        startIndex =
            text.toLowerCase().indexOf(values[1].toLowerCase(), spanBoundary);
        currentIndex = 1;

        if (startIndex == -1) {
          if (length > 2) {
            startIndex = text
                .toLowerCase()
                .indexOf(values[2].toLowerCase(), spanBoundary);
            currentIndex = 2;

            if (startIndex == -1) {
              spans.add(TextSpan(text: text.substring(spanBoundary)));
              return spans;
            }
          } else {
            spans.add(TextSpan(text: text.substring(spanBoundary)));
            return spans;
          }
        }
      }

      // add any unstyled text before the next match
      if (startIndex > spanBoundary) {
        spans.add(TextSpan(text: text.substring(spanBoundary, startIndex)));
      }

      // style the matched text
      final endIndex = startIndex + values[currentIndex].length;
      final spanText = text.substring(startIndex, endIndex);
      spans.add(TextSpan(text: spanText, style: style));

      // mark the boundary to start the next search from
      spanBoundary = endIndex;

      // continue until there are no more matches
    } while (spanBoundary < text.length);
  } else {
    do {
      // look for the next match
      final startIndex =
          text.toLowerCase().indexOf(matchWord.toLowerCase(), spanBoundary);

      // if no more matches then add the rest of the string without style
      if (startIndex == -1) {
        spans.add(TextSpan(text: text.substring(spanBoundary)));
        return spans;
      }

      // add any unstyled text before the next match
      if (startIndex > spanBoundary) {
        spans.add(TextSpan(text: text.substring(spanBoundary, startIndex)));
      }

      // style the matched text
      final endIndex = startIndex + matchWord.length;
      final spanText = text.substring(startIndex, endIndex);
      spans.add(TextSpan(text: spanText, style: style));

      // mark the boundary to start the next search from
      spanBoundary = endIndex;

      // continue until there are no more matches
    } while (spanBoundary < text.length);
  }

  return spans;
}
