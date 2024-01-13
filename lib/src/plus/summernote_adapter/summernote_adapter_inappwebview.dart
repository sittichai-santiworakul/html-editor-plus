import 'package:html_editor_plus/src/plus/core/editor_callbacks.dart';

import '../core/enums.dart';
import 'summernote_adapter.dart';

class SummernoteAdapterInappWebView extends SummernoteAdapter {
  @override
  String get platformSpecificJavascript => """
""";

  SummernoteAdapterInappWebView({
    required super.key,
    super.summernoteSelector = "\$('#summernote-2')",
    super.hint,
    super.resizeMode = ResizeMode.resizeToParent,
    super.customOptions = const [],
    super.maximumFileSize = 10485760,
    super.spellCheck = false,
    super.enableOnBlur = false,
    super.enableOnFocus = false,
    super.enableOnImageUpload = false,
    super.enableOnImageUploadError = false,
    super.enableOnKeyup = false,
    super.enableOnKeydown = false,
    super.enableOnMouseUp = false,
    super.enableOnMouseDown = false,
    super.enableOnUrlPressed = false,
  });

  @override
  String messageHandler({
    required EditorCallbacks event,
    String? payload,
  }) {
    final effectivePayload = (payload != null) ? ", 'payload': $payload" : "";
    return 'window.flutter_inappwebview.callHandler("onSummernoteEvent", JSON.stringify({"key": "$key", "type": "toDart", "method": "$event" $effectivePayload}));';
  }
}
