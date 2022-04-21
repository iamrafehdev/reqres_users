import 'package:flutter/material.dart';
import 'package:reqres_users/config/fun_x/widgets/span_function.dart';

/// HighlightedText searchable text
class HighlightedText extends StatelessWidget {
  final String title;
  final String? search;
  final TextStyle? titleStyle;
  final TextStyle? searchStyle;
  final bool boldTitle;

  const HighlightedText(
    this.title, {
    Key? key,
    this.search,
    this.titleStyle,
    this.searchStyle,
    this.boldTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = this.titleStyle;
    var searchStyle = this.searchStyle;

    if (titleStyle == null) {
      if (boldTitle) {
        titleStyle = Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.bold);
      } else {
        titleStyle = Theme.of(context).textTheme.subtitle1;
      }
    }

    if (searchStyle == null) {
      searchStyle = titleStyle?.copyWith(
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      );
    }

    if (search == null) {
      return Text(title, style: titleStyle);
    } else {
      if (search!.isEmpty) {
        return Text(title, style: titleStyle);
      } else {
        List<TextSpan> spans = getSpans(title, search!, searchStyle!);

        return RichText(
          text: TextSpan(
            style: titleStyle,
            children: spans,
          ),
        );
      }
    }
  }
}
