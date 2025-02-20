import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:meta/meta.dart' show experimental;

import '../../quill_delta.dart';
import '../packages/quill_markdown/markdown_to_delta.dart';

class CustomDeltaX {
  static Delta Function(String html)? fromHtml;
}

@experimental
class DeltaX {
  /// Convert Markdown text to [Delta]
  ///
  /// This api is **experimental** and designed to be used **internally** and shouldn't
  /// used for **production applications**.
  @experimental
  @Deprecated(
    '''
    The experimental support for Markdown conversion has been dropped and will be removed in future releases, 
    consider using alternatives such as https://pub.dev/packages/markdown_quill
    ''',
  )
  static Delta fromMarkdown(String markdownText) {
    final mdDocument = md.Document(encodeHtml: false);
    final mdToDelta = MarkdownToDelta(markdownDocument: mdDocument);
    return mdToDelta.convert(markdownText);
  }

  /// Convert the HTML Raw string to [Delta]
  @experimental
  @Deprecated(
    '''
    The experimental support for HTML conversion has been dropped and will be removed in future releases, 
    consider using alternatives such as https://pub.dev/packages/flutter_quill_delta_from_html
    ''',
  )
  static Delta fromHtml(
    String htmlText, {
    @Deprecated(
      '''
    The experimental support for HTML conversion has been dropped and will be removed in future releases, 
    consider using alternatives such as https://pub.dev/packages/flutter_quill_delta_from_html
    ''',
    )
    List<CustomHtmlPart>? customBlocks,
  }) {
    if (CustomDeltaX.fromHtml != null) {
      return CustomDeltaX.fromHtml!(htmlText);
    }
    final htmlToDelta = HtmlToDelta(customBlocks: customBlocks);
    return htmlToDelta.convert(htmlText);
  }
}
