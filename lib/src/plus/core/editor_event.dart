/// Events sent to the editor from the controller.
sealed class EditorEvent {
  /// The summernote API method to call.
  ///
  /// Should match the exact method name in the summernote javascript.
  /// For the list of summernote methods, see:
  /// https://summernote.org/deep-dive/#initialization-options
  final String method;

  /// The data which should be passed to the editor.
  ///
  /// Used it when you need to change a value of a specific property.
  final String? payload;

  const EditorEvent(this.method, [this.payload]);

  @override
  bool operator ==(covariant EditorEvent other) {
    if (identical(this, other)) return true;

    return other.method == method && other.payload == payload;
  }

  @override
  int get hashCode => method.hashCode ^ payload.hashCode;

  @override
  String toString() => "EditorEvents(method: $method, payload: $payload)";
}

/// Notify the editor to change the current html to the [payload].
class EditorSetHtml extends EditorEvent {
  const EditorSetHtml({String? payload}) : super("setHtml", payload);
}

/// Notify the editor to change the view type of the editor.
///
/// It toggles between, normal view and code view.
class EditorToggleView extends EditorEvent {
  const EditorToggleView() : super("codeview.toggle");
}

/// Notifty the editor to clear the content and remove all stored history.
class EditorReset extends EditorEvent {
  const EditorReset() : super("reset");
}

/// Notify the editor to resize itself to the parent widget.
class EditorResizeToParent extends EditorEvent {
  const EditorResizeToParent() : super("resizeToParent");
}

/// Notify the editor to reload itself.
class EditorReload extends EditorEvent {
  const EditorReload() : super("reload");
}

/// Notify the editor to undo the last action.
class EditorUndo extends EditorEvent {
  const EditorUndo() : super("undo");
}

/// Notify the editor to redo the last action.
class EditorRedo extends EditorEvent {
  const EditorRedo() : super("redo");
}

/// Notify the editor to enable the editor field.
class EditorEnable extends EditorEvent {
  const EditorEnable() : super("enable");
}

/// Notify the editor to disable the editor field.
class EditorDisable extends EditorEvent {
  const EditorDisable() : super("disable");
}

/// Notify the editor to get focus the field.
///
/// Currently this event is pretty bugy, due to issues from the framework.
class EditorRequestFocus extends EditorEvent {
  const EditorRequestFocus() : super("tryFocus");
}

/// Notify the editor clear the focus from the field.
class EditorClearFocus extends EditorEvent {
  const EditorClearFocus() : super("blur");
}

/// Custom event
class EditorCustomEvent extends EditorEvent {
  const EditorCustomEvent({required String method, String? payload}) : super(method, payload);
}
